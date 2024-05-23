library(ggplot2)
library(ggthemes)

# hist(tabla$Edad.jefe.a.del.hogar, main = "Histograma de edades",
#      xlab = "Edad del jefe del hogar", ylab="Frecuencia",
#      col = "lightblue")

tabla <- read.csv("datosLP_limpios.csv", stringsAsFactors = TRUE)

data <- data.frame(value=tabla$Edad.jefe.a.del.hogar)

p <- ggplot(data, aes(x=value)) + 
  geom_histogram(binwidth = 6, fill="lightblue", color="black") +
  labs(title = "Edad del jefe de casa",
       caption = "Fuente: Observatorio villero (2022)") +
  scale_x_continuous(name="Edad", expand=waiver(), limits=c(12,96), breaks=seq(0,95,6)) +
  scale_y_continuous(name="Frecuencia", expand=waiver(), limits=c(0,250), breaks=seq(0,250,25)) +
  theme_solarized() +
  scale_colour_solarized()

p
