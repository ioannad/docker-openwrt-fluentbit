src/fluent-bit/build/bin/fluent-bit:
	(cd src/fluent-bit/build && \
	 cmake ../ && make)
image: src/fluent-bit/build/bin/fluent-bit
	docker build . -t docker-openwrt-fluentbit
.PHONY: image

