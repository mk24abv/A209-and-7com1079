library(ggplot2)
library(dplyr)

students = read.csv("student-mat.csv")
colnames(students)

SC = students %>% dplyr::select(age, Dalc, Walc, health)#SC=Selected columns
head(SC)

SC$Alcohol = cut((SC$Dalc + SC$Walc), 
                 breaks = c(0, 2, 4, 6, 8, Inf), 
                 labels = c("Very Low", "Low", "Moderate", "High", "Very High"))
SC$Alcohol = factor(SC$Alcohol, 
                    levels = c("Very Low", "Low", "Moderate", "High", "Very High"), 
                    labels = 1:5, 
                    ordered = TRUE)
head(SC)

alcohol_summary = SC %>%
  group_by(age) %>%
  summarise(
    mean_alcohol = mean(as.numeric(Alcohol), na.rm = TRUE), 
    mean_health = mean(as.numeric(health), na.rm = TRUE),
    mean_Dalc = mean(as.numeric(Dalc), na.rm = TRUE),
    mean_Walc = mean(as.numeric(Walc), na.rm = TRUE),,
  )

print(alcohol_summary)