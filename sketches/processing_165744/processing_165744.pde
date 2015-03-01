
/*
  Name: Ada Lovelace Day
  Author: Pedro Vasconcelos e Victor George
  Date: 13/10/2014 16:14
  Description: Representação feita em homenagem ao Ada Lovelace Day,
  que é dia de celebrar e, mais que isso, espalhar as conquistas de
  mulheres na área da ciência, tecnologia, engenharia e matemática
  com o objetivo de incentivar outras a seguirem carreia nestas áreas.
  
    A represantação consiste em uma foto de Ada Lovelace, inspiradora
    do dia em questão com uma sequência de bits cujo significado é
    "Ada" em hexadecimal. No bit 0 central está ilustrado o símbolo da mulher,
    representando todas as conquistas da área na tecnologia e a 
    importância desse dia.
      
*/

size(442,550);
PImage img;
img = loadImage("ada.jpg");
background(img);

// Desenhando os numeros binarios

rect(85,350,5,30); // retangulo que ilusta o bit 1
ellipseMode(CORNER);
ellipse(95,350,30,30); // elipse que ilusta o bit 0
noFill();

fill(255,255,255);
rect(130,350,5,30);
ellipseMode(CORNER);
ellipse(140,350,30,30);

rect(175,350,5,30);
rect(190,350,5,30);
  // Bit rosa e simbolo
  noStroke();
  fill(227,64,146);
  ellipseMode(CORNER);
  ellipse(200,350,30,30);
  rect(213,380,5,20);
  rect(206,387,20,5);
  
stroke(0,0,0);
fill(255,255,255);
rect(235,350,5,30);
rect(250,350,5,30);
ellipseMode(CORNER);
ellipse(260,350,30,30);

rect(295,350,5,30);
ellipseMode(CORNER);
ellipse(305,350,30,30);

textSize(32);
fill(242, 34, 138);
text("Ada Lovelace Day", 80, 500);



