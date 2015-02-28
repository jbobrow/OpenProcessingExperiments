
int x=250;
int y=250;
int z=0;

void setup()
{
  size(500,500,P3D);
  background(0);
  frameRate(20);
}
void draw()
{
  int randX=int(random(-10,10));
  int randY=int(random(-10,10));
  int randZ=int(random(-10,10));
  int r=int(random(255));
  int g=int(random(255));
  int b=int(random(255));
  translate(x,y,z);
  noStroke();
  fill(r,g,b);
  pointLight(255,255,255,200,100,200);
  sphere(20);
  if (mousePressed==true)
  {
    x=x+randX;
    y=y+randY;
    z=z+randZ;
  }
}
  

