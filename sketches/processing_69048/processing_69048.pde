
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(0);

  drawcurve(100, 100, 50, 50, 0, PI/2);
  drawcurve(100, 100, 60, 60, PI/2, PI);
  drawcurve(100, 100, 70, 70, PI, TWO_PI-PI/2);
  drawcurve(100, 100, 80, 80, TWO_PI-PI/2, TWO_PI);

  drawcurve(400, 250, 80, 80, 0, PI/2);
  drawcurve(400, 250, 80, 80, PI, TWO_PI-.25);

  drawcurve(250, 400, 60, 60, 5, 10);

  myPoint(100, 100);
  myPoint(100, 250);
  myPoint(100, 400);

  myPoint(250, 100);
  myPoint(250, 250);
  myPoint(250, 400);

  myPoint(400, 100);
  myPoint(400, 250);
  myPoint(400, 400);

  myLine(250, 100, 380, 100);
  myLine(105, 260, 115, 390); 
  myLine(100, 250, 100, 300);
  myLine(100, 320, 100, 335);
  myLine(100, 355, 100, 400);

  pushMatrix(); 
  translate (250, 215);
  rotate(radians(45));
  fill(255);
  rect(0, 0, 50, 50);
  popMatrix();

  strokeWeight(1);
  stroke(50);
  fill(0);
  triangle(230, 265, 270, 265, 250, 285);
}

void drawcurve(float xPos, float yPos, float w, float h, float st, float sp) {
  noFill();
  strokeWeight(1);
  stroke(255);
  arc(xPos, yPos, w, h, st, sp);
} 

void myPoint(float xPos, float yPos) {
  stroke(255);
  strokeWeight(4);
  point(xPos, yPos);
}

void myLine(float xPos, float yPos, float xPos2, float yPos2) {
  stroke(255);
  strokeWeight(1);
  line(xPos, yPos, xPos2, yPos2);
}
