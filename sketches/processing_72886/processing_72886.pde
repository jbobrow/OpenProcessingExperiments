
//Simon L, Ticklish Penguin, CP1 Mods 14-15

/*@pjs globalKeyEvents="true"; */
PImage meme;
PImage gary;
PImage waterfall;
int x = 100;
int y = 100;
void setup()
{
  size(500, 500);
  meme = loadImage("http://voidspot.webs.com/garyMeme.jpg");
  gary = loadImage("http://voidspot.webs.com/Gary.GIF");
  waterfall = loadImage("http://voidspot.webs.com/Waterfall.jpg");
}
void draw()
{
  if (mousePressed == true)
  {
    image(waterfall,0, 0, 500, 500);
    image(gary,x, y, 191, 339);
    x = x + int(random(-2, 2));
    y = y + int(random(-2, 2));
    if (x > 309)
    {
      x = x - 1;
    }
    if (x < 0)
    {
      x = x + 1;
    }
    if (y > 161)
    {
      y = y - 1;
    }
    if (y < 0)
    {
      y = y + 1;
    }
  }
  else if (mousePressed == false)
  {
    image(meme,0, 0, 500, 500);
  }
}
