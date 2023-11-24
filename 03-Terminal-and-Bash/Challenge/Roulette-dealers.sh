#!/bin/bash

# Define the date and time list
dates_and_times=(
  "0310 05:00:00 AM"
  "0310 08:00:00 AM"
  "0310 02:00:00 PM"
  "0310 08:00:00 PM"
  "0310 11:00:00 PM"
  "0312 05:00:00 AM"
  "0312 08:00:00 AM"
  "0312 02:00:00 PM"
  "0312 08:00:00 PM"
  "0312 11:00:00 PM"
  "0315 05:00:00 AM"
  "0315 08:00:00 AM"
  "0315 02:00:00 PM"
)

# Loop through each date and time
for dt in "${dates_and_times[@]}"; do
  # Extract date and time components
  date=$(echo "$dt" | awk '{print $1}')
  time=$(echo "$dt" | awk '{print $2}')
  time_M=$(echo "$dt" | awk '{print $3}')

  # Extract roulette dealer information using awk
  dealer_info=$(awk -v time="$time" -v time_M="$time_M" '$1 == time && $2 == time_M {print $5, $6}' "${date}_Dealer_schedule.txt")

  # Print the result
  echo "Loss occurred on $date at $time $time_M. Roulette Dealer information: $dealer_info"
done 
