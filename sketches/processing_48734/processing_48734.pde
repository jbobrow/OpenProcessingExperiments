
/////////////////////////////////////////////////////////////////////////////////////////////
// Written by Sasa Zivkovic 
// No.mad discourse | www.nomaddiscourse.com
// No.mad process | www.nomadprocess.com
/////////////////////////////////////////////////////////////////////////////////////////////
float g = 50;
float g1 = 50;
float f;
float mm;

/////////////////////////////////////////////////////////////////////////////////////////////
void setup() {
  size(1000, 500);
  smooth();
  strokeWeight(0.2);
  frameRate(10);
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
}

/////////////////////////////////////////////////////////////////////////////////////////////
void draw() {
  
  ///// draw vector grid
  for (int i = 10; i <= width+300; i *=1.2) {
    for (int j = -300; j <= height+300; j +=g) {
      drawVector(i, j);
   }
 }
 
  rectMode(CORNER);
  ///// mouse indicator bar bottom 
  fill(0);
  rect(0, 500-10, width, height);
  rect(1000-10, 0, width, height);
  //rect(0, 0, width, 10);
  //rect(0, 0, 10, height);
  fill(255);
  ellipse(mouseX, 500-5, 4, 4);
  //ellipse(mouseX, 5, 4, 4);
  ellipse(1000-5, mouseY, 4, 4);
  //ellipse(5, mouseY, 4, 4);
  rectMode(CENTER);
  
  ///// no loop
  if (frameCount == 2000) {
    noLoop();
  }
 
  ///// rounded rectangles 
  fill(255);
  noStroke();
  beginShape();
  int v = 10;
  vertex(width-v, 0);
  bezierVertex(width-v/2, 0, width, 0+v/2, width, v);
  vertex(width, 0);
  endShape();
  beginShape();
  vertex(v, 0);
  bezierVertex(v/2, 0, 0 , v/2, 0, v);
  vertex(0, 0);
  endShape();
  beginShape();
  vertex(v, height);
  bezierVertex(v/2, height, 0 , height- v/2, 0, height - v);
  vertex(0, height);
  endShape();
  beginShape();
  vertex(width-v, height);
  bezierVertex(width-v/2, height, width, height-v/2, width, height-v);
  vertex(width, height);
  endShape();
  noFill();
}

/////////////////////////////////////////////////////////////////////////////////////////////
void drawVector(int x, int y) { 
  pushMatrix();
  f += 1;
  stroke(0, 50);
  float m1 = dist(x, y, mouseX, mouseY);
  float m2 = map(m1, 0, 500, 5, 200);
  
  PVector location = new PVector(mouseX, mouseY);
  PVector startpoint = new PVector(x, y);
  location.sub(startpoint);
  location.normalize();
  location.mult(m2);
  
  mm = map(mouseY, 0, 500, 100, 1000);
  translate(x, y);
  rotate(m2/10+f);
  noFill();
  rect(0, 0, -m2/10+(f/1000), -m2/5+(f/200));
  popMatrix();
}

