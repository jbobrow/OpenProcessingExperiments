
void setup() {
  size(500, 500);
  smooth();
  frameRate(5);
  fill(255,32);
  noStroke();
 
}

void draw() {
  background(0);
  //Utilizamos el incremento i parra dibujar burbujas de tamaño aleatorio 
  for (int i=0;  i<width;  i+=4){
      float tamano= random (i);
      ellipse (i, i, tamano, tamano);
    }  
    
}



