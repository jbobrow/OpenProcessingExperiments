
class Ghost {
 float x;
 float y;
 float x2;
 float y2;
 float c1;
 float c2;
 float dx;
 float dy;
 color colBody;
 color colEyes;
 color colAlt;
 int h;
 int e;
 boolean hit = false;
 
 Ghost(color colBody_, color colEyes_, color colAlt_, int h_, int e_) {
  colBody = colBody_;
  colEyes = colEyes_;
  colAlt = colAlt_;
  h = h_;
  e = e_; 
 }
 
 void display(float x_, float y_, float x2_, float y2_, float c1_, float c2_, float dx_, float dy_) {
  x = x_;
  y = y_;
  x2 = x2_;
  y2 = y2_;
  c1 = c1_;
  c2 = c2_;
  dx = dx_;
  dy = dy_;
  
  // Offsets for x and y
  int off1 = 25;
  int off2 = 50;
  int off3 = 20;
  int off4 = 45;
  int off5 = 15;
  int off6 = 10;
  int off7 = 5;
  
  // Casper's head
  noStroke();
  if (hit) {
   fill (colAlt);
  } else {
   fill(colBody); 
  }
  ellipse(c1, c2-off1, h, h);
  
  // Casper's body
  beginShape();
  vertex(c1-off1, c2-off1);
  bezierVertex(c1-off1, c2-off1, c1+off1, c2-off1, c1+off1, c2-off1);
  bezierVertex(c1+off1, c2, c1+off1, c2+off1, dx+off1, dy+off2);
  vertex(dx+off3, dy+off4);
  vertex(dx+off5, dy+off2);
  vertex(dx+off6, dy+off4);
  vertex(dx+off7, dy+off2);
  vertex(dx, dy+off4);
  vertex(dx-off7, dy+off2);
  vertex(dx-off6, dy+off4);
  vertex(dx-off5, dy+off2);
  vertex(dx-off3, dy+off4);
  vertex(dx-off1, dy+off2);
  bezierVertex(c1-off1, c2+off1, c1-off1, c2, c1-off1, c2-off1);
  endShape();
  
  // Casper's face
  fill(colEyes);
  ellipse(c1-(off7+4), c2-off1, e, e+2);
  ellipse(c1+(off7+4), c2-off1, e, e+2);
  ellipse(c1, c2-(off7+3), e+2, e);
 }
 
 void hitTest(Ghost ghost) {
  float diam = (h > ghost.h ? h : ghost.h);
 
 if (dist(c1, c2, ghost.c1, ghost.c2) <= diam) {
    ghost.hit = true;
    hit = true;
  } else {
    ghost.hit = false;
    hit = false;
  } 
 }
 
 float c1() {
  return c1; 
 }
 
 float c2() {
  return c2; 
 }

}

