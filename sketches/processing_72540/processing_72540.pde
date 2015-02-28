
//Tina L, CP1 14/15 Random Walk
PImage cold;
int x=10;
int y=10;
void setup()
{
  size(500,500);
  cold = loadImage("http://awkwardturtlez.webs.com/shiver.png");
}
void draw()
{
  background(255);
  fill(0);
  image(cold,50 + x,0 + y,380,484);
  x = x + int(random(-5,5));
  y = y + int(random(-2,2));
}
