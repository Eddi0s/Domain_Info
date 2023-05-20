#The script retrieves the IP address and server name for a given domain and displays the information, optionally running the "sl" command if the "-sl" flag is provided as the second argument.

server() {
    domain="$1"
    ip=$(host "$domain" | awk '/has address/ {print $4; exit}')

    if [ -z "$ip" ]; then
        ip="\e[31mNOT FOUND\e[0m"
        server="\e[31mNOT FOUND\e[0m"
    else
        server=$(host "$ip" | awk '{print $NF}' | sed 's/\.$//')
        if [ -z "$server" ]; then
            server="\e[31mNOT FOUND\e[0m"
        fi
    fi

    echo -e "Domain: $domain -- IP: $ip -- Server: $server"

    if [[ $2 == "-sl" ]]; then
        sl "$server"
    fi
}
