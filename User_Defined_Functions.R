# Header ------------------------------------------------------------------
# Author: Liyao Yu
# Date: 2025-Feb-20
# User defined functions

# Return the abbreviated species name -------------------------------------
abbreviate_species <- function(species_name) {
  vapply(species_name, function(name) {
    words <- unlist(strsplit(name, " "))
    if (length(words) < 2) {
      stop("Invalid species name. It should have at least two words.")
    }
    paste0(substr(words[1], 1, 1), ". ", words[2])
  }, FUN.VALUE = character(1))  # Ensures output is character
}

# Convert DoY to Month ----------------------------------------------------
doy_to_month <- function(doy, year) {
  date <- as.Date(doy - 1, origin = paste0(year, "-01-01"))
  month <- format(date, "%m")
  return(as.numeric(month))
}

# Calculate how many days there are in a month ----------------------------
days_in_month <- function(year, month) {
  if (any(month < 1 | month > 12)) {
    stop("Invalid input: 'month' must be an integer between 1 and 12.")
  }
  # Adjust for December (month = 12)
  next_month_year <- ifelse(month == 12, year + 1, year)
  next_month <- ifelse(month == 12, 1, month + 1)
  # Calculate the last day of the current month
  last_day <- as.Date(paste(next_month_year, next_month, "1", sep = "-"), 
                      format = "%Y-%m-%d") - 1
  return(as.numeric(format(last_day, "%d")))
}
