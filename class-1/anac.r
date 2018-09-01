file1 <- read.csv(file = file.path(getwd(), "data/vra_062017.csv"), sep = ";", header = FALSE)
file2 <- read.csv(file = file.path(getwd(), "data/vra_062018.csv"), sep = ";", header = FALSE)
data <- rbind(file1, file2)
summary1 <- summary(file1)
summary2 <- summary(file2)

voos1 <- summary1[,1]
voos1 <- summary2[,1]

#for (i in 1:length(voos1)) { 
#  vr[i] <- vector[i]+i
#}

for (s in summary1[,1]) {
  print(s.split('-'))
}

#summary(file2)
#summary(data)
#sum <- colSums(summary1[,0])
#print(sum)

#qual ano se voou mais?
#voos realizados e cancelados por copanhia