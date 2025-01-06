
library(ggplot2)
library(dplyr)
library(scales)

students = read.csv("student-mat.csv")
colnames(students)
SC = students %>% dplyr::select(age, Dalc, Walc, health)

SC$Alcohol = cut((SC$Dalc + SC$Walc), 
                 breaks = seq(0, 10, by = 1), 
                 include.lowest = TRUE,         
                 labels = FALSE)

SC$Alcohol = factor(SC$Alcohol, 
                    levels = as.character(1:10),    
                    ordered = TRUE)

SC$health = factor(SC$health, ordered = TRUE)

head(SC)
summary(SC)