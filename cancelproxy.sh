#!/bin/sh
#unset proxyserveraddr
#unset proxyserverport
unset HTTP_PROXY
unset HTTPS_PROXY
unset FTP_PROXY
unset SOCKS_PROXY
unset NO_PROXY
unset http_proxy
unset https_proxy
unset ftp_proxy
unset socks_proxy
unset no_proxy

#gsettings list-recursively org.gnome.system.proxy
gsettings set org.gnome.system.proxy.http host ''
gsettings set org.gnome.system.proxy.http port 0
gsettings set org.gnome.system.proxy.https host ''
gsettings set org.gnome.system.proxy.https port 0
gsettings set org.gnome.system.proxy.ftp host ''
gsettings set org.gnome.system.proxy.ftp port 0
gsettings set org.gnome.system.proxy.socks host ''
gsettings set org.gnome.system.proxy.socks port 0
gsettings reset org.gnome.system.proxy ignore-hosts
gsettings set org.gnome.system.proxy mode 'none'
gsettings list-recursively org.gnome.system.proxy

echo -n ""|sudo tee /etc/apt/apt.conf
