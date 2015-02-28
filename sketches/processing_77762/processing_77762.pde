
float N=3000;
float th=2.39997;
float c=4;
float d=4;
float r, a, x, y;
void setup()
{
  size(500, 500);
}
void draw()
{
  translate (width/2, height/2);
  for (int i=1 ; i<=N ; i++)
  {
    //float colour = map(i,0,3000, 10,200);
    int colour = (int(mouseX))%255;
    r=c * sqrt(i);
    a=i*th;
    x=r*cos(a);
    y=r*sin(a);
    fill(colour);
    ellipse(x, y, d, d);
  }
}



