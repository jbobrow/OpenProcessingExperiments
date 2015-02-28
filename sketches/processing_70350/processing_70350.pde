
//Derek K, Animation, CP1 mods 14-15
//http://dereklucca.webs.com/Animation.html

int x = 0;
int change = 1;
void setup()
{
  size(400, 300);
}
void draw()
{
  background(0);
  rect(3, 120, 10, 75);
  rect(390, 120, 10, 75);
  frameRate(150);
  ellipse(x, 150, 20, 20);
  x = x + change;
  if (x > 385)
    change = -1;

  if (x<20)
  {
    change = 1;
  }
}
