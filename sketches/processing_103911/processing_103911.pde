
//int[ ] x, y, edge, dX, dY;
//color[ ] col;

//for function states for all values...

//void moveRects()

//float x=x+dx;
//float dx=dx+ddx;
float x, y, dx, dy, ddx, ddy;

void setup()
{
  size(800,600);
  background(29, 174, 240);
  x= 200;
  dx= 0;
  y=0;
  ddy=-0.0*y;
  dy=0;
  ddx= -0.001*x;
}

void draw()
{
  translate(width/2, height/2);
  background(29, 174, 240);
  fill(120, 26, 30);
  rect(x, y, 20, 40);
  ellipse(200*cos(sqrt(0.001)*frameCount),
    200*sin(sqrt(0.001)*frameCount),30,30);
  ddy = -0.0*y;
  dy=dy+ddy;
  y = y + dy;
  ddx= -0.001*x;
  dx= dx+ddx;
  x= x+dx;
}


