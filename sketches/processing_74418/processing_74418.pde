
PImage drumstick;
PImage chicken;
void setup ()
{
  size (600, 600);
  drumstick = loadImage ("http://i.imgur.com/6I6SF.png");
  chicken = loadImage ("http://www.choicematters.org/wp-content/uploads/2012/01/tumblr_ku48goxoYS1qatg16o1_4001.jpg");
  image (chicken, 0, 0, 600, 600);
}
void draw ()
{
  frameRate(5);
  int x = 1;
  image (chicken, 0, 0, 600, 600);
  while (x<=100)
  {
    image (drumstick, random(550), random(550), 50, 50);
    x++;
  }
  if (x>100)
  {
    x = 1;
  }
}
