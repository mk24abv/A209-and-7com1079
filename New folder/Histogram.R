mean_alcohol = mean(as.numeric(SC$Alcohol), na.rm = TRUE)

ggplot(SC, aes(x = as.numeric(Alcohol))) + 
  geom_histogram(aes(y = ..density..), 
                 bins = 30, 
                 fill = "skyblue", 
                 color = "black", 
                 alpha = 0.6) + 
  geom_density(color = "darkorange", 
               size = 1.2) + 
  geom_vline(aes(xintercept = mean_alcohol, color = "Mean Alcohol Consumption"), 
             linetype = "dotted", size = 1.2) +
  labs(
    x = "Alcohol Consumption Level (Scale 1-5)", 
    y = "Density", 
    title = "Histogram of Alcohol Consumption with Normal Curve Overlay",
    subtitle = paste("Mean Alcohol Consumption: ", round(mean_alcohol, 2))
  ) + 
  scale_x_continuous(
    breaks = 1:5,
    labels = c("Very Low", "Low", "Moderate", "High", "Very High")
  ) +
  scale_fill_brewer(name = "Alcohol Consumption", palette = "Set2") +  
  scale_color_manual(name = "Legend", 
                     values = c("Mean Alcohol Consumption" = "steelblue")) +  
  theme_minimal() + 
  theme(
    legend.position = "top",  
    legend.title = element_text(face = "bold", size = 12),  
    legend.text = element_text(size = 10)  
  ) +
  guides(
    fill = guide_legend(title = "Alcohol Consumption Level", 
                        label.position = "right", 
                        title.theme = element_text(face = "bold", size = 12),
                        label.theme = element_text(size = 10)),
    color = guide_legend(title = "Normal Curve and Mean", 
                         label.position = "left", 
                         title.theme = element_text(face = "bold", size = 12),
                         label.theme = element_text(size = 10))
  )
