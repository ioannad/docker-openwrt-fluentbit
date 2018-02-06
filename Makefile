image: src/fluent-bit/build/bin/fluent-bit
	docker build . -t docker-openwrt-fluentbit
src/fluent-bit/build/bin/fluent-bit:
	(cd src/fluent-bit/build && \
	 cmake ../ && make)
clean:
	(rm -rd src/fluent-bit && git checkout -- src/fluent-bit)
.PHONY: image clean

