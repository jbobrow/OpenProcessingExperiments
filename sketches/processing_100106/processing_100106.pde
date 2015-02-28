
PImage ping, fish,bground;
int x, y, xfish, yfish;
void setup()
{
  size(400, 400);
  fish = loadImage("fish.png");
  ping = loadImage("ping.png");
  bground = loadImage("bground.jpg");
  x=200;
  y=200;
  xfish=int(random(20, 380));
  yfish=int(random(20, 380));
}

void draw()
{
  background(bground);
  imageMode(CENTER);
  image(fish, xfish, yfish);
  image(ping, x, y);
  if (x>380) x=380;
  if (x<0) x=0;
  if (y>380) y=380;
  if (y<20) y=20;
  if (keyPressed == true)
  {
    if (keyCode == LEFT)
    {
      x=x-7;
    }
    if (keyCode == RIGHT)
    {
      x=x+7;
    }
    if (keyCode == UP)
    {
      y=y-7;
    }
    if (keyCode == DOWN)
    {
      y=y+7;
    }
  }
}



