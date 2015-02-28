
color bg = color(205,10,48);
color fg = color(206,67,255);
 
int radius = 10;
int balls=1000;
float x, y, vx, vy ;
void setup()
{
  size(200, 200);
  x = width/2;
  y = height/2;
  
 
  float a = random(TWO_PI);
  vx = cos(a)*8;
  vy = sin(a)*5;
}
 
void draw()
{
  background(bg);
  fill(fg);
  ellipse(x, y, radius, radius);
  move();
  collide();
}
 
void move()
{
  float dt = 1;
  x += vx*dt;
  y += vy*dt;
}
 
void collide()
{
  if ( x<0 || x>width ) vx = -vx;
  if ( y<0 || y>height ) vy = -vy;
}
