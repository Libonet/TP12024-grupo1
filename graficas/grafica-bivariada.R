library(reshape2) 
library(ggplot2)
library(ggthemes)
library(dplyr)

tabla <- read.csv("datosLP_limpios.csv", stringsAsFactors = TRUE)

tabla2 <- table(tabla$X.De.qué.forma.obtiene.el.agua.dentro.de.su.vivienda.,
                tabla$X.Se.ve.usted.obligado.a.a.comprar.agua.embotellada.para.consumo.del.hogar.)

df <- data.frame(No=tabla2[1:7],Si=tabla2[8:14],
                 row.names = c("cisterna","pozo","medidor","informal","comunitario","no tiene", "no sabe"))


df$category <- row.names(df)
df <- df %>%
  arrange(desc(Si)) %>%    # First sort by value. This sort the dataframe but NOT the factor levels
  mutate(category=factor(category, levels=category))   # This trick update the factor levels
mdfr <- melt(df, id.vars = "category")

p <- # Barplot
  mdfr %>%
  ggplot(aes(category, value, fill=variable)) + 
  geom_bar(position = "stack", stat="identity") +
  scale_y_continuous() +
  labs(title = "Formas de obtener agua en la vivienda respecto al consumo de agua embotellada",
       caption = "Fuente: Observatorio villero (2022)",
       x=" ",y="Frecuencia") +
  theme_solarized() +
  scale_colour_solarized()

p
