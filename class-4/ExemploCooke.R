#install.packages("expert")
library(expert)

# Especialistas: EXP1, EXP2, EXP3
# Seeds: SEM1, SEM2
# Varíavel de interesse INT

x <- list(	EXP1 <- list(	SEM1 <- c(75, 80, 85),
                         SEM2 <- c(10, 15, 20),
                         INT <- c(650, 800, 850)),
           EXP2 <- list(	SEM1 <- c(80, 90, 95),
                         SEM2 <- c(25, 30, 35),
                         INT <- c(500, 600, 700)),
           EXP3 <- list(	SEM1 <- c(65, 70, 80),
                         SEM2 <- c(20, 25, 30),
                         INT <- c(450, 650, 800)))

# Pesquisar como isso funciona
#quantils 10,50,90
prob <- c(0.1, 0.5, 0.9)

#semente verdadeira
semverd <- c(80, 25)

#inferencia
inf <- expert(x, "ms", prob, semverd) # ms ou cooke


#decision maker, combinação das avaliações dos especialistas
inf
hist(inf,col = "blue")


