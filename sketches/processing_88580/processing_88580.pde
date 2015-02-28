
void setup() {
  size (400, 400);
  smooth();
}

void draw() {
  background(150, 150, 150);

  for (int j=200; j<400; j+=100) {
    for (int i=0; i<400; i+=40) {
      beginShape();
      stroke(0);
      fill(255, 20, 50);
      vertex(mouseX, mouseY); // first point
      bezierVertex(i, 25, i+100, 25, mouseX, mouseY);
      endShape();
    }
  }
  for (int j=200; j<400; j+=100) {
    for (int i=400; i>0; i-=40) {
      beginShape();
      stroke(0);
      fill(255, 20, 50);
      vertex(mouseX, mouseY); // first point
      bezierVertex(i, 325, i+100, 325, mouseX, mouseY);
      endShape();
    }
  }
  for (int j=100; j<200; j+=100) {
    for (int i=0; i<400; i+=50) {
      beginShape();
      noStroke();
      fill(255, 255, 255, 50);
      vertex(mouseY, mouseX); // first point
      bezierVertex(25, i, 25, i+100, mouseY, mouseX);
      endShape();
    }
  }
  for (int j=400; j>290; j-=100) {
    for (int i=300; i>0; i-=50) {
      beginShape();
      noStroke();
      fill(255, 255, 255, 50);
      vertex(mouseY, mouseX); // first point
      bezierVertex(375, i, 375, i+100, mouseY, mouseX);
      endShape();
    }
  }
}



