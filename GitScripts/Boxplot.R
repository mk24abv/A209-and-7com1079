age1 = sample(unique(SC$age), 1)
age2 = sample(setdiff(unique(SC$age), age1), 1)

print(paste("Randomly selected ages", age1, age2))

SC_subset = SC %>% filter(age %in% c(age1, age2))
print(SC_subset)


mean_age1 = mean(as.numeric(SC_subset$Alcohol[SC_subset$age == age1]), na.rm = TRUE)
mean_age2 = mean(as.numeric(SC_subset$Alcohol[SC_subset$age == age2]), na.rm = TRUE)

ggplot(SC_subset, aes(x = factor(age), y = as.numeric(Alcohol), fill = factor(age))) + 
  geom_boxplot(outlier.size = 3, 
               outlier.colour = "red", 
               outlier.shape = 16, 
               show.legend = TRUE) + 
  geom_hline(aes(yintercept = mean_age1, color = "Age 1 Mean"), linetype = "dotted", size = 1.2) +
  geom_hline(aes(yintercept = mean_age2, color = "Age 2 Mean"), linetype = "dotted", size = 1.2) +
  labs(
    x = "Age Group (Years)", 
    y = "Alcohol Consumption Level (Scale 1-5)", 
    title = paste("Comparison of Alcohol Consumption Between Ages", age1, "and", age2),
    subtitle = "Boxplot showing distribution, outliers, and mean alcohol consumption levels by age group"
  ) + 
  scale_y_continuous(
    breaks = 1:5,
    labels = c("Very Low", "Low", "Moderate", "High", "Very High")
  ) +
  scale_fill_brewer(name = "Age Group", palette = "Set2", labels = c(paste(age1, "Years"), paste(age2, "Years"))) +  
  scale_color_manual(name = "Mean Alcohol Consumption", values = c("steelblue", "darkorange")) + 
  theme_minimal() + 
  theme(
    legend.position = "right", 
    legend.title = element_text(face = "bold"), 
    legend.text = element_text(size = 10) 
  ) +
  guides(
    fill = guide_legend(title = "Age Group", label.position = "right", 
                        title.theme = element_text(face = "bold", size = 12),
                        label.theme = element_text(size = 10)),
    color = guide_legend(title = "Mean Alcohol Consumption", 
                         label.position = "left", 
                         title.theme = element_text(face = "bold", size = 12),
                         label.theme = element_text(size = 10)),
    outlier = guide_legend(title = "Outliers", 
                           label.position = "bottom",
                           title.theme = element_text(face = "bold", size = 12),
                           label.theme = element_text(size = 10))
  )