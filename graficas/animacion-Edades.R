library(tibble)
library(png)
library(gifski)
library(ggplot2)
library(gganimate)
theme_set(theme_bw())

tabla <- read.csv("datosLP_limpios.csv", stringsAsFactors = TRUE)

hist(tabla$Edad.jefe.a.del.hogar, main = "Histograma de edades",
     xlab = "Edad del jefe del hogar", ylab="Frecuencia",
     col = "lightblue")

data <- data.frame()

a <- data.frame(value=(tabla$Edad.jefe.a.del.hogar)[1])
i <- 1
d <- data.frame(a,i)
data <- rbind(data, d)

a <- data.frame(value=tabla$Edad.jefe.a.del.hogar)
i <- 2
d <- data.frame(a,i)
data <- rbind(data,d)

p <- ggplot(data, aes(x=value)) + 
  geom_histogram(binwidth = 6, fill="lightblue", color="black") +
  labs(title = "Edad del jefe de la casa en viviendas de barrios populares",
       caption = "Fuente: Observatorio villero (2022)") +
  theme_bw() +
  scale_x_continuous(name="Edad", expand = waiver(), limits=c(12,96), breaks=seq(0,95,6)) +
  scale_y_continuous(name="Frecuencia", expand=waiver(), limits = c(0,250), breaks=seq(0,250,25))

p

p + transition_states(i, state_length = 1, wrap = FALSE)
