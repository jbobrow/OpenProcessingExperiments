
void setup()
{
  size(800,600);
  smooth();
}

void draw()
{
  background(0);
  frameRate(4);
  for(int i=0;i<2;i++)
    trucFucker(i*399);
}
void trucFucker(int a)
{
  for(int i=0;i<25;i++)
    for(int j=0;j<25;j++)
    {
      fill(j*10.2);
      strokeWeight(i/3.14);
      rect(a+i*3+50,j*19+30,random(20,75),random(20,75));
    }
}

