#Usando o R no Power BI

#Diretorio
setwd("seu diretorio")

#Packages
aiquality <- airquality   
library(ggplot2)
library(dplyr)

#Base
head(airquality, n = 10)
str(airquality)


#Ozone e Solar.R (Valor NA)
airquality <- airquality %>%
  mutate(Ozone = replace(Ozone, is.na(Ozone) == TRUE, 42)) %>%
  mutate(Solar.R = replace(Solar.R, is.na(Solar.R) == TRUE, 186))


#Plot I (Ozone - Solar.R)
ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point() +
  ggtitle("Temperatura - Ozonio") +
  labs(x = "Temperatura", y = "Ozonio") +
  theme_bw()


#Plot II (Raios Solares - Mês)
ggplot(airquality, aes(Solar.R)) +
  geom_density() +
  facet_grid(~Month) +
  ggtitle("Raios Solares - Mês") +
  labs(x = "Raios Solates", y = "Densidade") +
  theme_bw()

#Plot III (Temp)
ggplot(airquality, aes(x = Temp)) +
  geom_bar() +
  ggtitle("Medição da Temperatura") +
  labs(x = "Temperatura", y = "Quantidade") +
  theme_bw()


#Divisão de Bases - Mês
may_data <- airquality %>% select(Month, Temp, Wind) %>%
  filter(Month == "5") %>%
  mutate(Month = replace(Month, Month == 5, "Maio"))

june_data <- airquality %>% select(Month, Temp, Wind) %>%
  filter(Month == "6") %>%
  mutate(Month = replace(Month, Month == 6, "Junho"))

july_data <- airquality %>% select(Month, Temp, Wind) %>%
  filter(Month == "7") %>%
  mutate(Month = replace(Month, Month == 7, "Julho"))


august_data <- airquality %>% select(Month, Temp, Wind) %>%
  filter(Month == "8") %>%
  mutate(Month = replace(Month, Month == 8, "Agosto"))


september_data <- airquality %>% select(Month, Temp, Wind) %>%
  filter(Month == "9") %>%
  mutate(Month = replace(Month, Month == 9, "Setembro"))


#Tratamento - Query Editor
airquality <- airquality %>%
  arrange(Temp) %>%
  group_by(Month) %>%
  mutate(MediaTemp = format(mean(Temp), digits = 2))
