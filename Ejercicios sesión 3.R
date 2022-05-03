
# Paquetes Sugeridos para la ejecución del codigo del capitulo ------------

library(compiler)
library(memoise)
library(microbenchmark)


# Asignación de memoria ---------------------------------------------------

# Función ls()
name <- "Carmen"; n1 <- 10; n2 <- 100; m <- 0.5
ls()

# Objetos que contengan un caracter en particular, todos aquellos que tengan M
ls(pat = "m")

# Restringir la lista a aquellos objetos que comienzan con este carácter
ls(pat = "^m")

# Función ls.str()
ls.str()

# Limpiar el espacio e trabajo/Borrar objetos en memoria:
rm() #función para borrar objetos

w <- 9
rm (w)
x <- 1
y <- 2
rm(x, y) #elimina ambos objetos x y y.
x #Comprobar si el objeto 'x' todavía está en la memoria. (Error: object 'x' not found)

x1 <- 41
y2 <- 62
rm(list = ls()) #elimina todos los objetos en memoria
ls() #Comprueba si todavía hay algún objeto en la sesión 
#character(0) como output de la función ls significa que no hay objetos en el entorno de trabajo.

#Nota:las mismas opciones mencionadas para la función
#ls() se pueden usar para borrar selectivamente algunos objetos
A <- "Carmen"; n1 <- 10; n2 <- 100; m <- 0.5
rm(list = ls(pat = "^m"))


# Vectorización de codigo -------------------------------------------------

x <- 2
y <- 1
z <- x + y #Suma de dos vectores
#Suma como bucle con FOR
z <- numeric(length(x))
for (i in 1:length(z)) z[i] <- x[i] + y[i]


# Función apply() ---------------------------------------------------------

# Two dimensional matrix
M <- matrix(seq(1,16), 4, 4)
M

# apply min to rows
apply(M, 1, min)

# apply max to columns
apply(M, 2, max)

# apply sum to columns
apply(M, 2, sum) 


# Función lapply() --------------------------------------------------------

x <- list(a = 1, b = 1:3, c = 10:100) 
x

lapply(x, FUN = length) 

lapply(x, FUN = sum) 


# Función sapply() --------------------------------------------------------

x <- list(a = 1, b = 1:3, c = 10:100)
x

# Compare with above; a named vector, not a list 
sapply(x, FUN = length)  

sapply(x, FUN = sum) 


# Almacenamiento de variables ---------------------------------------------

M <- matrix(seq(1,16), 4, 4)
M

apply(M, 2, function(i) mean(i) / sd(M))

sd_M <- sd(M)
apply(M, 2, function(i) mean(i) / sd_M)


# Función memoise ---------------------------------------------------------

plot_mpg = function(row_to_remove) {
  data(mpg, package = "ggplot2")
  mpg = mpg[-row_to_remove, ]
  plot(mpg$cty, mpg$hwy)
  lines(lowess(mpg$cty, mpg$hwy), col = 2)
}

m_plot_mpg = memoise(plot_mpg)
microbenchmark(times = 10, unit = "ms", m_plot_mpg(10), plot_mpg(10))


# Paquete compiler --------------------------------------------------------

mean_r = function(x) {
  m = 0
  n = length(x)
  for(i in seq_len(n))
    m = m + x[i] / n
  m
  
}

cmp_mean_r = cmpfun(mean_r)
cmp_mean_r

x = rnorm(1000)
microbenchmark(times = 10, unit = "ms", # milliseconds
               mean_r(x), cmp_mean_r(x), mean(x))
