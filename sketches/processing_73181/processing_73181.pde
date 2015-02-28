
/* @pjs globalKeyEvents= "true"; */

float x= .5;
float z= 10;

void setup()
{
  size(500,500,P3D);
}

void draw()
{
  background(255-mouseX,255-mouseY,255);
  myBox();
}

void myBox()
{
  translate(250,250,0);
  pointLight(257,227,0,0,0,250);
  rotateX(x);
  x=x-.1;
  sphere(z);
  z=z+2;
  if(z>200)
  {
    z=-z;
  }
}
