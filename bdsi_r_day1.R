library('tidyverse')
library('nycflights13')
library('dplyr')

# Fliter flights from different destinations
dtw = filter(flights, dest == 'DTW')
sea = filter(flights, dest == 'SEA')

# View the data
View(dtw)

# Only show specified columns
select(flights, year, month, day, hour)

# Filter and select
flights %>% 
  filter(dest == 'ORD') %>% 
  select(year:hour, dest,flight)

# Unnested Example
x = sin(0.5) %>% 
  exp() %>% 
  round(2)

# Sort rows by variable
flights %>% arrange(sched_arr_time)

# Last day flight 4401 dtw arivved

flights %>% 
  filter(dest == 'DTW', flight == '4401') %>% 
  arrange(desc(month), desc(day)) %>% 
  select(year, month, day, flight, dest) %>% 
  slice_head()

# Calculate min and max dep_delay, remove missing
flights %>% 
  na.omit() %>% 
  summarise(min_delay = min(dep_delay),
            max_delay = max(dep_delay))

flights %>% 
  group_by(carrier)

# Longest arr_delay for each carrier
flights %>% 
  na.omit(arr_delay) %>%
  group_by(carrier) %>% 
  summarise(max_arr_delay = max(arr_delay)) %>% 
  arrange(max_arr_delay) %>% 
  left_join(airlines)
