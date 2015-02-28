
// Nigel Z, Ticklish Penguin, CP1 mods 14-15
PImage wiggle;
int x = 125;
int y = 50;

void setup () 
{
  size (600,600);
  wiggle = loadImage ("http://t3.gstatic.com/images?q=tbn:ANd9GcQXfrCJ5PdovsRqPfTjdQA2BFuuMVfbk770RB1IwMaoPi0p6PPHcb8u5cCK");
}
void draw () 
{
  x = x + int(random(-4,4));
  y = y + int(random(-4,4));
  background (255);
  image(wiggle, x, y ,350,350);
  fill (random(255),random (255),random (255));
  text ("WIGGLE\nWIGGLE\nWIGGLE\nWIGGLE\nWIGGLE\nYEAH!",x+150,y+375);
  textSize (17);
  if (x<0)
  {
    x = x + int(random(0,4));
  }
  if (y<0)
  {
    y = y + int(random(0,4));
  }
  if (x>250)
  {
    x = x + int (random(-4,0));
  }
  if (y>100)
  {
    y = y + int (random(-4,0));
  }
  if (x>75)
  {
    x = x + int(random(-4,4));
  }
  if (y>75)
  {
    y = y+ int(random(-4,4));
  }
  if (x<175)
  {
    x = x + int(random(-4,4));
  }
}
