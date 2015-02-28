
int diametro = 0;
void setup() {
  size(400, 400);
  background(0, 90, 255);
}

void draw () {
  fill(0, 90, 255, 10);
  rect(0, 0, width, height);
  noFill();
  ellipse(width/2, height/2, diametro, diametro);

  if (mousePressed) {
    diametro=diametro + 2;
  }


  if (diametro > width) {
    diametro=0;
  }
}
void mouseReleased() {
    diametro=0;
}
