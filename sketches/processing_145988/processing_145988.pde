
void setup() {
  size(400, 400, P2D);
  rectMode(CENTER);
  noLoop();
  noFill();
  stroke(136, 159, 173);
  background(255,255,255);
  
}

void draw() {
  ellipse(200,200,330,330);
  line(70, 200, 330, 200);
  translate(240,200);
  beginShape();
  vertex(0, -30);
  vertex(-30, 0);
  vertex(0, 30);
  vertex(30, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0, -15);
  vertex(-15, 0);
  vertex(0, 15);
  vertex(15, 0);
  endShape(CLOSE);
  translate(30,0);
  beginShape();
  vertex(0, -15);
  vertex(-15, 0);
  vertex(0, 15);
  vertex(15, 0);
  endShape(CLOSE);
  translate(-150,0);
  beginShape();
  vertex(0, -8);
  vertex(-8, 0);
  vertex(0, 8);
  vertex(8, 0);
  endShape(CLOSE);
}



