
/*
Crazy Stuff!!
*/

float y =0;
float x =0;

void setup(){
  size(300,300,P3D);
  smooth();
}

void draw(){
  background(255);
  translate(150,150,0);
  rotateY(y+=0.07);
  pushMatrix();
  strokeWeight(1);
  fill(255,0,0);
  rotateX(x+=0.004);
  sphere(300);
  noFill();
  strokeWeight(5);
  popMatrix();
  fill(123);
  box(50);
}
