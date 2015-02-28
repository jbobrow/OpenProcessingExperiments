
float N=3000;
float th=2.39997;
float c=4;
float d=4;
float r, a, x, y;
void setup ()
{
  size(500,500);
}
void draw()
{
  float g;
  background(211);
th=map(mouseY, 0,height, 0, HALF_PI);
g=map(mouseX, 0,width,0,255);
fill(g);
translate (width/2, height/2);
  for (int i=1 ; i<=N ; i++)
  {
  r=c * sqrt(i);
  a = i*th;
  x = r * cos(a);
  y = r * sin(a);
  ellipse(x, y, d, d);
  }
}


