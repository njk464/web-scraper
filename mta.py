from lxml import html
import requests

# joins the url and extension together
def join(url, ext):
    while url[len(url)-1] != '/':
        url = url[0:len(url)-1]
    return url + ext

start_urls = [
    "http://www.malware-traffic-analysis.net/2013/index.html",
    "http://www.malware-traffic-analysis.net/2014/index.html",
    "http://www.malware-traffic-analysis.net/2015/index.html",
    "http://www.malware-traffic-analysis.net/2016/index.html"
]
for url in start_urls:
	# print "NEW PAGE!!!!!"
	page = requests.get(url)
	tree = html.fromstring(page.content)
	hrefs = tree.xpath("//ul/li/a[@class='list_header']/@href")
	for href in hrefs:
		follow_url = join(url, href)
		sub_page = requests.get(follow_url)
		sub_tree = html.fromstring(sub_page.content)
		pcaps = sub_tree.xpath("//a[substring(@href,string-length(@href)-4)='.pcap']/@href")
		for pcap in pcaps:
			print join(follow_url, pcap)