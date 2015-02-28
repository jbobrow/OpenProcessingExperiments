
//curves and curves with indefinite points

void setup() {
  size(800, 500);
  smooth();
  noFill();
}

void draw() {
  background(204);
  float t = map(mouseX, 0, width, -5, 5);
  //Black curve
  stroke(0);
  curveTightness(t);
  beginShape();
  curveVertex(75, 125);
  curveVertex(75, 125);
  curveVertex(605, 125);
  curveVertex(605, 375);
  curveVertex(335, 375);
  curveVertex(335, 225);
  curveVertex(75, 205);
  curveVertex(75, 205);
  endShape();

  //blue curve
  stroke(0, 0, 250);
  curveTightness(t+1);
  beginShape();
  curveVertex(75, 125);
  curveVertex(75, 125);
  curveVertex(605, 125);
  curveVertex(605, 375);
  curveVertex(335, 375);
  curveVertex(335, 225);
  curveVertex(75, 225);
  curveVertex(75, 225);
  endShape();

  //white curve
  stroke(255);
  curveTightness(t+2);
  beginShape();
  curveVertex(75, 125);
  curveVertex(75, 125);
  curveVertex(605, 125);
  curveVertex(605, 375);
  curveVertex(335, 375);
  curveVertex(335, 225);
  curveVertex(75, 225);
  curveVertex(75, 225);
  endShape();

  //site
  beginShape();
  vertex(50, 100);
  vertex(630, 100);
  vertex(630, 400);
  vertex(310, 400);
  vertex(310, 250);
  vertex(50, 250);
  endShape(CLOSE);

  // Red dots
  strokeWeight(5);
  stroke(200, 0, 0);
  point(75, 125);
  point(605, 125);
  point(605, 375);
  point(335, 375);
  point(335, 225);
  point(75, 225);
  
  if (mouseX>630 || mouseX < 50){
    background(0);
  }
  
  int i = 0;
  while (i <= 605 ) {
  point(i +25, 125);
  point(i*12, 125);
  point(i*12, 375);
  point(i*7, 375);
  point(i*7, 225);
  point(i+25, 225);
  i = i + 50;
  }
}




