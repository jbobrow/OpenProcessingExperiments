
/*
do some crazy stuff!!
*/
float y =0;
float x =0;
float y2 =0;
float x2 =0;

void setup(){
size(300,300,P3D);
}

void draw(){
  background(255);
  translate(150,150,0);
  rotateY(y+=0.03);
  pushMatrix();
  strokeWeight(1);
  fill(255,0,0);
  rotateY(y+=0.03);
  rotateX(x+=.004);
  sphere(300);
  popMatrix();
  
 
  noFill();
  strokeWeight(5);
  rotate(y2-=0.03);
  rotateX(x2-=0.004);
  box(50);
  
 
}
