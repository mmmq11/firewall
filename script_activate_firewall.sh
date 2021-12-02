#!/bin/bash

# reset settings
sudo iptables --flush
sudo iptables --flush -t nat
sudo ip6tables --flush

# set default policies to DROP (if no ACCEPT is matched, the policy is applied, matching is done one by one from top, once ACCEPT is matched in a chain, no more rules are matched)
sudo iptables -P FORWARD DROP
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP

# block all ipv6 connections
sudo ip6tables -P FORWARD DROP
sudo ip6tables -P INPUT DROP # ACCEPT
sudo ip6tables -P OUTPUT DROP # ACCEPT

sudo iptables -A INPUT  -j ACCEPT -i lo -m comment --comment "loopback" # interprocess communication
sudo iptables -A OUTPUT -j ACCEPT -o lo -m comment --comment "loopback"

sudo iptables -A INPUT  -j ACCEPT -m conntrack --ctstate ESTABLISHED,RELATED -m comment --comment "conntrack" # packets that are part of an existing connection
sudo iptables -A OUTPUT -j ACCEPT -m conntrack --ctstate ESTABLISHED,RELATED -m comment --comment "conntrack"

#sudo iptables -A INPUT -j ACCEPT -p icmp --icmp-type 8 -m comment --comment "PING" # ping my machine from my network
#sudo iptables -A INPUT -j ACCEPT -p tcp --dport 22 -m comment --comment "SSH" # ssh into my machine from my network

# this works (block any domain containing 'porn'); take the rest from wechat. dashes '-' work okay

# to block dots, use [bannedregexpurllist] in e2guardian. (use transparent proxy)
#sudo iptables -A OUTPUT -j DROP -m string --string ".love" --algo kmp # dots '.' don't get blocked. this is a redundant rule
#sudo iptables -A OUTPUT -j DROP -m string --string ".video" --algo kmp # same
#sudo iptables -A OUTPUT -j DROP -m string --string ".watch" --algo kmp # same

# you can put all of these in [bannedregexpurllist]

