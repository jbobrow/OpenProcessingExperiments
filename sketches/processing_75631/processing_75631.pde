
//William T., Doubling Shapes, CP1 mods 14-15
PImage banana;
PImage soraka;
PImage halfbanana;
int x = 1;
int y = 1;

void setup()
{
  size(600, 600);
  frameRate(0.75);
  banana = loadImage("http://azsanggetsu.webs.com/banana.png");
  soraka = loadImage("http://riot-web-static.s3.amazonaws.com/images/news/September_2012/2012_09_19_Soraka_Reveal/Soraka_splash_thumb.jpg");
  textSize(100);
}
void draw()
{
  image(soraka,0,0,600,600);
  while (x < y)
  {
    image(banana, random(0, 551), random(0, 551), 50, 50);
    x++;
  }
  if ( x >= y)
  {
    y = y * 2;
  }
  if( x > 9000)
  {
    x = 1;
    y = 1;
  }
  fill(255,0,0);
  text(x/2,100,100);
}
