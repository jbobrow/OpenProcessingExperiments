
//Variables
int x = 250;
int y = 166;
int radio = 90;

//Tamaño canvas, y desde donde crece la elipse
void setup() {
  size(500, 333);
  ellipseMode(RADIUS);
}

//Color de fondo, sin trazo, elipse, y cambio de relleno cuando cursor esté dentro de la elipse
void draw() {
  background(255);
  noStroke();

  float d = dist(mouseX, mouseY, x, y);
  if (d < radio) {
    fill(0);
  } 
  else {
    fill(188, 0, 45);
  }
  ellipse (x, y, radio, radio);
}
