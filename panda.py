from lxml import html
import requests

# joins the url and extension together
def join(url, ext):
    while url[len(url)-1] != '/':
        url = url[0:len(url)-1]
    return url + ext

start_urls = [
    "http://panda.gtisc.gatech.edu/malrec/"
]
for url in start_urls:
	# print "NEW PAGE!!!!!"
	page = requests.get(url)
	tree = html.fromstring(page.content)
	hrefs = tree.xpath("//a[substring(@href,string-length(@href)-4)='.pcap']/@href")
	for href in hrefs:
		print join(url, href)