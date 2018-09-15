#install.packages("expert")
library(expert)

# Especialistas: EXP1, EXP2, EXP3
# Seeds: SEM1, SEM2
# Varíavel de interesse INT

x <- list(EXP1 <- list(	SEM1 <- c(10,30,60),
                         SEM2 <- c(20000,27000,30000),
                         INT <- c(100000, 184000, 250000)),
          EXP2 <- list(	SEM1 <- c(4,6,10),
                         SEM2 <- c(21000,24000,26000),
                         INT <- c(140000,160000,190000)),
           EXP3 <- list(	SEM1 <- c(5,12,20),
                         SEM2 <- c(23000,26000,29000),
                         INT <- c(120000,300000,400000)),
           EXP4 <- list(	SEM1 <- c(7,10,14),
                         SEM2 <- c(23000,27000,30000),
                         INT <- c(80000,140000,200000)))

#quantils 10,50,90
prob <- c(0.3, 0.5, 0.8)

#semente verdadeira
semverd <- c(13, 24478)

#inferencia
inf <- expert(x, "cooke", prob, semverd)


#decision maker, combinação das avaliações dos especialistas
inf
hist(inf,col = "blue")

#comparando as distribuições agregado e especialistas
par(bg = "white")
split.screen(c(2,2))
screen(1)
hist(inf,col = "gray",main ="Distribuição agregada")
screen(2)
s = density(c(650, 800, 850))
plot(s,main="Especialista 1")
polygon(s,col="blue")
screen(3)
s = density(c(500, 600, 700))
plot(s,main="Especialista 2")
polygon(s,col="blue")
screen(4)
s = density(c(450, 650, 800))
plot(s,main="Especialista 3")
polygon(s,col="blue")
close.screen(all = TRUE) 

#mais informações da inferencia
#quantile zero e 100 são calculados automaticamnete
summary(inf)

#quantiles
quantile(inf)

#media dos quatis
mean(inf)

#distribuição cumulativa
dc = cdf(inf)
plot(dc)

#ogiva, usado para mostrar a frequencia acumulada
og = ogive(inf)
plot(og)

