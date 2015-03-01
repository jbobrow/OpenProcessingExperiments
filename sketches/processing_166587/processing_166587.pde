
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

PImage webImg;





void setup() {
size(442,550);

PImage img;
img = loadImage("http://media-cache-ak0.pinimg.com/736x/b3/60/9f/b3609f0d47e0a6f7c744b272e7d8b7ae.jpg");
background(img);
  // Load image from a web server
  webImg = loadImage("http://media-cache-ak0.pinimg.com/736x/b3/60/9f/b3609f0d47e0a6f7c744b272e7d8b7ae.jpg");
}

void draw() {
  background(0);
  image(webImg, 0, 0);

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
}
/*
  Name: Ada Lovelace Day
  Author: Pedro Vasconcelos e Victor George
  Date: 13/10/2014 16:14
  Description: RepresentaÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â§Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â£o feita em homenagem ao Ada Lovelace Day,
  que Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â© dia de celebrar e, mais que isso, espalhar as conquistas de
  mulheres na Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¡rea da ciÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Âªncia, tecnologia, engenharia e matemÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¡tica
  com o objetivo de incentivar outras a seguirem carreia nestas Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¡reas.
  
    A represantaÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â§Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â£o consiste em uma foto de Ada Lovelace, inspiradora
    do dia em questÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â£o com uma sequÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Âªncia de bits cujo significado Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â©
    "Ada" em hexadecimal. No bit 0 central estÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¡ ilustrado o sÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â­mbolo da mulher,
    representando todas as conquistas da Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¡rea na tecnologia e a 
    importÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¢ncia desse dia.
      
*/

size(442,550);
/**PImage img;
img = loadImage("http://media-cache-ak0.pinimg.com/736x/b3/60/9f/b3609f0d47e0a6f7c744b272e7d8b7ae.jpg");
background(img);**/

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



