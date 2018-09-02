# The code is a copy from here: https://github.com/CodingTrain/website/pull/404/files. I didn't find a package with the implementation of A* in R, and I failed on implment A* in R.
source("class-3/AStar.R")

d <- matrix(Inf, nrow = 100, ncol = 100)

huller <- sample(2:99, 25)

for (x in 1:10) {
  for (y in 0:9) {
    p <- x + 10 * y
    if (!(p %in% huller)) {
      if (x > 1 & (!(p - 1) %in% huller)) {
        d[p, p - 1] <- 1
      }
      if (x < 10 & (!(p + 1) %in% huller)) {
        d[p, p + 1] <- 1
      }
      if (y > 0 & (!(p - 10) %in% huller)) {
        d[p, p - 10] <- 1
      }
      if (y < 9 & (!(p + 10) %in% huller)) {
        d[p, p + 10] <- 1
      }
    }
  }
}

manhattan <- function(a, b) {
  xa <- a %% 10
  if (xa == 0) {
    xa <- 10
  }
  ya <- a %/% 10
  xb <- b %% 10
  if (xb == 0) {
    xb <- 10
  }
  yb <- b %/% 10
  abs(xa - xb) + abs(ya - yb)
}

euclidean <- function(a, b) {
  xa <- a %% 10
  if (xa == 0) {
    xa <- 10
  }
  ya <- a %/% 10
  xb <- b %% 10
  if (xb == 0) {
    xb <- 10
  }
  yb <- b %/% 10
  sqrt((xa - xb) ^ 2 + (ya - yb) ^ 2)
}

tegn <- function(solution) {
  for (j in 0:9) {
    streng <- ""
    for (i in 1:10) {
      p <- i + 10 * j
      if (p %in% huller) {
        streng <- paste0(streng, "X")
      } else if (p %in% solution) {
        streng <- paste0(streng, "+")
      } else {
        streng <- paste0(streng, ".")
      }
    }
    print(streng)
  }
}


print("No diagonals (Heuristic: Manhattan distance)")
print("")
s <- aStar(1, 100, d, manhattan)
tegn(s)

print("")

# Add diagonals
for (x in 1:10) {
  for (y in 0:9) {
    p <- x + 10 * y
    if (!(p %in% huller)) {
      if (x > 1 & y > 0 & (!(p - 11) %in% huller)) {
        d[p, p - 11] <- sqrt(2)
      }
      if (x < 10 & y > 0 & (!(p - 9) %in% huller)) {
        d[p, p - 9] <- sqrt(2)
      }
      if (x > 1 & y < 9 & (!(p + 9) %in% huller)) {
        d[p, p + 9] <- sqrt(2)
      }
      if (x < 10 & y < 9 & (!(p + 11) %in% huller)) {
        d[p, p + 11] <- sqrt(2)
      }
    }
  }
}

print("With diagonals (Heuristic: Euclidean distance)")
print("")
s <- aStar(1, 100, d, euclidean)
tegn(s)

# Reference: http://theory.stanford.edu/~amitp/GameProgramming/AStarComparison.html#the-a-star-algorithm
# O A* combina dois algoritmos: Dijkstra, para encontrar o caminho mais curto, e Greedy Best-First-Search como heurística para estimar quão longe do ponto final determinado vértice está. O Dijkstra favorece vértices que estão mais perto do ponto inicial, enquanto o Greedy Best-First-Search favorece os vértices que estão mais próximos do ponto final.
# Para o A* saber qual será o próximo vértice, é usada a seguinte função: f(n) = g(n) + h(n). g(n) representa o custo exato do vértice n até o ponto inicial, e h(n) representa um custo estimado do vértice n até o ponto final. O vértice com o menor valor de f(n), será seguido.

# O algoritmo implementado neste exemplo, gera obstáculos aleatórios (X) em uma matriz, e com diferentes métodos heurísticos (Manhattan e Euclidean), busca encontrar um caminho para ir da posição 1 até a posição 100 da matriz. Como a posição dos obstáculos é randomizada, há a possibilidade do algoritmo não conseguir chegar a nenhuma solução.