
float y=0;
float x=0;

void setup(){
  size(300,300,P3D);
  smooth();
}

void draw(){
  
  background(255);
  translate(150,150,0);
  
  pushMatrix();
  rotateY(y+=0.03);
  rotateX(x+=0.03);
  fill(0);
  stroke(random(0,255),random(0,255),random(0,255));
  strokeWeight(5);
  box(50);
  strokeWeight(3);
  stroke(random(0,255),random(0,255),random(0,255));
  sphere(250);
  sphere(6);
  rect(20,20,50,50);
  rect(-40,-40
