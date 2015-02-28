
// brailleKeyboard
PFont miFuente;

void setup() {
  size(900,600);
  smooth();
  background(20);
  miFuente = loadFont( "BookAntiqua-Bold-48.vlw");
}

void draw(){}

void keyPressed() {
  
  if (key == 'a') {
     dibujarCelda( 1, 0, 0, 0, 0, 0, "a", random(width), random(height));
      }
  if(key == 'b'){
      dibujarCelda( 1, 1, 0, 0, 0, 0, "b", random(width), random(height));
  }
  if (key == 'c') {
    dibujarCelda( 1, 0, 0, 1, 0, 0, "c", random(width), random(height) );
  }
  if (key == 'd') {
     dibujarCelda( 1, 0, 0, 1, 1, 0, "d", random(width), random(height) );
  }
  if (key == 'e') {
     dibujarCelda( 1, 0, 0, 0, 1, 0, "e", random(width), random(height) );
  } 
   if (key == 'f') {
     dibujarCelda( 1, 1, 0, 1, 0, 0, "f", random(width), random(height) );
  } 
   if (key == 'g') {
     dibujarCelda( 1, 1, 0, 1, 1, 0, "g", random(width), random(height) );
   } 
    if (key == 'h') {
    dibujarCelda( 1, 1, 0, 0, 1, 0, "h", random(width), random(height) );
  } 
   if (key == 'i') {
    dibujarCelda( 0, 1, 0, 0, 1, 0, "i", random(width), random(height) );
  } 
   if (key == 'j') {
     dibujarCelda( 0, 1, 0, 1, 1, 0, "j", random(width), random(height) );
  } 
   if (key == 'k') {
     dibujarCelda( 1, 0, 1, 0, 0, 0, "k", random(width), random(height) );
  } 
   if (key == 'l') {
     dibujarCelda( 1, 1, 1, 0, 0, 0, "l", random(width), random(height) );
  } 
   if (key == 'm') {
     dibujarCelda( 1, 0, 1, 1, 0, 0, "m", random(width), random(height) );
  } 
   if (key == 'n') {
     dibujarCelda( 1, 0, 1, 1, 1, 0, "n", random(width), random(height) );
  } 
  if (key == 'ñ') {
    dibujarCelda( 1, 1, 0, 1, 1, 1, "ñ", random(width), random(height) );
  } 
  if (key == 'o') {
    dibujarCelda( 1, 0, 1, 0, 1, 0, "o", random(width), random(height) );
  } 
  if (key == 'p') {
    dibujarCelda( 1, 1, 1, 1, 0, 0, "p", random(width), random(height) );
  } 
  if (key == 'q') {
    dibujarCelda( 1, 1, 1, 1, 1, 0, "q", random(width), random(height) );
  } 
  if (key == 'r') {
    dibujarCelda( 1, 1, 1, 0, 1, 0, "r", random(width), random(height) );
  } 
   if (key == 's') {
    dibujarCelda( 0, 1, 1, 1, 0, 0, "s", random(width), random(height) );
  } 
   if (key == 't') {
    dibujarCelda( 0, 1, 1, 1, 1, 0, "t", random(width), random(height) );
  } 
   if (key == 'u') {
    dibujarCelda( 1, 0, 1, 0, 0, 1, "u", random(width), random(height) );
  } 
   if (key == 'v') {
    dibujarCelda( 1, 1, 1, 0, 0, 1, "v", random(width), random(height) );
  } 
   if (key == 'w') {
    dibujarCelda( 0, 1, 0, 1, 1, 1, "w", random(width), random(height) );
  } 
   if (key == 'x') {
    dibujarCelda( 1, 0, 1, 1, 0, 1, "x", random(width), random(height) );
  } 
   if (key == 'y') {
    dibujarCelda( 1, 0, 1, 1, 1, 1, "y", random(width), random(height) );
  } 
   if (key == 'z') {
    dibujarCelda( 1, 0, 0, 0, 1, 0, "z", random(width), random(height) );
  } 
    
}
 
 void mousePressed(){
  background(20);
}
 // Función dibujarCelda

void dibujarCelda(  int b1, int b2, int b3, int b4, int b5, int b6,  String texto, float centroX, float centroY  ) {
  float tamano = 6;
  ellipseMode(CENTER);

  // Dibujar contronos de Bolitas
  fill(30);
  ellipse(centroX+10, centroY+10, tamano, tamano); // b1
  ellipse(centroX+10, centroY+20, tamano, tamano); // b2
  ellipse(centroX+10, centroY+30, tamano, tamano); // b3
  ellipse(centroX+20, centroY+10, tamano, tamano); // b4
  ellipse(centroX+20, centroY+20, tamano, tamano); // b5
  ellipse(centroX+20, centroY+30, tamano, tamano); // b6

  // Rellenar
  fill(random(255));
  if(b1 == 1)ellipse(centroX+10, centroY+10, tamano, tamano); // b1
  if(b2 == 1)ellipse(centroX+10, centroY+20, tamano, tamano); // b2
  if(b3 == 1)ellipse(centroX+10, centroY+30, tamano, tamano); // b3
  if(b4 == 1)ellipse(centroX+20, centroY+10, tamano, tamano); // b4
  if(b5 == 1)ellipse(centroX+20, centroY+20, tamano, tamano); // b5
  if(b6 == 1)ellipse(centroX+20, centroY+30, tamano, tamano); // b6

  // txt
  textFont(miFuente, 12);
  text(texto, centroX+15, centroY+45);
}
 

                
                                                
