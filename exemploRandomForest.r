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

predict(iris.rf, testData)






