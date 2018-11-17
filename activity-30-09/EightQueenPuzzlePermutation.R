library(GA)

tamanhoTabuleiro <- 8
maximoIteracoes <- 20

fitnessFunction <- function(x)
{
  for (i in 1:tamanhoTabuleiro) {
    linhaRainha1 <- i
    colunaRainha1 <- x[i]
    rainhaAtualTemConflito <- FALSE
    for (j in 1:tamanhoTabuleiro) {
      linhaRainha2 <- j
      colunaRainha2 <- x[j]
      # não precisa testar se tem conflito quando é a mesma rainha
      if (linhaRainha1 == linhaRainha2 &&
          colunaRainha1 == colunaRainha2) {
        next
      }
      rainhaAtualTemConflito <-
        abs(linhaRainha1 - linhaRainha2) == abs(colunaRainha1 - colunaRainha2)
      # se houver conflito entre as duas rainhas pode parar o algoritmo
      if (rainhaAtualTemConflito) {
        return(FALSE)
      }
    }
  }
  return(TRUE)
}

resultado = ga(
  "permutation",
  fitness = fitnessFunction,
  lower = rep(1, tamanhoTabuleiro),
  upper = rep(tamanhoTabuleiro, tamanhoTabuleiro),
  maxiter = maximoIteracoes
)

solucao <- summary(resultado)$solution
print(solucao)