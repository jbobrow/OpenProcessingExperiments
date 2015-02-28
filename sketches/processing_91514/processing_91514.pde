
/*
 Do some crazy stuff!!

 */
 
 float x = 0;
 float y = 0;
 
 void setup() {
 size(300,300, P3D);
 smooth();
 
 }
 
void draw() {
   background(255);
   translate(150,150,0);
//Sphere 
   pushMatrix();
  strokeWeight(1);
  fill(60,0,250);
  rotateY (y += 0.03);
  rotateX (x+0.04);
  sphere(300);
  popMatrix();
  
 //Box
  fill(0,255,0);
  strokeWeight(5);
   rotateY (y += 0.03);
  rotateX (x+0.04);
  box(50);
 }
