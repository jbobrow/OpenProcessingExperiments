
size(500,500);
smooth();
 strokeWeight(1);
 
int columna=0;
int fila=0;


while(fila<height) {
  while (columna<width) {
    
  ellipse (columna, fila, 5,5);
  columna=columna+5;
  
  }
fila=fila+5;
columna=0;

  

}
