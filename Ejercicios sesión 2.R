# CREAR VECTOR
vector <- c(1,2,3,4,5)

# QUE OBJETOS HAY EN LA SESION ACTUAL DE R
ls()
data("iris")
View(iris)

# AUTOCOMPLETADO Tools > Global Options > Code > Completion
mean(iris$Sepal.Length)
"ejercicios.R"

# ATAJOS DE TECLADO Alt+Shift+K
# Tools > Modify Keyboard Shortcuts.

# DIRECTORIOS
# R_HOME
R.home()

# HOME
Sys.getenv("HOME")

# CURRENTY DIRECTORY
getwd()


# EXISTE .Rprofile
file.exists(".Rprofile")

# EDITAR .Rprofile
file.edit(".Rprofile")

# EDITAR .Renviron
file.edit(".Renviron")

# INVOCAR A LAS VARIABLES DE ENTORNO CREADAS EN .Renviron
Sys.getenv("R_LIBS")
Sys.getenv("API_KEY")

# MODIFICAR OPCIONES GLOBALES
suma <- 1+
  1
4.597878*9.326844
options(prompt = "R> ", digits = 3, continue = "  ")


