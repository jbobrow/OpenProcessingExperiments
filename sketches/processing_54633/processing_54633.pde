
import processing.pdf.*;
size(800,400, PDF, "mipdf2.pdf");
smooth();
 strokeWeight(1);
 background(0);
int columna=0;
int fila=0;


while(fila<height) {
  fill (random(255),random(255),random(255),random(100));
  fila=fila+10;
columna=0;

  while (columna<width) {
    
  ellipse (columna, fila, 30,30);
  //fill (random(255),random(255),random(255),random(100));
  columna=columna+10;
  
  }



}

  println("Por fin terminé");
  exit(); // hacer salirse de draw
