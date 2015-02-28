

void setup() {
  size(250,250);
  background (0);
  stroke(255);
}

void draw() {
  if(mousePressed) {
    strokeWeight(2);
    stroke(255,0,0);
    point(mouseX,mouseY);
    stroke(0,0,255);
    point (mouseY,mouseX);
    smooth();
    if(keyPressed) {
      saveFrame("dmf3.png");
    }
  }
  if(keyPressed) {
    background(0);
  }
}



