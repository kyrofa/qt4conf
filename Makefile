arch_triplet := $(shell dpkg-architecture -q DEB_TARGET_MULTIARCH)

define QT4_CONF
./usr/lib/$(arch_triplet)/qt4/bin
./usr/lib/$(arch_triplet)
endef
export QT4_CONF

all:

build:
	@echo "$$QT4_CONF" > snappy-qt4.conf
		
install: build
	install -D -m644 snappy-qt4.conf \
		$(DESTDIR)/etc/xdg/qtchooser/snappy-qt4.conf
	install -D -m755 qt4-launch $(DESTDIR)/bin/qt4-launch
