
color bg = color(130);
color fg = color(255);
int balls=3;
int radius = 10;
float x[]=new float[balls], y[]=new float[balls], vx[]=new float[balls], vy[]=new float[balls] ;
 
void setup()
{
  size(200, 200);
  for (int i=0;i<balls;i++)
  {
    x[i] = width/5;
    y[i] = height/5;
    float a = random(TWO_PI);
    vx[i] = cos(a)*3;
    vy[i] = sin(a)*3;
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
  float dt = 1;
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