sudo iptables -A OUTPUT -j DROP -m string --string "asian" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "adult" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "babe" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "beast" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "bitch" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "blonde" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "club" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "d-serv" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "dating" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "eroti" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "escort" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "freetube" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "galore" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "gay" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "girl" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "gratis" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "hardco" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "japanese" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "jav" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "jerk" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "hott" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "juicy" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "lust" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "mature" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "mobi" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "mommy" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "secretar" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "seducti" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "seks" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "sesso" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "sex" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "pimp" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "pics" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "picture" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "panty" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "slut" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "sleaz" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "softcore" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "teen" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "taboo" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "webcam" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "woman" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "women" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "xyz" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "young" --algo kmp
sudo iptables -A OUTPUT -j DROP -m string --string "секс" --algo kmp # does not work, how to fix?
#sudo iptables -A OUTPUT -j DROP -m string --string "amateur" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "spank" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "fuck" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "ahcdn" --algo kmp # ahcdn.com
#sudo iptables -A OUTPUT -j DROP -m string --string "amhcdn" --algo kmp # amhcdn.net
#sudo iptables -A OUTPUT -j DROP -m string --string "b-cdn" --algo kmp # b-cdn.net
#sudo iptables -A OUTPUT -j DROP -m string --string "xz-cdn" --algo kmp # xz-cdn.com
#sudo iptables -A OUTPUT -j DROP -m string --string "bdsm" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "bigcdn" --algo kmp # bigcdn.com
#sudo iptables -A OUTPUT -j DROP -m string --string "blowj" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "bondage" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "boobs" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "breast" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "bukkak" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "cdnprn" --algo kmp # cdnprn.com
#sudo iptables -A OUTPUT -j DROP -m string --string "cdn12" --algo kmp # cdn12.com
#sudo iptables -A OUTPUT -j DROP -m string --string "cdn-d" --algo kmp # cdn-d1.com
#sudo iptables -A OUTPUT -j DROP -m string --string "cdn13" --algo kmp # cdn13.com
#sudo iptables -A OUTPUT -j DROP -m string --string "cdn3x" --algo kmp # cdn3x.com
#sudo iptables -A OUTPUT -j DROP -m string --string "cdn77" --algo kmp # cdn77.org
#sudo iptables -A OUTPUT -j DROP -m string --string "cdngr" --algo kmp # cdngr.net
#sudo iptables -A OUTPUT -j DROP -m string --string "cdnvid" --algo kmp # selong.cdnvideo18.com
#sudo iptables -A OUTPUT -j DROP -m string --string "dildo" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "ebacdn" --algo kmp # ebacdn.com
#sudo iptables -A OUTPUT -j DROP -m string --string "ebony" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "facial" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "femdom" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "fetish" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "filth" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "gammacdn" --algo kmp # gammacdn.com
#sudo iptables -A OUTPUT -j DROP -m string --string "gangb" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "gloryh" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "hwcdn" --algo kmp # j4k8w4m4.ssl.hwcdn.net
#sudo iptables -A OUTPUT -j DROP -m string --string "hamster" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "handj" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "hboav" --algo kmp # hboav.com
#sudo iptables -A OUTPUT -j DROP -m string --string "hentai" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "horny" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "incest" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "interraci" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "jizz" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "kvscdn" --algo kmp # kvscdn.com
#sudo iptables -A OUTPUT -j DROP -m string --string "lesbi" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "masseur" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "masturb" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "milf" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "mistress" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "muchassd" --algo kmp # muchassd.com
#sudo iptables -A OUTPUT -j DROP -m string --string "mxdcontent" --algo kmp # mxdcontent.net
#sudo iptables -A OUTPUT -j DROP -m string --string "naked" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "nasty" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "naughty" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "nsfw" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "nude" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "nudity" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "orgasm" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "phncdn" --algo kmp # phncdn.com
#sudo iptables -A OUTPUT -j DROP -m string --string "phvcdn" --algo kmp # phvcdn.com
#sudo iptables -A OUTPUT -j DROP -m string --string "porn" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "privatehost" --algo kmp # privatehost.com
#sudo iptables -A OUTPUT -j DROP -m string --string "pussy" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "pvvstream" --algo kmp # pvvstream.pro
#sudo iptables -A OUTPUT -j DROP -m string --string "prostit" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "rape" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "rdtcdn" --algo kmp # rdtcdn.com
#sudo iptables -A OUTPUT -j DROP -m string --string "redtube" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "ruscdn" --algo kmp # ruscdn.com
#sudo iptables -A OUTPUT -j DROP -m string --string "sb-cd" --algo kmp # sb-cd.com. dashes '-' work okay
#sudo iptables -A OUTPUT -j DROP -m string --string "shemale" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "sodom" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "stepmom" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "stripp" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "tamil" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "tits" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "titties" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "titty" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "trafficdeposit" --algo kmp # trafficdeposit.com
#sudo iptables -A OUTPUT -j DROP -m string --string "ucdn" --algo kmp # ucdn.pro
#sudo iptables -A OUTPUT -j DROP -m string --string "upskirt" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "videocdn" --algo kmp # videocdn22.com
#sudo iptables -A OUTPUT -j DROP -m string --string "videosection" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "videosrc" --algo kmp # videosrc.net
#sudo iptables -A OUTPUT -j DROP -m string --string "vids69" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "vidscdn" --algo kmp # s0.vidscdn.com
#sudo iptables -A OUTPUT -j DROP -m string --string "voyeur" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "vulva" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "whore" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "xcdnvids" --algo kmp # xcdnvids.com
#sudo iptables -A OUTPUT -j DROP -m string --string "xhcdn" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "xnxx" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "xtube" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "xvideo" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "xxx" --algo kmp
#sudo iptables -A OUTPUT -j DROP -m string --string "zzz" --algo kmp
#sudo iptables -A OUTPUT -j ACCEPT -m string --string "bootstrapcdn" --algo kmp # maxcdn.bootstrapcdn.com; 'xcdn' is filtered in the rule below
#sudo iptables -A OUTPUT -j DROP -m string --string "xcdn" --algo kmp # cdn15.xcdn.me

