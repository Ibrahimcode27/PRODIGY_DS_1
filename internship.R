# Load necessary library
library(ggplot2)

# Read the CSV file
data <- read.csv("C:/Users/mulla/Downloads/database_population/Prodigy_csv.csv")

# Subset the data for India
india_data <- data[data$CountryName == "India", ]

# Extract population data
population <- unlist(india_data[, grepl("^X[0-9]{4}$", colnames(india_data))])

# Extract years
years <- as.numeric(gsub("^X", "", grep("^X[0-9]{4}$", colnames(india_data)), perl = TRUE))

# Remove missing or non-numeric values
population <- as.numeric(ifelse(population == "", NA, population))
population <- population[!is.na(population)]

# Create a data frame with years and population
population_data <- data.frame(Year = years, Population = population)

# Plot
ggplot(population_data, aes(x = Year, y = Population)) + 
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  labs(title = "Population Trend of India (1960-2022)", x = "Year", y = "Population") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
