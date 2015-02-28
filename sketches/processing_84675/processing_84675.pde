
// P03_BasicsOfShapes
// Barton Poulson uvu.edu/profpages/bart
// 15 January 2013

void setup() {
  size(800, 200);
}

void draw() {
  fill(255);
  point(20, 20);
  line(50, 20, 50, 180);
  ellipse(100, height/2, 50, 180);
  ellipse(200, height/2, 80, 80);
  rect(260, 20, 80, 80);
  rect(280, 120, 70, 70);
  
  noFill();
  beginShape();
    curveVertex(500, 20);
    curveVertex(500, 20);
    curveVertex(400, 180);
    curveVertex(600, 20);
    curveVertex(400, 100);
    curveVertex(700, 50);
    curveVertex(500, 180);
    curveVertex(750, 180);
    curveVertex(750, 180);
  endShape();
}
