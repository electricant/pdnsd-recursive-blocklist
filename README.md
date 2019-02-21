# pdnsd-recursive-blocklist
Setup pdnsd as a recursive caching DNS server and block malicious domains.

This setup is currently in use in my home network. A raspberry pi acts as a gateway and DNS server using [pdnsd](http://members.home.nl/p.a.rombouts/pdnsd/) configured as a recursive DNS server. A simple bash script updates the block list periodically from a set of sources, removes duplicates and installs it.

## Why a recursive DNS server? Isn't it bad?
Long story short it is bad if exposed outside of the local network, [it's actually good for your privacy](https://www.linuxjournal.com/content/own-your-dns-data) if you use it locally.
It may be just a tiny bit slower compared to contacting a caching DNS server but I do not care.

## Why pdnsd?
Because it is simple to configure and works well enough.
