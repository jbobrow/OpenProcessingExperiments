
void setup() {
  noStroke();
  size(280,245);
  for(int i=0; i<4; i++) {
    pushMatrix();
    shapeSet();
    translate(-60,35);
    shapeSet();
    popMatrix();
    translate(0,70);
  }
}

void segment1() {
  fill(0);
  beginShape();
  vertex(0,-20);
  vertex(10,0);
  vertex(20,0);
  vertex(0,35);
  vertex(-20,0);
  vertex(-10,0);
  vertex(0,-20);
  endShape();
}
void segment2() {
  fill(255);
  beginShape();
  vertex(0,20);
  vertex(10,0);
  vertex(20,0);
  vertex(0,35);
  vertex(-20,0);
  vertex(-10,0);
  vertex(0,20);
  endShape();
}
void pattern1() {
  pushMatrix();
  segment1();
  translate(30,17.5);
  rotate(4*PI/3);
  segment1();
  rotate(2*PI/3);
  translate(60,0);
  rotate(2*PI/3);
  segment1();
  rotate(4*PI/3);
  popMatrix();
}
void pattern2() {
  pushMatrix();
  translate(30,17.5);
  rotate(1*PI/3);
  segment2();
  rotate(5*PI/3);
  translate(30,17.5);
  rotate(PI);
  segment2();
  rotate(PI);
  translate(30,-17.5);
  rotate(5*PI/3);
  segment2();
  rotate(PI/3);
  popMatrix();
}
void shapeSet() {
  pushMatrix();
  pattern1();
  pattern2();
  translate(120,0);
  pattern1();
  pattern2();
  translate(120,0);
  pattern1();
  pattern2();
  popMatrix();
}

