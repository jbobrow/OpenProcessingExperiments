
/*

*/
float y=0;
float x=0;
float y2=0;
float x2=0;

void setup(){
  size(300,300,P3D);
  smooth();
}

void draw(){
  stroke(0,0,255);
  background(255);
  translate(150,150,0);
  rotateY(y +=0.03);
  pushMatrix();
  rotateX(x +=0.004);
  noFill();
  strokeWeight(5);
  sphere(300);
  popMatrix();
  box(50);
  strokeWeight(1);
  //fill(255,0,0);
//box
   noFill();
   rotateX(x2 -=0.004);
   rotateY(y2 -=0.03);
   strokeWeight(5);
   box(50);
  
}
