
// Nigel Zhang, CP1, Mods 14-15, Doubling Shapes
PImage drumstick;
PImage chicken;
int x = 1;
int y = 1;
void setup ()
{
  textSize(100);
  size (600, 600);
  drumstick = loadImage ("Fried Chicken2.png");
  chicken = loadImage ("chicken.jpg");
  image (chicken, 0, 0, 600, 600);
}
void draw ()
{
  frameRate(1);
  
  image (chicken, 0, 0, 600, 600);
  while (x<y)
  {
    image (drumstick, random(550), random(550), 50, 50);
    x++;
  }
  y=y*2;
  text(y/4,50,100);
  if(y/4==8192)
  {
    x=1;
    y=2;
  }
}
