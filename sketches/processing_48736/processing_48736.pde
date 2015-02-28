
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Written by Sasa Zivkovic 
// No.mad discourse | www.nomaddiscourse.com
// No.mad process | www.nomadprocess.com
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
int num = 500;
int spacing = 20;  
My_line[] lineObj = new My_line[num];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setup() {
  size(1000, 500);
  smooth();
  strokeWeight(0.2);
  background(0);
  frameRate(30);
  ellipseMode(CENTER);
  
  fill(0);
  float r = 10;
  ellipse(100, 250, r, r);
  ellipse(300, 250, r, r);
  ellipse(700, 250, r, r);
  ellipse(900, 250, r, r);
  
  for (int i = 0; i < num; i += spacing) {
    lineObj[i] = new My_line(0, i);
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
void draw() {
  //background(255);
  
  for (int i = 0; i < num; i += spacing) {
      lineObj[i].drawLine(0, i);
  }
    
  fill(0, 10);
  rect(0, 0, width, height);
  
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
class My_line {
  float f;
  float a;
  float m2;
  float x;
  float y;

  My_line(float tempX, float tempY) {
    x = tempX;
    y = tempY; 
  }
  
  void drawLine(float VAL1, float VAL2) {
    pushMatrix();
    translate(VAL1, VAL2-250);
    
    if (mouseY < 250) {
    a += -3;
  } else {
  a += 4;
  }
  //noFill();
  ///-----------------------------------------------
 
  float x = 255;
  float y = 245;
  
  ///-----------------------------------------------
  stroke(100, 100);
  fill(255, 100);
  noStroke();
  ///-----------------------------------------------
  beginShape();
  curveVertex(0, x);
  curveVertex(0, x);
  //curveVertex(50, 50);
  curveVertex(100, x);
  
  if (mouseY <= 250) {
    m2 = map(mouseY, 0, 250, -1.5, 0.005);
  } else {
    m2 = map(mouseY, 250, 500, 0.001, 1);
  }
  
  float vv = dist(mouseX, mouseY, 500, VAL2);
  float vv1 = map(vv, 0, 700, 0.002, 10);
  
  pushMatrix();
  PVector location1 = new PVector(mouseX+a, mouseY+a);
  PVector startpoint1 = new PVector(200, x);
  location1.sub(startpoint1);
  location1.mult(0.7*vv1);
  translate(100, x);
  //line(0, 0, location1.x, location1.y);
  translate(0, 0);
  curveVertex(location1.x*m2+200, location1.y+x);
  popMatrix();
  
  curveVertex(300, x);
  
  pushMatrix();
  PVector location2 = new PVector(mouseX+a, mouseY+a);
  PVector startpoint2 = new PVector(500, x);
  location2.sub(startpoint2);
  //location2.normalize();
  location2.mult(0.7*vv1);
  translate(500, x);
  //line(0, 0, location2.x, location2.y);
  translate(0, 0);
  curveVertex(location2.x*m2+500, location2.y+x);
  popMatrix();

  curveVertex(700, x);
  
  pushMatrix();
  PVector location3 = new PVector(mouseX+a, mouseY+a);
  PVector startpoint3 = new PVector(800, x);
  location3.sub(startpoint3);
  location3.mult(0.7*vv1);
  translate(800, x);
  //line(0, 0, location3.x, location3.y);
  translate(0, 0);
  curveVertex(location3.x*m2+800, location3.y+x);
  popMatrix();
  
  curveVertex(900, x);
  //curveVertex(950, 50);
  curveVertex(width, x);
  curveVertex(width, x);
  //endShape();
  ///-----------------------------------------------
  
  float m1 = map(mouseY, 0, 500, 8, 0);
  
  ///-----------------------------------------------
  //beginShape();
  
  curveVertex(width, y);
  curveVertex(width, y);
  //curveVertex(950, 40);
  curveVertex(900, y);

  pushMatrix();
  PVector location6 = new PVector(mouseX+a, mouseY+a);
  PVector startpoint6 = new PVector(800, y);
  location6.sub(startpoint6);
  location6.mult(0.7*vv1);
  translate(800, y);
  //line(0, 0, location3.x, location3.y);
  translate(0, 0);
  if (mouseY < 250) {
    curveVertex(location6.x*m2+800, location6.y+y +m1);
  } else {
    curveVertex(location6.x*m2+800, location6.y+y -m1);
  }
  popMatrix();
  
  curveVertex(700+m1, y);

  pushMatrix();
  PVector location5 = new PVector(mouseX+a, mouseY+a);
  PVector startpoint5 = new PVector(500, y);
  location5.sub(startpoint5);
  //location2.normalize();
  location5.mult(0.7*vv1);
  translate(500, y);
  //line(0, 0, location2.x, location2.y);
  translate(0, 0);
  if (mouseY < 250) {
    curveVertex(location5.x*m2+500, location5.y+y +m1);
  } else {
  curveVertex(location5.x*m2+500, location5.y+y -m1);
  }
  popMatrix();

  curveVertex(300-m1, y);

  pushMatrix();
  PVector location4 = new PVector(mouseX+a, mouseY+a);
  PVector startpoint4 = new PVector(200, y);
  location4.sub(startpoint4);
  location4.mult(0.7*vv1);
  translate(200, y);
  //line(0, 0, location1.x, location1.y);
  translate(0, 0);
  if (mouseY < 250) {
    curveVertex(location4.x*m2+200, location4.y+y +m1);
  } else {
    curveVertex(location4.x*m2+200, location4.y+y -m1);
  }
  popMatrix();

  float m3 = map(mouseY, 0, 500, 0.001, 1);

  curveVertex(100, y);
  //curveVertex(50, 40);
  curveVertex(0, y);
  curveVertex(0, y);
  endShape();
  
  popMatrix();
 }
}

