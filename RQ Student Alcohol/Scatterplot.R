#scatterplot
ggplot(SC, aes(x = as.numeric(Alcohol), y = as.numeric(health))) +
  geom_jitter(aes(color = health), size = 3, width = 0.2, height = 0.2) +
  scale_x_continuous(breaks = 1:10) +
  scale_y_continuous(breaks = 1:5) +
  labs(
    x = "Alcohol Consumption (1-10)", 
    y = "Health Status (1-5)",
    title = "Scatterplot of Alcohol Consumption vs Health Status of Students in Maths course"
  ) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  theme(
    panel.background = element_blank(),
    plot.background = element_blank(),
    axis.text = element_text(size = 12),
    axis.ticks = element_blank(),
    panel.grid = element_blank(),
    plot.title = element_text(hjust = 0.5))