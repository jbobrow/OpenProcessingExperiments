
void setup() {
  size (400, 400);
  background (150);
  smooth();
}

//beginShape();
//bezierVertex(controlpoint, vertex, endpoint)
//vertex(endpoint) 
//endShape();

void draw() {
  background(150);
  noFill();
  beginShape();
  vertex(30, 250);
  bezierVertex(50,250,50,200, 80,175);
  bezierVertex(80,175, 30, 60, 150,115);
  bezierVertex(180,110, 170,125, 150,85);
  bezierVertex(150,90, 135,70, 195,85);
  bezierVertex(190,80, 205,85, 265,125);
  bezierVertex(260,125, 305,140, 290,185);
  bezierVertex(290,180, 285,205, 285,235);
  bezierVertex(285,230, 282,240, 260,235);
  endShape();

}

