
PImage Screenshot;

void setup()
{
  size(800,600);
  Screenshot = requestImage("Screenshot.jpg");
}

void draw()
{
  image(Screenshot,0,0, 800,600);
}


