
// Samantha G. CP1 Random Walk Mods 14-15
int x = 0;
int y = 0;
PImage boy;
PImage poked;
PImage eeyore;
void setup ()
{
//  background(183,222,232);
  size(400, 400);
  frameRate(30);
  poked = loadImage("http://sammiespagexd.bravesites.com/files/images/poker.png");
  eeyore = loadImage("http://sammiespagexd.bravesites.com/files/images/notail.png");
  boy = loadImage("http://sammiespagexd.bravesites.com/files/images/boypin.png");
  fill(255);
  rect(0,0,400,400);
  image(eeyore,-30,10,380,400);
}
void draw ()
{
  image(eeyore, -5, 0, 380, 400);
  image(boy,x,y,80,280);
  x = x + int (random(-7,11));
  y = y + int (random(-7,10));
  if (x >350)
  {
    image(poked, -5, 0, 380, 400);
  }
}
