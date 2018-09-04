require(MASS)
library(ggplot2)

leitor <- list(
  read_image_file = function(filename) {
    ret = list()
    f = file(filename,'rb')
    readBin(f,'integer',n=1,size=4,endian='big')
    ret$n = readBin(f,'integer',n=1,size=4,endian='big')
    nrow = readBin(f,'integer',n=1,size=4,endian='big')
    ncol = readBin(f,'integer',n=1,size=4,endian='big')
    x = readBin(f,'integer',n=ret$n*nrow*ncol,size=1,signed=F)
    ret$x = matrix(x, ncol=nrow*ncol, byrow=T)
    close(f)
    ret
  },
  read_label_file = function(filename) {
    f = file(filename,'rb')
    readBin(f,'integer',n=1,size=4,endian='big')
    n = readBin(f,'integer',n=1,size=4,endian='big')
    y = readBin(f,'integer',n=n,size=1,signed=F)
    close(f)
    y
  },
  show_digits = function(images,lables){
    grayscale <- colorRampPalette(c('white','black'))
    par(mar=c(1,1,1,1), mfrow=c(8,8),pty='s',xaxt='n',yaxt='n')
    
    for(i in 1:40) 
    {
      z<-array(images$x[i,],dim=c(28,28))
      z<-z[,28:1] ##right side up
      image(1:28,1:28,z,main=labels[i],col=grayscale(256), , xlab="", ylab="")
    }
  }
)

processor <- list(
  processarKnn = function(trainx,testx,trainy,testy){
    ## Let's predict on a test set of 100 observations. 
    
    set.seed(120) 
    test <- 1:100
    train.gc <- trainx[test,]
    test.gc <- testx[test,]
    
    train.def <- trainy[test]
    test.def <- testy[test]
    
    ## Let's use k values (no of NNs) as 1, 5 and 20 to see how they perform in terms of correct proportion of classification and success rate. The optimum k value can be chosen based on the outcomes as below...
    
    library(class)
    
    knn.1 <-  knn(train.gc, test.gc, train.def, k=1)
    knn.5 <-  knn(train.gc, test.gc, train.def, k=5)
    knn.20 <- knn(train.gc, test.gc, train.def, k=20)
    
    ## Let's calculate the proportion of correct classification for k = 1, 5 & 20 
    
    print(paste("K=1",(100 * sum(test.def == knn.1)/100),"%"))  # For knn = 1
    print(paste("K=5",(100 * sum(test.def == knn.5)/100),"%"))  # For knn = 5
    print(paste("K=20",(100 * sum(test.def == knn.20)/100),"%"))  # For knn = 20
  },
  GenerateTableknn = function(n){
    if(n == 1){
      confusion_matrix <- as.data.frame(table(knn.1, test.def))
    
      print(ggplot(data = confusion_matrix,
             mapping = aes(x = knn.1,
                           y = test.def)) + xlab("Valores de Knn para K=1") +
        ylab("Valores testados") +
        geom_tile(aes(fill = Freq)) +
        geom_text(aes(label = sprintf("%1.0f", Freq)), vjust = 1) +
        scale_fill_gradient(low = "blue",
                            high = "red",
                            trans = "log"))
    }else if(n == 5){
      confusion_matrix <- as.data.frame(table(knn.5, test.def))
    
      print(ggplot(data = confusion_matrix,
             mapping = aes(x = knn.5,
                           y = test.def)) + xlab("Valores de Knn para K=5") +
        ylab("Valores testados") +
        geom_tile(aes(fill = Freq)) +
        geom_text(aes(label = sprintf("%1.0f", Freq)), vjust = 1) +
        scale_fill_gradient(low = "blue",
                            high = "red",
                            trans = "log"))
    }else if(n == 20){
      print(ggplot(data = confusion_matrix,
             mapping = aes(x = knn.20,
                           y = test.def)) + xlab("Valores de Knn para K=20") +
        ylab("Valores testados") +
        geom_tile(aes(fill = Freq)) +
        geom_text(aes(label = sprintf("%1.0f", Freq)), vjust = 1) +
        scale_fill_gradient(low = "blue",
                            high = "red",
                            trans = "log"))
    }
  },
  processarLDA = function(trainx,testx,trainy,testy){
    # fit the model
    #lda_fit <- lda(X_train, y_train)
    
    # model predictions for the test set
    #lda_pred <- predict(lda_fit, X_test)
    
    # prediction accuracy
    #ct <- table(lda_pred$class, y_test)
    #sum(diag(prop.table(ct))
  }
)

readinteger <- function()
{ 
  n <- readline(prompt="Digite o valor escolhido de K, para K=1,K=5 ou K=20: ")
  return(as.integer(n))
}


train_images <<- leitor$read_image_file(file.choose())
train_labels <<- leitor$read_label_file(file.choose())

test_images <<- leitor$read_image_file(file.choose())
test_labels <<- leitor$read_label_file(file.choose())

processor$processarKnn(train_images$x,test_images$x,train_labels,test_labels)
processor$GenerateTableknn(readinteger())