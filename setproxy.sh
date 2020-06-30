#!/bin/sh

# for terminal
proxyserveraddr=yourhost
proxyserverport=yourport

gsettings set org.gnome.system.proxy mode manual
gsettings set org.gnome.system.proxy.http host "$proxyserveraddr"
gsettings set org.gnome.system.proxy.http port "$proxyserverport"
gsettings set org.gnome.system.proxy.https host "$proxyserveraddr"
gsettings set org.gnome.system.proxy.https port "$proxyserverport"
gsettings list-recursively org.gnome.system.proxy

#export proxyserveraddr=yourhost
#export proxyserverport=yourport
export HTTP_PROXY="http://$proxyserveraddr:$proxyserverport/"
export HTTPS_PROXY="https://$proxyserveraddr:$proxyserverport/"
export FTP_PROXY="ftp://$proxyserveraddr:$proxyserverport/"
export SOCKS_PROXY="socks://$proxyserveraddr:$proxyserverport/"
export NO_PROXY="localhost,127.0.0.1,localaddress,.localdomain.com;"
export http_proxy="http://$proxyserveraddr:$proxyserverport/"
export https_proxy="https://$proxyserveraddr:$proxyserverport/"
export ftp_proxy="ftp://$proxyserveraddr:$proxyserverport/"
export socks_proxy="socks://$proxyserveraddr:$proxyserverport/"
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com;"


# for apt
cat <<-EOF| sudo tee /etc/apt/apt.conf
Acquire::http::proxy "http://$proxyserveraddr:$proxyserverport/";
Acquire::https::proxy "https://$proxyserveraddr:$proxyserverport/";
Acquire::ftp::proxy "ftp://$proxyserveraddr:$proxyserverport/";
Acquire::socks::proxy "socks://$proxyserveraddr:$proxyserverport/";
EOF
