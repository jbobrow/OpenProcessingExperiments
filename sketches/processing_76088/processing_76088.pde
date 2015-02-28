
// Lucky Wen, Doubling Shapes, CP1 mods 16-17

int po=2;
int pi=1;
void setup()
{
  size(300, 300);
  frameRate(1);
  
}

void draw()
{
  background(0);
  int x=int(random(0,256));
  int y=int(random(0,256));
  int z=int(random(0,256));
  stroke(x, y, z);
  strokeWeight(3);
  fill(y,z,x);
  
  while (po<=pi)
  {
  
    ellipse (int(random(40,261)), int(random(40,261)), 30, 30);
    po++;
  }
    {
    if (po>= pi)
      {
      pi=pi*2;
      }
    }
    if (pi==4096)
    {
      po=2;
      pi=1;
    }
}





