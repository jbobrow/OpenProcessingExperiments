
void setup() {
  size(1000,1000,P3D);
}

void draw() {
  background(0);  
  stroke(255);
  strokeWeight(3);
  lights();
  box1();
  box2();
}

void box1(){
  float angle = atan2(mouseY - 100, mouseX - 100);
  pushMatrix();
  translate (250, height/2, 0);
  noFill();
  stroke(255);
  rotateY(1);
  rotate(angle);
  box(250);
  popMatrix();
  
  pushMatrix();
  translate (250, height/2, 0);
  rotateY(1);
  rotate(angle*2);
  fill(0);
  box(50);
  popMatrix();
  
  
}

void box2(){
  float angle = atan2(mouseY - 100, mouseX - 100);
  pushMatrix();
  translate (750, height/2, 0);
  noFill();
  stroke(255);
  rotateY(-1);
  rotate(-angle);
  box(250);
  popMatrix();
  
  pushMatrix();
  translate (750, height/2, 0);
  
  rotateY(-1);
  rotate(-angle*2);
  fill(0);
  box(50);
  popMatrix();
 
}

