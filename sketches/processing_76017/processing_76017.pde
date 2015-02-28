
//Perry Phan, 4/5, Comp Prog 1, Doubling Shapes
int w;

void setup()
{
  size(400,400);
  frameRate(5);
  w=1;

}

void draw()
{
  background (random(255),random(255),random(255));
  int x = 1;
  while(x<=w)
  {
    fill(random(255),random(255),random(255),random(255));
    ellipse(random(400),random(400),50,50);
    x=x+1;
  }  
  
  w=w*2;
  if (w>1000)
  {
    w=1;
  }
}
