
void setup() {
  size(500, 500);
  noStroke();
  noLoop();
}

void draw() {
  scale(62.5);
  //green square
  fill(0, 255, 0);
  beginShape();
  vertex(0, 0);
  vertex(0, 8);
  vertex(8, 8);
  vertex(8, 0);
  endShape();
  //black shapes
  fill(0, 0, 0);
  //head
  beginShape();
  vertex(3, 4);
  vertex(3, 5);
  vertex(2, 5);
  vertex(2, 8);
  vertex(3, 8);
  vertex(3, 7);
  vertex(5, 7);
  vertex(5, 8);
  vertex(6, 8);
  vertex(6, 5);
  vertex(5, 5);
  vertex(5, 4);
  endShape();
  //left eye
  beginShape();
  vertex(1, 2);
  vertex(1, 4);
  vertex(3, 4);
  vertex(3, 2);
  endShape();
  //right eye
  beginShape();
  vertex(5, 2);
  vertex(5, 4);
  vertex(7, 4);
  vertex(7, 2);
  endShape();
}


