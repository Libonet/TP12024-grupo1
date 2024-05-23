library(ggplot2)
library(ggthemes)
library(dplyr)

tabla <- read.csv("datosLP_limpios.csv", stringsAsFactors = TRUE)

# luz
summary(tabla$X.Qué.tipo.de.conexión.posee.a.la.red.eléctrica.)

barplot(sort(summary(tabla$X.Qué.tipo.de.conexión.posee.a.la.red.eléctrica.)),
        names.arg=c("no tiene","comunitario","medidor","informal"),
        ylim=c(0,600))

data <- table(tabla$X.Qué.tipo.de.conexión.posee.a.la.red.eléctrica.)
data <- data.frame(name=c("no tiene","comunitario","medidor","informal"),
                   value=sort.default(as.integer(data)))

p <- # Barplot
  data %>%
  arrange(desc(value)) %>%    # First sort by value. This sort the dataframe but NOT the factor levels
  mutate(name=factor(name, levels=name)) %>%   # This trick update the factor levels
  ggplot(aes(x=name, y=value)) + 
  geom_bar(stat = "identity", fill="lightblue", color="black") +
  labs(title = "Tipo de conexión a la red eléctrica",
       caption = "Fuente: Observatorio villero (2022)",
       x=" ",y="Frecuencia") +
  theme_solarized() +
  scale_colour_solarized()

p
