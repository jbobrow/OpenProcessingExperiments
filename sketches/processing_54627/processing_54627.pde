
size(800,400);
smooth();
 strokeWeight(1);
 background(0);
int columna=0;
int fila=0;


while(fila<height) {
  fila=fila+10;
columna=0;

  while (columna<width) {
    
  ellipse (columna, fila, 30,30);
  fill (random(255),random(255),random(255),random(100));
  columna=columna+10;
  
  }

  

}
