install.packages("readxl")
library(readxl)

datosLP <- read_xlsx("Datos_LP.xlsx", col_names = FALSE)

datosLP <- datosLP[ -c(4:23, 61:118) ]

datosLP[3, 2] = "Provincia"
datosLP[3, 3] = "Barrio"

tabla <- datosLP[ -c(1, 2), ]

write.csv(tabla, file="tabla_datos.csv")

prueba <- read.csv("tabla_datos.csv", skip = 1, stringsAsFactors = TRUE)
prueba <- prueba [ ,-c(1,2) ]

write.csv(prueba, "datosLP_limpios.csv")
file.remove("tabla_datos.csv")

