# Fabio Covolo Mazzo
# 01/10/2015
# Workshop R e Learning Machine - Fatec Indaiatuba
library(randomForest)
data(iris)
set.seed(1)
# Vamos separar a massa de dados em Train e Test, respectivamente 75% e 25%
trainindex <- sample(nrow(iris), trunc(nrow(iris) * 0.75))
testindex  <- sample(nrow(iris), trunc(nrow(iris) * 0.25))

trainData <- iris[trainindex,]
testData  <- iris[testindex,]


# Obs: em massa de dados grandes, voc� pode limitar o n�mero de �rvores de descis�o geradas
# com o param�tro ntree
iris.rf <- randomForest(Species ~ ., data=trainData, importance=TRUE, proximity=TRUE)
# Imprimir a Conufusion Matrix
print(iris.rf)
# Vamos verificar a import�ncia
round(importance(iris.rf), 2)

#Vamos remover a coluna Species, que ser� o atributo previsto
# para termos certeza que n�o ir� interferir no resultado
# Obs: O atributo n�o intefere, vamos remover apenas para fins did�ticos
delCol <- c('Species')
testData <- testData[!(names(testData) %in% delCol)]

# Vamos agora para a m�gica
predictData <- predict(iris.rf, testData)

# Vamos fazer o merge agora com o Original para confirmar o que
# foi previsto com exatid�o e o que n�o foi

# Transformar primeiro o fator que recebemos do predict em um data.frame
predictData <- as.data.frame(predictData)

# Vamos renomear a coluna e criar uma coluna com o n�mero da linha
names(predictData) <- "valorPrevisto"

# Vamos criar uma coluna com o indice que � o rowName
predictData$indice <- row.names(predictData)

# O mesmo para o Iris
iris$indice <- row.names(iris)

dataFrameComparacao <- merge(iris,predictData, by = "indice")

# E Voil� :D
dataFrameComparacao





