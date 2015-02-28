
void cancha(){
  
// Dibujo de la matriz de circulos blancos para el fondo.
 for (int i = 40; i < 500; i = i+15) {
     for (int j = 0; j < 500; j = j+15) {
       fill (250,10);
        noStroke();
        ellipse(i, j, 13,  13);
      }
  }
 
}

