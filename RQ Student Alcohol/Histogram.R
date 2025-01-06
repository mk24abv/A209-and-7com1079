CoreData = SC %>% dplyr::select(age, health, Alcohol)

#histogram
CoreData$health_numeric <- as.numeric(CoreData$health)

ggplot(CoreData, aes(x = health_numeric)) + 
  geom_bar(aes(y = ..count..), 
           color = "black", 
           fill = "grey", 
           alpha = 0.7) +
  
  labs(x = "Current Health Status of Students", 
       y = "Frequency", 
       title = "Histogram of Health Status with Normal Curve") +
  
  theme_minimal() + 
  theme(legend.position = "top", 
        plot.title = element_text(hjust = 0.5)) +
  
  stat_function(fun = function(x) dnorm(x, 
                                        mean = mean(CoreData$health_numeric, na.rm = TRUE), 
                                        sd = sd(CoreData$health_numeric, na.rm = TRUE)) * length(CoreData$health_numeric), 
                color = "red", size = 1)
