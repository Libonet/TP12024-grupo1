install.packages("readxl")
library(readxl)

datosLP <- read_xlsx("Datos_LP.xlsx", col_names = FALSE)

datosLP <- datosLP[ -c(5:23, 61:118) ]

datosLP[3, 2] = "Provincia"
datosLP[3, 3] = "Barrio"

tabla <- datosLP[ -c(1, 2), ]

write.csv(tabla, file="tabla_datos.csv")

tabla <- read.csv("tabla_datos.csv", skip = 1, stringsAsFactors = TRUE)
tabla <- tabla [ ,-c(1,2) ]

write.csv(tabla, "datosLP_limpios.csv")
file.remove("tabla_datos.csv")

