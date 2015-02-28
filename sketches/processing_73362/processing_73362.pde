
float z = 0;
void setup()
{
  size(600,600,P3D);
  noStroke();
}
void draw()
{
  background(0);
  fill(245,67,10);
  pointLight(255,255,255,600,0,0);
  camera(1.5*mouseX,1.5*mouseY,10,0,0,0,0,1,0);
  sphere(100);
  rotateY(-z);
  translate(175,0,0);
  fill(212,212,212);
  sphere(25);
  rotateY(-z);
  translate(-175,0,0);
  translate(-175,0,0);
  rotateY(z);
  sphere(25);
  z = z + .02;
}
