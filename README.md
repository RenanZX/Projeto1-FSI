# Projeto1-FSI
O projeto possui o intuito de criar um sistema inteligente, que seja capaz de classificar d�gitos manuscritos atrav�s dos algoritmos de classifica��o LDA e Knn.

## Requisitos
� necess�rio instalar o R e configur�-lo caso queira executar este programa
- [Vers�o linux](http://www.jason-french.com/blog/2013/03/11/installing-r-in-linux/)
- [Vers�o Windows](https://cran.r-project.org/bin/windows/base/)

## Instru��es de execu��o
1 - Abra o terminal

2 - V� at� a pasta do projeto

3 - Digite ```Rscript Projeto1.r```

4 - Ao entrar o programa requisitar� os arquivos para classifica��o, � necess�rio abrir os arquivos nesta ordem(todos estes arquivos se encontram na pasta do projeto):
-> primeiro abra o arquivo ```train-images.idx3-ubyte``` 
-> segundo o arquivo ```train-labels.idx3-ubyte``` 
-> terceiro o arquivo ```t10k-images.idx3-ubyte```
-> por �ltimo o arquivo ```t10k-labels.idx1-ubyte```

5 - Assim que o programa executar, ele pedir� que voc� insira algum valor para K, voc� deve inserir o valor correspondente
ao que o programa pede para ser inserido, e por fim uma matriz ser� exibida com todos os c�lculos feitos pelo programa.