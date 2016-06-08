# default, scraps web pages for pcap_urls, then downloads them with curl to the correct directory
.PHONY: all
all:
	rm -rf pcap_urls_panda
	python panda.py > pcap_urls_panda
	sh transfer.sh pcap_urls_panda
	
	rm -rf pcap_urls_mta
	python mta.py > pcap_urls_mta
	sh transfer.sh pcap_urls_mta

panda:
	rm -rf pcap_urls_panda
	python panda.py > pcap_urls_panda
	sh transfer.sh pcap_urls_panda

mta:
	rm -rf pcap_urls_mta
	python mta.py > pcap_urls_mta
	sh transfer.sh pcap_urls_mta

# Transfers the files
.PHONY: transfer
transfer:
	sh transfer.sh pcap_urls_panda
	sh transfer.sh pcap_urls_mta

clean:
	rm -rf pcap_urls_panda
	rm -rf pcap_urls_mta