sudo iptables -A OUTPUT -j ACCEPT -p icmp --icmp-type 8 -m comment --comment "PING"
sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 22    -m comment --comment "Secure SHell" # gitlab pushing. sharq connection
sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 80    -m comment --comment "HTTP"
sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 443   -m comment --comment "HTTP/SSL (HTTPS)"
sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 21    -m comment --comment "FTP"
sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 53    -m comment --comment "DNS/TCP" # DNS address lookup over TCP/UDP
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 53    -m comment --comment "DNS/UDP"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 123   -m comment --comment "NTP" # synchronising time with internet
sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 5037  -m comment --comment "ADB"
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 143  -m comment --comment "IMAP"
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 993  -m comment --comment "IMAP/SSL"
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 25   -m comment --comment "SMTP"
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 26   -m comment --comment "SMTP 2nd"
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 465  -m comment --comment "SMTP/SSL"
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 587  -m comment --comment "Thunderbird port" # does not make a difference.

#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 67   -m comment --comment "DHCP/src" # I don't know what these are for.
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 68   -m comment --comment "DHCP/dst"
#sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 110  -m comment --comment "POP3"

sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 500   -m comment --comment "VPNC" # connecting to the university vpn
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 4500  -m comment --comment "VPNC"

sudo iptables -A OUTPUT -j ACCEPT -p tcp --dport 5938  -m comment --comment "teamviewer"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 5938  -m comment --comment "teamviewer"

sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 443   -m comment --comment "Google Meet" # https://support.google.com/a/answer/1279090
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19302 -m comment --comment "Google Meet" # --match multiport --dports 19302:19309 (does not work)
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19303 -m comment --comment "Google Meet"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19304 -m comment --comment "Google Meet"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19305 -m comment --comment "Google Meet"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19306 -m comment --comment "Google Meet"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19307 -m comment --comment "Google Meet"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19308 -m comment --comment "Google Meet"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 19309 -m comment --comment "Google Meet"

sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8801 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8802 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8803 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8804 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8805 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8806 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8807 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8808 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8809 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 8810 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 3478 -m comment --comment "zoom"
sudo iptables -A OUTPUT -j ACCEPT -p udp --dport 3479 -m comment --comment "zoom"

sudo iptables -A INPUT -j LOG --log-prefix "elias_in:" --log-level 6 # LOG is a non-terminating rule
sudo iptables -A OUTPUT -j LOG --log-prefix "elias_out:" --log-level 6

# ipv6: (copied from above)
sudo ip6tables -A INPUT  -j ACCEPT -i lo -m comment --comment "loopback"
sudo ip6tables -A OUTPUT -j ACCEPT -o lo -m comment --comment "loopback"
sudo ip6tables -A INPUT  -j ACCEPT -m conntrack --ctstate ESTABLISHED,RELATED -m comment --comment "conntrack"
sudo ip6tables -A OUTPUT -j ACCEPT -m conntrack --ctstate ESTABLISHED,RELATED -m comment --comment "conntrack"
#sudo ip6tables -A INPUT -p icmpv6 -j ACCEPT # ipmpv6 are essential for ipv6
#sudo ip6tables -A OUTPUT -p icmpv6 -j ACCEPT # or ipv6-icmp
sudo ip6tables -A OUTPUT -j ACCEPT -p tcp --dport 5037 -m comment --comment "ADB" # needed for connecting android adb
sudo ip6tables -A OUTPUT -j ACCEPT -p tcp --dport 22   -m comment --comment "SSH secure shell" # needed for ssh
sudo ip6tables -A OUTPUT -j ACCEPT -p udp --dport 123  -m comment --comment "NTP" # synchronising time with internet

sudo ip6tables -A INPUT -j LOG --log-prefix "elias_in_ipv6:" --log-level 6
sudo ip6tables -A OUTPUT -j LOG --log-prefix "elias_out_ipv6:" --log-level 6

# save settings:
sudo iptables-save  -f /etc/iptables/iptables.rules
sudo ip6tables-save -f /etc/iptables/ip6tables.rules

# enable auto running after system restart
systemctl enable iptables.service
systemctl enable ip6tables.service

# display settings
sudo iptables  -vnL --line-numbers
sudo iptables  -vnL --line-numbers -t nat
sudo ip6tables -vnL --line-numbers

# note: to remove a rule, replace -A with -D
