
//Victoria H, Random Shapes 100, CP1 mods 16/17

void setup()
{
  size(600,200,P3D);
  noStroke();
  frameRate(1);
}
void draw()
{
  background(0);
  lights();
  int one = 1;
  while(one<=100)
  {
  int x = int(random(0,600));
  int y = int(random(0,200));
  int z = int(random(-200,10));
  int b = int(random(0,256));
  translate(x,y,z);
  fill(x,y,b,100);
  box(50);
  translate(-x,-y,-z);
  one++;
  }
}
