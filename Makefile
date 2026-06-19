.PHONY: build clean lint syntax

build:
	fakeroot dpkg-buildpackage -b -us -uc

clean:
	fakeroot debian/rules clean
	rm -f ../internet-monitor_*.deb ../internet-monitor_*.changes ../internet-monitor_*.buildinfo

lint: build
	lintian --fail-on error ../*.changes

syntax:
	ruby -c internet_monitor.rb
