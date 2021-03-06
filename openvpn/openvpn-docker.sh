OVPN_DATA="openvpn_data"

docker volume create --name $OVPN_DATA

docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm giggio/openvpn-arm ovpn_genconfig -u udp://openvpn.domain.org

docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it giggio/openvpn-arm ovpn_initpki

##########################

docker run -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN giggio/openvpn-arm

docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it giggio/openvpn-arm easyrsa build-client-full CLIENTNAME nopass

docker run -v $OVPN_DATA:/etc/openvpn --restart unless-stopped --log-driver=none --rm giggio/openvpn-arm ovpn_getclient CLIENTNAME > CLIENTNAME.ovpn