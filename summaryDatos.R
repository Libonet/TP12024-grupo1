
tabla <- read.csv("datosLP_limpios.csv", stringsAsFactors = TRUE)

# summary(tabla)
summary(tabla$Edad.jefe.a.del.hogar)

sd(tabla$Edad.jefe.a.del.hogar)
var(tabla$Edad.jefe.a.del.hogar)

hist(tabla$Edad.jefe.a.del.hogar, main = "Histograma de edades",
     xlab = "Edad del jefe del hogar", ylab="Frecuencia")

boxplot(tabla$Edad.jefe.a.del.hogar)

summary(tabla$X.De.qué.forma.obtiene.el.agua.dentro.de.su.vivienda.)

barplot(summary(tabla$X.De.qué.forma.obtiene.el.agua.dentro.de.su.vivienda.),
names.arg = c("cisterna","pozo","medidor","informal","comunitario","no tiene", "no sabe"))

summary(tabla$X.Se.ve.usted.obligado.a.a.comprar.agua.embotellada.para.consumo.del.hogar.)

# pie()

summary(tabla$X.Cómo.es.la.presión.del.agua.)

summary(tabla$X.Cuántos.litros.de.almacenamiento.de.agua.posee.)
barplot(sort(summary(tabla$X.Cuántos.litros.de.almacenamiento.de.agua.posee.),decreasing=TRUE)
    ,names.arg=c("No tiene","200 a 500 lts","Más de 500 lts","Menos de 200 lts"),
    ylim=c(0,700))

summary(tabla$X.Posee.baño.letrina.en.la.vivienda.)

summary(tabla$X.Posee.instalación.de.agua.CALIENTE.en.el.baño...De.qué.tipo.)

# Qué fuentes de energía utilizan para cocinar en su vivienda
summary(tabla$X.Qué.fuentes.de.energía.utilizan.para.cocinar.en.su.vivienda.)
summary(tabla$NA..1)
summary(tabla$NA..2)
summary(tabla$NA..3)
summary(tabla$NA..4)

# luz
summary(tabla$X.Qué.tipo.de.conexión.posee.a.la.red.eléctrica.)

barplot(sort(summary(tabla$X.Qué.tipo.de.conexión.posee.a.la.red.eléctrica.)),
        names.arg=c("no tiene","comunitario","medidor","informal"),
        ylim=c(0,600))

summary(tabla$X.Sufrió.la.pérdida.de.electrodomésticos.o.herramientas.de.trabajo.por.las.condiciones.de.la.instalación.eléctrica.EN.EL.ÚLTIMO.AÑO.)

summary(tabla$X.Sufrió.incendios.dentro.de.su.vivienda.durante.el.último.año.debido.a.las.condiciones.de.la.instalación.eléctrica.)

summary(tabla$X.Posee.servicio.de.internet.de.banda.ancha.en.la.vivienda.)

summary(tabla$En.su.hogar.hay.AL.MENOS.UN.celular.que.permite.el.acceso.a.internet.a.través.de.datos.móviles..abono.tarjeta.)

summary(tabla$X.Cuántas.computadoras.de.escritorio..notebooks.y.o.netbooks.poseen.en.la.vivienda.)
barplot(table(tabla$X.Cuántas.computadoras.de.escritorio..notebooks.y.o.netbooks.poseen.en.la.vivienda.),
     ylim = c(0,1000),
     xlab = "cantidad de dispositivos", ylab = "frecuencia",
     main = "Cuántas computadoras de escritorio, notebooks y/o netbooks poseen",)

sd(tabla$X.Cuántas.computadoras.de.escritorio..notebooks.y.o.netbooks.poseen.en.la.vivienda.)

summary(tabla$X.Cuántos.teléfonos.y.o.tablets.poseen.en.la.vivienda.)
barplot(table(tabla$X.Cuántos.teléfonos.y.o.tablets.poseen.en.la.vivienda.),
        ylim = c(0,400),
        xlab = "cantidad de dispositivos", ylab = "frecuencia",
        main = "Cuántos teléfonos y/o tablets poseen en la vivienda",)

sd(tabla$X.Cuántos.teléfonos.y.o.tablets.poseen.en.la.vivienda.)
