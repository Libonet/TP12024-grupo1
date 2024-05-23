library(ggplot2)
library(ggthemes)
library(dplyr)

tabla <- read.csv("datosLP_limpios.csv", stringsAsFactors = TRUE)


# Qué fuentes de energía utilizan para cocinar en su vivienda
summary(tabla$X.Qué.fuentes.de.energía.utilizan.para.cocinar.en.su.vivienda.)
summary(tabla$NA..1)
summary(tabla$NA..2)
summary(tabla$NA..3)
summary(tabla$NA..4)

natural <- sum(as.integer(tabla$X.Qué.fuentes.de.energía.utilizan.para.cocinar.en.su.vivienda.), na.rm=TRUE)
envasado <- sum(as.integer(tabla$NA..1), na.rm=TRUE)
electricidad <- sum(as.integer(tabla$NA..2), na.rm=TRUE)
carbon <- sum(as.integer(tabla$NA..3), na.rm=TRUE)
noTienen <- sum(as.integer(tabla$NA..4), na.rm=TRUE)

data <- data.frame(name=c("Gas natural","Gas envasado","Leña/Carbón","Electricidad","No tienen"),
  value=c(natural, envasado, electricidad, carbon, noTienen))

p <- # Barplot
  data %>%
  arrange(value) %>%    # First sort by value. This sort the dataframe but NOT the factor levels
  mutate(name=factor(name, levels=name)) %>%   # This trick update the factor levels
  ggplot(aes(y=name, x=value)) + 
  geom_bar(stat = "identity", fill="lightblue", color="black") +
  labs(title = "Fuentes de energía utilizadas para cocinar en la vivienda",
       caption = "Fuente: Observatorio villero (2022)",
       x="Frecuencia",y=" ") +
  theme_solarized() +
  scale_colour_solarized()

p
