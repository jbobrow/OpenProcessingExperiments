
color bg = color(100);
color fg = color(200);
int balls=5;
int radius = 10;
float x[]=new float[balls], y[]=new float[balls], vx[]=new float[balls], vy[]=new float[balls] ;

void setup()
{
  size(200, 200);
  for (int i=0;i<balls;i++)
  {
    x[i] = width/2;
    y[i] = height/2;
    float a = random(TWO_PI);
    vx[i] = cos(a)*5;
    vy[i] = sin(a)*5;
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



