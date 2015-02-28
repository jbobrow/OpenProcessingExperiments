
//Brandan H. Computer prog. 1 block 7
float x= .1;
float y= .1;
float z= .1;
float a=.1;
float b=.1;
float c=.1;
void setup()
{
  size(750, 750, P3D);
}
void draw()
{
  translate(375, 375, 0);
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  background(255);
  fill(123, 213, 0);
  box(150);
  rotateZ(z);
  rotateY(y);
  rotateX(x);

  translate(125, 125, 125);
  rotateX(a);
  rotateY(b);
  rotateZ(c);
  fill(0);
  sphere(25);
  translate(-125, -125, -125);

  translate(-125, -125, -125);
  sphere(25);
  translate(125, 125, 125);

  translate(125, -125, -125);
  sphere(25);
  translate(-125, 125, 125);

  translate(-125, 125, 125);
  sphere(25);
  translate(125, -125, -125);

  translate(125, 125, -125);
  sphere(25);
  translate(-125, -125, 125);

  translate(-125, 125, -125);
  sphere(25);
  translate(125, -125, 125);

  translate(125, -125, 125);
  sphere(25);
  translate(-125, 125, -125);

  translate(-125, -125, 125);
  sphere(25);
  translate(125, 125, -125);

  x=x+.01;
  y=y+.01;
  a=y+.01;
  b=y+.01;
  z=z+.01;
}
