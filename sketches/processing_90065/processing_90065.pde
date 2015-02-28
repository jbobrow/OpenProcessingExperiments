
float rx;
float ry;
float h;
float w;
float r;
float g;
float b;
float ex;
float ey;

void setup()
{
  size (400,400);
  frameRate(40);
  w = width;
  h = height;
}

void draw ()
{
  rx = random (1,400);
  ry = random (1,400);
  ex = random (150,200);
  ey = random (100,200);
  
  r = random (255);
  b = random (255);
  g = random (255);
  fill(r,b,g);
  rect(rx,ry,50,50);
  ellipse (ex,ey,w/5,h/3);
}
