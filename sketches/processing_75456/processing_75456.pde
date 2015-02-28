
//Lisa L, CP1 Mods 16/17, One Hundred Random Shapes

void setup()
{
  size(500,500);
  frameRate(6);
}
void draw()
{
  background(random(0,256),random(0,256),random(0,256));
  int num = 1;
  while(num < 101)
  {
    fill(random(0,256),random(0,256),random(0,256),random(0,256));
    ellipse(random(5,496),random(5,496),40,40);
    num++;
  }
}
