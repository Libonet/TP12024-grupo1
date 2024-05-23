library(ggplot2)
library(ggthemes)
library(dplyr)

tabla <- read.csv("datosLP_limpios.csv", stringsAsFactors = TRUE)

summary(tabla$X.Se.ve.usted.obligado.a.a.comprar.agua.embotellada.para.consumo.del.hogar.)

data <- table(tabla$X.Se.ve.usted.obligado.a.a.comprar.agua.embotellada.para.consumo.del.hogar.)
df <- data.frame(name=c("No","Sí"),
                 value=as.integer(data))

df <- mutate(df, percent = round(df$value/sum(df$value)*100, 1))

p <- ggplot(df, aes(x = 1, y = percent, fill = name)) +
  geom_col() +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste(percent, "%")),
            position = position_stack(vjust = 0.5),
            size = 8) +
  theme_void(base_size = 12) +
  labs(title = "Se ve obligado a comprar agua embotellada para consumo del hogar?",
       x=" ") +
  scale_fill_brewer(name = NULL, palette = "PuBu")

p
