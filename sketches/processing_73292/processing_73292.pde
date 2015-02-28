
//Sydney C, CP1 mods: 4/5, Rotating Cube
float x = 0;
float y = 0;
float x2 = 0;
float y2 = 0;
int r = 0;
int g = 255;
int b = 0;
void setup()
{
  size(300,300,P3D);
  background(12,32,70);
}

void draw()
{
  pointLight(255,255,255,82,57,32);
  
  cube();
  sphere1();
  sphere2();
}
void sphere1()
{
  translate(0,150);
  rotateX(x);
  rotateY(y);
  x = x + .1;
  y = y + 1;
  stroke(r,g,b);
  r = r + 1;
  b = b + 1;
  g = g - 1;
  if(r>255)
  {
    r = 0;
    g = 255;
  }
  fill(0,0,0,30);
  sphere(125);
}
void cube()
{
  translate(150,150,-100);
  noStroke();
  fill(255,192,232,130);
  rotateX(x2);
  x2 = x2 + .01;
  rotateY(y2);
  y2 = y2 + .01;
  box(25);
}

void sphere2()
{
  rotateY(y);
  rotateX(x);
  y = y - .1;
  x = x - .1;
  translate(-150,-150,100);
  noStroke();
  fill(129,139,132);
  box(95);
}
