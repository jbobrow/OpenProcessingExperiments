
int diametro = 100;
void setup() {
  size(500, 500);
  background(72, 237, 156);
}
  
void draw () {
  fill(170, 20);
  ellipse(mouseX, mouseY, diametro, diametro);
  
  if (mousePressed) {
    diametro=diametro - 4;
  }
  if (mousePressed) {
    fill(159, 72, 237);
    background(0);
  }
 if (diametro > width) {
    diametro= 0;
  }
}
void mouseReleased() {
    diametro=200;
}
