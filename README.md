# pdnsd-recursive-blocklist
Setup pdnsd as a recursive caching DNS server and block malicious domains.

This setup is currently in use in my home network. A raspberry pi acts as a gateway and DNS server using [pdnsd](http://members.home.nl/p.a.rombouts/pdnsd/) configured as a recursive DNS server. A simple bash script updates the block list periodically from a set of sources, removes duplicates and installs it.

## Why a recursive DNS server? Isn't it bad?
Long story short it is bad if exposed outside of the local network, [it's actually good for your privacy](https://www.linuxjournal.com/content/own-your-dns-data) if you use it locally.
It may be just a tiny bit slower compared to contacting a caching DNS server but I do not care.

The following is a picture showing the response time of the server. It is obtained by running `namebench.py --no_gui --input=alexa --only 192.168.13.2 8.8.8.8 9.9.9.9 208.67.222.222 1.1.1.1`

![response time](https://github.com/electricant/pdnsd-recursive-blocklist/raw/master/namebench/response_duration.png)

On average it is the slowest (also thanks to the raspberry pi model B which is old and slow) but if the requested name is cached it is the fastest. In the end I did not notice any slowdown when browsing the web. In fact if we use the "cachehit" test we get a whole different picture:

![cachehit response time](https://github.com/electricant/pdnsd-recursive-blocklist/raw/master/namebench/namebench_cachehit.png)

Now the local recursive DNS server is a clear winner.

## Why pdnsd?
Because it is simple to configure and works well enough.
