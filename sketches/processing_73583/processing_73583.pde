
//Tina L., CP1 14/15 Rotating Cube
float x = 0;
float y = 0;
void setup()
{
  size(500,500,P3D);
  smooth();
}
void draw()
{
  background(0);
  translate(250,250,0);
  pointLight(0,255,255,0,0,235);
  rotateX(x);
  rotateY(y);
  box(100);
  translate(-250,-250,0);
  translate(50,50,0);
  sphere(40);
  translate(-50,-50,0);
  translate(450,450,0);
  sphere(30);
  x = x + .5;
  y = y - .5;
  frameRate(5);
}
