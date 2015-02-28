
/*Christian Uziel Carvajal Santos
	Aros OLÍMPICOS movimiento */

void setup()
{
  size(400,400);
  background(#FFFFFF);
  noFill(); 
  smooth();
  strokeWeight(4);
}

void draw () //Función que hace los dibujos
{
  background(#FFFFFF); //Fondo blanco al correrlo
  stroke(#3299CC);
  ellipse(150,150,70,70);
  
  stroke(#000000);
  ellipse(210,150,70,70);
  
  stroke(#FF0000);
  ellipse(mouseX+20,mouseY+3,70,70); // Función mouse(X,Y) para mover el circulo al mover el mouse
  
  stroke(#FFFF00);
  ellipse(190,200,70,70);
  
  stroke(#00FF00);
  ellipse(250,200,70,70);
  
} 

