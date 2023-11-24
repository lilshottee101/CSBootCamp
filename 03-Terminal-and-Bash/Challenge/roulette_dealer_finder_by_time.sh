#!/bin/bash
 
# Check if three arguments are provided
if [ "$#" -ne 3 ]; then
	echo "Usage: $0 <date (MMYY)> <Time> <AM or PM>"
    exit 1
fi

# Set common name variable to arguments 
date="$1"
time="$2"
time_period="$3"

# Check if Dealer Schedule file exists
if [ ! -f "${date}_Dealer_schedule.txt" ]; then
	echo "Error: Dealer Schedule file ${date}_Dealer_schedule.txt not found."
	echo "Resolution: Ensure Dealer Schedule ${date}_Dealer_schedule.txt is in the same directory as $0 script."
	exit 1
fi

# Function to search all files in directory for losses during provided time
search_losses() {
	# Set Local Variables
	local date="$1"
	local time="$2"
	local time_period="$3"
	
	# Dealers Function takes in two time variables to pass out dealers were dealing at that time
	local dealers=$(awk -v time="$time" -v time_period="$time_period" '$1 == time && $2 == time_period {print $5, $6}' "${date}_Dealer_schedule.txt")
	search_losses=($dealers)
}

# Call the function
search_losses "$date" "$time" "$time_period"

# Echo results from function
echo "The Roulette Dealer was ${search_losses[0]} ${search_losses[1]}."	
