
void setup()
{
  size(1000,1000,P3D);
}

float x = 0.5;
float y = 0.5;


void draw()
{
  //cube
  background(0,60,0);
  stroke(255);
  strokeWeight(3);
  fill(78,x,100+x,150);
  translate(250,250,250);
  rotateX(150+x);
  rotateY(150+y);
  lights();  
  camera (mouseX,mouseY,mouseY,0,0,0,0,1,0);
  box(100);
  noStroke();
  fill(150,y,y);
  translate(300-x,250+y,250-y);
  rotateX(150+x);
  rotateY(150+y);
  strokeWeight(1);
  sphere(50);
  
  //spheres
  translate(250-x,250+y,250-y);
  fill(0,y,150);
  rotateX(150+x);
  rotateY(150+y);
  strokeWeight(1);
  sphere(50);
  x=x+.05;
  y=y+.01;
}
