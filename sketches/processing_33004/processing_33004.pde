
void setup() {
  size(300, 300);
  background(60, 120, 220);
}

void draw() {
  noFill();
  stroke(150, 180, 50);
  beginShape();

  vertex(30, 260);

  bezierVertex(30, 260, 110, 240, 75, 180);
  bezierVertex(75, 180, 50, 80, 140, 120);
  bezierVertex(140, 120, 160, 140, 145, 100);
  bezierVertex(145, 100, 130, 10, 200, 60);
  bezierVertex(200, 60, 230, 80, 245, 100);
  bezierVertex(245, 100, 280, 120, 255, 150);
  bezierVertex(255, 150, 235, 175, 240, 200);
  bezierVertex(240, 200, 250, 250, 210, 220);


  endShape();
}


