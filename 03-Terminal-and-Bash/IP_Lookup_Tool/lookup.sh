#!/bin/bash

# Check if at least one IP address is provided
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <IP_ADDRESS1> [<IP_ADDRESS2> ...]"
    exit 1
fi

# Loop through the provided IP addresses
for ip in "$@"; do
    # Use curl to get information about the IP address
    result=$(curl -s http://ipinfo.io/"$ip")

    # Use grep and awk to extract the country
    country=$(echo "$result" | grep "country" | awk -F'"' '{print $4}')

    # Display the country
    echo "Country for IP $ip: $country"
done

