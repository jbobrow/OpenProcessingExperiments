
int x=250;
float y=0;
float z=0;
PImage b;
PImage c;
void setup()

{
  size(500, 500);
  background(0);

  b = loadImage ("jerry.jpg");
  c = loadImage ("Jerryl.gif");
}

void draw()
{
background(0);
  image(c, y, z, 400,400);
  if (mousePressed==true)
  {
y=y+random(-10,10);
z=z+random(-10,10);
  }
  else
  {
    image(b, 0, 0, 500, 500);
    x=x+int(random(-5, 5));
  }
}


