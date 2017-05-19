# Title: "NYC taxi rides"
# Name:

# Load required functions and packages
library(tidyverse)
library(smodels)
library(forcats)
library(ggrepel)

theme_set(theme_minimal())

##############################################################################
# 01. This lab studies a set of data from NYC Taxi rides. Each row
# corresponds to a single ride; included are the latitude and longitude of the
# pickup and dropoff locations as well as details about the time, fair, and
# tip provided. Read the data in using:

taxi <- read_csv("https://statsmaths.github.io/stat_data/nyc_taxi_50.csv")

# The following fields are available for you to work with:
#
#   pickup_hour       - hour of the day
#   pickup_month      - month of the year
#   pickup_week       - week of the year, starting at 1
#   pickup_doy        - day of the year, starting at 1
#   pickup_wday       - day of the week, starting at 1=Sunday
#   length_time       - length of the trip in seconds
#   pickup_BoroCode   - borough where taxi was picked up
#   pickup_NTACode    - neighborhood where taxi was picked up
#   dropoff_BoroCode  - borough where passenger was dropped off
#   dropoff_NTACode   - neighborhood  where passenger was dropped off
#   pickup_longitude  - longitude where taxi was picked up
#   pickup_latitude   - latitude where taxi was picked up
#   dropoff_longitude - longitude where passenger was dropped off
#   dropoff_latitude  - latitude where passenger was dropped off
#   vendor_id         - vender code; meaning is unclear
#   passenger_count   - number of passengers in the cab
#   trip_distance     - total distance covered by the trip
#   fare_amount       - amount of the fare
#   tip_amount        - tip amount

##############################################################################
# 02. Task: Explore the spatial patterns that are occuring in the data.








