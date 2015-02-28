
  Dikdortgen d1=new Dikdortgen(40,40,255,25);
  Dikdortgen d2=new Dikdortgen(75,100,75,75);
  
void setup()
{
  size(300, 300);
  background(255);
}

void draw()
{
  d1.ddd();
  d2.ddd();
}
  
class Dikdortgen {
int x,y,z;
int rectangleSize;

Dikdortgen(int x1,int y1,int z1, int r)
{
  x=x1;
  y=y1;
  z=z1;
  rectangleSize=r;
}

void ddd()
{
  fill(0,0,z);
  rect(x,y, rectangleSize, rectangleSize);
}

}

