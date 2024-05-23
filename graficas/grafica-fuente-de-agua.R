library(ggplot2)
library(ggthemes)
library(dplyr)

tabla <- read.csv("datosLP_limpios.csv", stringsAsFactors = TRUE)

barplot(summary(tabla$X.De.qué.forma.obtiene.el.agua.dentro.de.su.vivienda.),
  names.arg = c("cisterna","pozo","medidor","informal","comunitario","no tiene", "no sabe"))


data <- table(tabla$X.De.qué.forma.obtiene.el.agua.dentro.de.su.vivienda.)
data <- data.frame(name=c("cisterna","pozo","medidor","informal","comunitario","no tiene", "no sabe"),
                   value=as.integer(data))

p <- # Barplot
  data %>%
  arrange(desc(value)) %>%    # First sort by value. This sort the dataframe but NOT the factor levels
  mutate(name=factor(name, levels=name)) %>%   # This trick update the factor levels
  ggplot(aes(x=name, y=value)) + 
  geom_bar(stat = "identity", fill="lightblue", color="black") +
  labs(title = "Formas de obtener agua en la vivienda",
       caption = "Fuente: Observatorio villero (2022)",
       x=" ",y="Frecuencia") +
  theme_solarized() +
  scale_colour_solarized()

p
