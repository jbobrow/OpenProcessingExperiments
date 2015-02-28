
//TRABALHO DO ALUNO VINÍCIUS DOS SANTOS MACHADO DA CUNHA
//A MINHA INSPIRAÇÃO PARA O TRABALHO FOI A PARTIR DA PERGUNTA COM QUANTOS GIGAS SE FAZ UMA CANOA
//DECIDI A PARTIR DESTA PERGUNTA FAZER UMA JANGADA A LUZ DO LUAR E APÓS ISSO VER QUANTOS DE ESPAÇO QUE ELA OCUPA EM UM COMPUTADOR



size (600,600); //tamanho da imagem a ser produzida
background (#00008B);// cor do fundo, retirado de http://pt.wikipedia.org/wiki/Anexo:Lista_de_cores

//lua
ellipseMode(CENTER);
fill(240);//cor um pouco mais escura que o branco
ellipse(100,0,300,300);//coordenadas e tamanho da lua

//preparando a base da jangada
noStroke();//bordas sem preenchimento
fill(#8B4513);//retirada de http://pt.wikipedia.org/wiki/Anexo:Lista_de_cores
rect(125,450,350,75);//base da jangada
triangle (125,450,125,525,50,450);//triangulo da esquerda da base retangular
triangle (475,450,550,450,475,525);//triangulo da direita da base retangular

//preparando o mastro e a bandeira da jangada
fill(#F5F5F5); //retirada de http://pt.wikipedia.org/wiki/Anexo:Lista_de_cores
rect(225,450,40,-300);//mastro
fill(#F0DC82); //retirada da ferramenta color selectror do processing
triangle(225,350,225,150,450,250);// flamula

//respondendo a pergunta de Gilberto Gil: Quantos giga Bytes se faz uma canoa

text("CARO SENHOR GILBERTO GIL, MINHA JANGADA TEM MENOS DE UM KB",100,470);
text(" E CONSEGUE VELEJAR EM QUALQUER DISQUETE",150,500);

