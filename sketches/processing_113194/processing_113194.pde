
/* Código Fonte da Casa Tiradentes - Arq. Gustavo Pena
Aluna: Stela Mara de Souza da Nóbrega 
Curso - Arquitetura e Urbanismo P1*/

size(800,600);
//ceu
background (151,188,216);


//linha de terra
strokeWeight(5);
line(0,400,800,400);

strokeWeight(1);
fill(69,214,159);
rect(0,400,800,600);

//Sombra residência
fill(0);
triangle (200,400,300,400,300,395);
rect (300,395,400,5);

//Estrutura
fill(234,202,197);
quad (200,400,200,395,300,390,300,395);
rect (300,390,400,5);

quad (200,300,200,295,300,290,300,295);
rect (520,290,180,5);
rect (300,290,20,5);


//arcos
fill (255,255,255,0);
strokeWeight (3.5);
arc(420, 290, 200, 40, radians(180),radians(360));
arc(420, 295, 200, 40, radians(180),radians(360));

//paredes
strokeWeight (1);
fill(234,202,197);
quad (200,300,200,395,300,390,300,295);
rect (600,295,100,95);

//vidros
strokeWeight (2.5);
line (300,335,600,335);
line (360,390,360,280);
line (420,390,420,275);
line (480,390,480,280);
line (540,390,540,295);

//informação
textSize(15);
fill(0,0,0);
text("Stela Mara de Souza da Nóbrega, Computação 1", 280, 480);
text("Casa Tiradentes - Arquiteto Gustavo Pena", 320, 510);
