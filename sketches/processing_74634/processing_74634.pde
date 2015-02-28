
//Derek King, One Hundred Random Shapes, CP1 mods 14-15
//http://dereklucca.webs.com/One Hundred Random Shapes.html

void setup()
{
  size(500,500);
  frameRate(2000);
}
void draw()
{
  background(0);
  int i = 1;
  while(i<=101)
  {
   fill(random(256),random(256),random(256));
   ellipse(int(random(500)),int(random(500)),120,120);
    i++;
  }
}
