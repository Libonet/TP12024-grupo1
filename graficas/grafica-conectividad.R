library(ggplot2)
library(ggthemes)
library(dplyr)

tabla <- read.csv("datosLP_limpios.csv", stringsAsFactors = TRUE)

data <- table(tabla$X.Cuántos.teléfonos.y.o.tablets.poseen.en.la.vivienda.)

df <- data.frame(name=c("0","1","2","3","4","5"),
                 value=as.integer(data))

p <- # Barplot
  df %>%
  ggplot(aes(x=name, value)) + 
  geom_bar(stat = "identity", fill="lightblue", color="black",
           width = (1/100)*resolution(0:5)) +
  labs(title = "Cantidad de teléfonos y/o tablets en la vivienda",
       caption = "Fuente: Observatorio villero (2022)",
       x="Cantidad",y="Frecuencia") +
  theme_solarized() +
  scale_colour_solarized()

p
