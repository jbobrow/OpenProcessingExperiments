
//Wayland L, Doubling Shapes, CP1 mods 16-17
int d = 1;
void setup()
{
  size(600,600,P3D);
}
void draw()
{
  background(211,0,0);
  int i = 1;
  frameRate(1);
  while(i<=d)
  {
    fill(255,255,255,30);
    int x = int(random(50,550));
    int y = int(random(50,550));
    int z = -int(random(100));
    translate(x,y,z);
    box(10);
    translate(-x,-y,-z);
    fill(39,255,8);
    textSize(72);
    text(d,50,70);
    i++;
  }
d= 2*d;
if (d > 50000)
{
  d = 1;
}
}
