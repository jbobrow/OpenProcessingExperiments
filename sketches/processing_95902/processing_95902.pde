
/*
SEMINARIO 2 - VARIABLES
Alejandra Martí Jover
Grupo 03
2n GEDI - Ingeniería en diseño industrial
*/
int x;
int y;
/*Empezaremos indicando la medida del dibujo, 
el color que queremos para el fondo, las lineas
y el relleno de los dibujos, también indicaremos 
los valores constantes.
*/
void setup(){
  size(300,300);
  background(255);
}
/*Seguimos haciendo el dibujo deseado utilizando las 
diferente herramientas, en este caso usaremos el rect,
ellipse. Los componentes hay que ponerlos en función de mouseX
y mouseY para que el dibujo se mueva con el ratón.
*/
void draw(){
  background(255);
//Perfil de la base del cupcake. Lo he hecho a traves de vértices. 
  fill(196,250,103);
  noStroke();
  beginShape();
  vertex(mouseX,mouseY);
  vertex(mouseX+25,mouseY+45);
  vertex(mouseX+75,mouseY+45);
  vertex(mouseX+100,mouseY);
  vertex(mouseX,mouseY);
  endShape();
//color y forma de la magdalena del cupcake.Elipse.
  fill(155,90,11);
  ellipse(mouseX+50,mouseY,100,25);
//color y superficie del cupcake.Círculos.
  fill(253,255,173);
  ellipse(mouseX+10,mouseY-10,30,30);
  ellipse(mouseX+25,mouseY-20,30,30);
  ellipse(mouseX+25,mouseY-15,30,30);
  ellipse(mouseX+40,mouseY-30,30,30);
  ellipse(mouseX+90,mouseY-10,30,30);
  ellipse(mouseX+75,mouseY-20,30,30);
  ellipse(mouseX+60,mouseY-30,30,30);
  ellipse(mouseX+50,mouseY-40,30,30);
  ellipse(mouseX+50,mouseY-20,30,30);
  ellipse(mouseX+40,mouseY-10,30,30);
  ellipse(mouseX+60,mouseY-10,30,30);
//diferentes adornos del cupcake. Círculos.
  fill(252,25,113);
  ellipse(mouseX+40,mouseY-40,25,25);
  fill(255);
  ellipse(mouseX+38,mouseY-42,8,8);
//bolitas de color verde
  fill(28,252,25);
  ellipse(mouseX+5,mouseY-10,5,5);
  ellipse(mouseX+25,mouseY-15,5,5);
  ellipse(mouseX+75,mouseY-20,5,5);
  ellipse(mouseX+55,mouseY-50,5,5);
//bolitas de color azul
  fill(0,250,255);
  ellipse(mouseX+15,mouseY-20,5,5);
  ellipse(mouseX+65,mouseY-40,5,5);
  ellipse(mouseX+100,mouseY-5,5,5);
  ellipse(mouseX+55,mouseY-8,7,5);
//bolitas de color rosa
  fill(255,3,230);
  ellipse(mouseX+85,mouseY-15,5,5);
  ellipse(mouseX+50,mouseY-20,5,5);
  ellipse(mouseX+17,mouseY,5,5);
//bolitas de color rojo
  fill(255,0,0);
  ellipse(mouseX+80,mouseY+3,5,5);
  ellipse(mouseX+40,mouseY-8,5,5);
  ellipse(mouseX+70,mouseY-30,5,5);
  ellipse(mouseX+20,mouseY-32,5,5);
}  


