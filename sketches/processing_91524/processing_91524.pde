
/*
Do some crzy stuff 
*/
float y = 0;
float x = 0;
void setup(){
 size(100,100,P3D);
 smooth();
}
void draw(){
  stroke(10);
  background(random(0,255), random(0,255), random(0,255));
  translate(150,150,0);
  rotateY(y+=0.010);
  rotateX(x+=0.01);
  noFill();
  stroke(random(0,255), random(0,255), random(0,255));
  fill(random(0,255), random(0,255), random(0,255));
  box(50);
  stroke(random(0,255), random(0,255), random(0,255));
  fill(random(0,255), random(0,255), random(0,255));
  sphere(500);
  translate(mouseX,mouseY);
 }
