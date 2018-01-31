image: src/fluent-bit/build/bin/fluent-bit
	docker build . -t docker-openwrt-fluentbit
src/fluent-bit/build/bin/fluent-bit:
	(cd src/fluent-bit/build && \
	 cmake ../ && make)
clean:
	(cd src/fluent-bit/build && make clean)
.PHONY: image clean

