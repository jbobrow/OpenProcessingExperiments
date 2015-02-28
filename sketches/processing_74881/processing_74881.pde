
//tamaño circulo
int x = 250;
int y = 250;
int radio = 100;
 
//Tamaño canvas, y desde donde crece la elipse
void setup() {
  size(500, 500);
  ellipseMode(RADIUS);
}
 
//fondo elipse, y cambio de relleno cuando el cursor pasa por dentro de la elipse
void draw() {
  background(255, 250, 205);
  noStroke();
 
  float d = dist(mouseX, mouseY, x, y);
  if (d < radio) {
    fill(0);
  }
  else {
    fill(250, 100, 5);
  }
  ellipse (x, y, radio, radio);
}
