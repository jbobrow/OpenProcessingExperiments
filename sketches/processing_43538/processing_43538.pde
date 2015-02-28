
PFont font; 
float angle = 23.5;

void setup() {
  size(620, 620);
  background (random (1, 255), random (1, 255), random (1, 255));
  smooth();
}
void draw() {
  if (mousePressed) {
    fill (0); 
    text("J'ADORE LES EDITIONS AL DANTE", mouseX, mouseY);
  } 
  else {
    fill (255);
  }
  text("LAURENT CAUWET EST UN GENTIL GARCON", mouseX+80, mouseY+20); 
}


