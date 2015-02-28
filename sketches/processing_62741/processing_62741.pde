
//+*{}[]=>< int x,y;int incX,incY;int velX,velY;void setup (){size (600,400);frame rate (60);
//Ejercicio sobre el uso de la función "for".
//Un juego compositivo probando las posibilidades del "for" con líneas y rectángulos.
float x = random(0, 100);

void setup() {
  size(500, 500);
  smooth();
}

void draw() { 
  float a = random(0, 50);
  background(0); 

  for (int i=0; i < width; i++) {
    float r = random(100);
    frameRate (3);
    triangle(100, 0, width, 0, width, 190);
    rect(i, i-r, i-r, i);
  }
  triangle (0, 0, width, height, 0, height);
  for (int i=0; i < height; i++) {
    float r = random(100);
    line(0, i+r, i, i+r);
  }
}


