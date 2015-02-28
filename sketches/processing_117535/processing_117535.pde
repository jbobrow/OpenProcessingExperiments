
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);  
}

void draw() {  //draw function loops 
  background(0);
  noStroke();
  fill(255);
  if (mousePressed) {
    drawHexagon2(width/2, height/2, 100);
  }
  else {
    drawHexagon(width/2, height/2, 100);
  }
}

void drawHexagon(float x, float y, float radius) {
  pushMatrix();
  translate(x, y);
  beginShape();
  for (int i = 0; i < 6; i++) {
    pushMatrix();
    float angle = PI*i/3;
    vertex(cos(angle) * radius, sin(angle) * radius);
    popMatrix();
  }
  endShape(CLOSE);
  popMatrix();
}

void drawHexagon2(float x, float y, float radius) {
  pushMatrix();
  translate(x, y);
  rotate(PI/6.0);
  beginShape();
  for (int i = 0; i < 6; i++) {
    pushMatrix();
    float angle = PI*i/3;
    vertex(cos(angle) * radius, sin(angle) * radius);
    popMatrix();
  }
  endShape(CLOSE);
  popMatrix();
}
