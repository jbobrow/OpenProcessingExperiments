
color bg = color(100,0,0);
color fg = color(200,35,3);
int radius = 20;
float x, y, vx, vy ;
void setup()
{
  size(200, 200);
  x = width/2;
  y = height/2;
  float a = random(TWO_PI);
  vx = cos(a)*5;
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


