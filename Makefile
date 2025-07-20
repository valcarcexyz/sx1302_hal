### Environment constants

ARCH ?=
CROSS_COMPILE ?=
export

### general build targets

.PHONY: all clean install install_conf libtools libloragw packet_forwarder

all: libtools libloragw packet_forwarder

libtools:
	$(MAKE) all -e -C $@

libloragw: libtools
	$(MAKE) all -e -C $@

packet_forwarder: libloragw
	$(MAKE) all -e -C $@

clean:
	$(MAKE) clean -e -C libtools
	$(MAKE) clean -e -C libloragw
	$(MAKE) clean -e -C packet_forwarder

install:
	$(MAKE) install -e -C libloragw
	$(MAKE) install -e -C packet_forwarder

install_conf:
	$(MAKE) install_conf -e -C packet_forwarder

### EOF
