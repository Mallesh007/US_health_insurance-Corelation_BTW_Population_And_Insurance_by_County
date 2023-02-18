# US_health_insurance-
Is there a correlation between the percentage of people(age 18 and under) without health insurance per county and the population(age 18 and under) per county in the United States?

null-hypothesis: There is no correlation between the percentage of people(age 18 and under) without health insurance per county and the population(age 18 and under) per county in the United States.

alt-hypothesis: There is a correlation between the percentage of people(age 18 and under) without health insurance per county and the population(age 18 and under) per county in the United States.

dataset-url: https://data.world/dc-data-journalism/urban-rural-health-and-demographic-data/workspace/file?filename=Health+insurance+%2818+and+under%29.csv

columns: |
  > d<-read.csv("Health insurance (18 and under).csv")
  > colnames(d)
   [1] "year"               "fips"               "state_fips"         "county_fips"        "county_name"       
   [6] "state_name"         "state_abbr"         "metro_nonmetro"     "uninsured"          "population_18under"
