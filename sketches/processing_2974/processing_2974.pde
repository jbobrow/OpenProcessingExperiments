
void setup(){ 
  size(500,500); //tamaño lienzo
   noStroke(); //no delineado

for (int i = 9; i  < 100; i++) { 
  for (int j = 9; j < 100; j++) {
    stroke(i, j, 100);
    point(i, j); //ciclo for puntos donde se ubican las elipses
  }
}  
  background(51); // color fondo 
  noStroke(); 
  smooth(); 
} 
void draw (){ 
 
float x= random (height); 
float y= random(width); // x e y al azar en el eje de coordenadas


fill(250,25,0,100); // color elipses
smooth(); // transparecia elipses

  ellipse(x, y, 2-second(), 2-second());  
} 
 	


