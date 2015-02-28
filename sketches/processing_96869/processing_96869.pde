
color bg = color(255);
color ballFill= color(100, 200, 200);
int sizeX = 300;
int sizeY = 300;

float speed = 0.9;

int radius = 20;
float x, y, vx, vy ;

void setup()
{
  size(sizeX, sizeY);
  x = width/2;
  y = height/2;
  fill(ballFill);
 
  float a = random(TWO_PI);
  vx = cos(a)*5;
  vy = sin(a)*5;
}
 
void draw()
{
  background(bg);
  ellipse(x, y, radius, radius);
  move();
  collide();
}

void mousePressed()
{
  int r, g, b;
  r = (int)random(0, 255);
  g = (int)random(0, 255);
  b = (int)random(0, 255);
  ballFill = color(r, g, b);
  fill(ballFill);
}
void move()
{
  x += vx*speed;
  y += vy*speed;
}
 
void collide()
{
  if ( x<0 || x>width)
  {
    vx = -vx;
  }
  if (y<0 || y>height)
  {
    vy = -vy;
  }
    
}



