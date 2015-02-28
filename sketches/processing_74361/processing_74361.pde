
int diametro = 10;
void setup() {
  size(500, 500);
  background(0, 70, 255);
}
 
void draw () {
  fill(170, 0, 0, 5);
  ellipse(mouseX, mouseY, diametro, diametro);
 
  if (mousePressed) {
    diametro=diametro + 4;
  }
 if (diametro > width) {
    diametro= 0;
  }
}
void mouseReleased() {
    diametro=0;
}
