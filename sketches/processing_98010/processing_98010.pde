
color bg = color(0);
color fg = color(255);
int balls = 10;
int radius = 20;
float x[]=new float[balls], y[]=new float[balls], vx[]=new float[balls], vy[]=new float[balls] ;
 
void setup()
{
  size(500, 500);
  for (int i=0;i<balls;i++)
  {
    x[i] = width/3;
    y[i] = height/3;
    float a = random(TWO_PI);
    vx[i] = cos(a)*30;
    vy[i] = sin(a)*30;
  }
}
 
void draw()
{
  background(bg);
  fill(fg);
  for (int i=0;i<balls;i++)   ellipse(x[i], y[i], radius, radius);
  move();
  collide();
}
 
void move()
{
  float dt = 0.3;
  for (int i=0;i<balls;i++)
  {
    x[i] += vx[i]*dt;
    y[i] += vy[i]*dt;
  }
}
 
void collide()
{
  for (int i=0;i<balls;i++)
  {
  if ( x[i]<0 || x[i]>width ) vx[i] = -vx[i];
  if ( y[i]<0 || y[i]>height ) vy[i] = -vy[i];
}
}



