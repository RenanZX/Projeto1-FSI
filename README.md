# Projeto1-FSI
O projeto possui o intuito de criar um sistema inteligente, que seja capaz de classificar dígitos manuscritos através dos algoritmos de classificação LDA e Knn.

## Requisitos
É necessário instalar o R e configurá-lo caso queira executar este programa
- [Versão linux](http://www.jason-french.com/blog/2013/03/11/installing-r-in-linux/)
- [Versão Windows](https://cran.r-project.org/bin/windows/base/)

## Instruções de execução
1 - Abra o terminal

2 - Vá até a pasta do projeto

3 - Digite ```Rscript Projeto1.r```

4 - Ao entrar o programa requisitará os arquivos para classificação, é necessário abrir os arquivos nesta ordem(todos estes arquivos se encontram na pasta do projeto):
-> primeiro abra o arquivo ```train-images.idx3-ubyte``` 
-> segundo o arquivo ```train-labels.idx3-ubyte``` 
-> terceiro o arquivo ```t10k-images.idx3-ubyte```
-> por último o arquivo ```t10k-labels.idx1-ubyte```

5 - Assim que o programa executar, ele pedirá que você insira algum valor para K, você deve inserir o valor correspondente
ao que o programa pede para ser inserido, e por fim uma matriz será exibida com todos os cálculos feitos pelo programa.