
void setup() {
  size(500, 500);
  smooth();
}


void draw() {
  if(mousePressed == true){
    blurredLine(pmouseX, pmouseY, mouseX, mouseY);
  }
}


void blurredLine(float x1, float y1, float x2, float y2) {
  strokeWeight(random(1, 3));
  stroke(0, 100);
  for(int i = 0; i < 25; i++) {
    line(x1 + random(15), y1 + random(15), x2 + random(15), y2 + random(15));
  }
}


void keyPressed() {
  save("blurredLine.png");
}

