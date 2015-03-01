
/**
Alunos: Elder Renan Martins Nogueira e Matheus Felipe Oliveira Aeroso.
Matrícula: 1612255 e 1660098
Data: 13/10//2014
Expĺicação: Charles Babbage, o projetista do primeiro computador de uso geral,
é considerado o pai da computação. E a Condessa de Lovelace, a primeira programadora.
Assim como as flores na cabeça, são o ponto marcante das representações de Ada, a gravata é o de Charles.
**/

//Tamanho da tela  
size(750, 500);


//Traçados, usados para desenhar os frizos da gravata e define a suavização(anti-serrilhado).
stroke(#000000);
strokeCap(PROJECT);
strokeWeight(4);
smooth(10);

//Preenchimento em nível de preto e criação de dois trapézios.
fill(#555555);
quad(250, 100, 500, 200, 500, 300, 250, 400);
quad(710, 100, 460, 200, 460, 300, 710, 400);



//Frisos da gravata
line(280, 240, 680, 240);
line(280, 270, 680, 270);

//Preenchimento em nível de preto e criação de retângulo arredondado.
fill(#333333);
rect(415, 160, 125, 175, 20);

//Frisos da gravata
line(470, 250, 470, 330);
line(490, 250, 490, 330);

//Texto
textSize(16);
text("Charles Babbage, o projetista do primeiro computador de uso geral,\n é considerado o pai da computação. E a Condessa de Lovelace, a primeira programadora.\n Assim como as flores na cabeça, são o ponto marcante das representações de Ada,\n a gravata é o de Charles.", 10, 30); 



