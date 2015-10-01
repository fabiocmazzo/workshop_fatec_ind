library(randomForest)
data(iris)
set.seed(1)
# Vamos separar a massa de dados em Train e Test, respectivamente 75% e 25%
trainindex <- sample(nrow(iris), trunc(nrow(iris) * 0.75))
testindex  <- sample(nrow(iris), trunc(nrow(iris) * 0.25))

trainData <- iris[trainindex,]
testData  <- iris[testindex,]


# Obs: em massa de dados grandes, você pode limitar o número de árvores de descisão geradas
# com o paramêtro ntree
iris.rf <- randomForest(Species ~ ., data=trainData, importance=TRUE, proximity=TRUE)
# Imprimir a Conufusion Matrix
print(iris.rf)
# Vamos verificar a importância
round(importance(iris.rf), 2)

#Vamos remover a coluna Species, que será o atributo previsto
# para termos certeza que não irá interferir no resultado
# Obs: O atributo não intefere, vamos remover apenas para fins didáticos

predict(iris.rf, testData)






