
/*
Do some crazy shaaaaat
*/
float y=0;
float x=0;

void setup(){
  size(500,500,P3D);
  smooth();
}
void draw(){
  background(255);
  translate(150,150,0);
  rotateY(y+=0.08);
  
  pushMatrix();
  strokeWeight(1);
  fill(random(0,255),random(0,255),random(0,255));
  rotateX(x+=0.14);
  sphere(650);
  strokeWeight(5);
  noFill();
  stroke(random(0,255),random(0,255),random(0,255));
  strokeWeight(10);
  box(150);
  popMatrix();
  frameRate(10);
}
