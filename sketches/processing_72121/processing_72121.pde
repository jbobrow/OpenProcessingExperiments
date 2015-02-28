
int x = 35;
int y = 53;
int ky = 200;
int kx = 105;
PImage k;
PImage c;
PImage kitchen;

void setup()
{
  size(550, 366);
  frameRate(10);
  c = loadImage ("candyMachine.jpg");
  kitchen = loadImage("kitchen.jpg");
  k = loadImage ("kid.jpg");
}

void draw()
{
  background(kitchen);
  tint(255,255,255,235);
  image(c, x, y, 100, 120);
  int direction = int(random(-3, 2)); // moving the candy machine along counter
  if (direction == -2 && x< 40&& x>25)
  {
    x = x + 0;
  }
  else if ( direction == -1 && x>25 && x<40)
  {
    x = x -1;
  }
  else if (direction == 0 && y<65 && y>48)
  {
    y = y +1;
  }
  if (direction == 1 && y<65 && y>48)
  {
    y = y - 1;
  }
  image (k, kx,ky, 150,170);
  int kid = int(random(-2,3)); // kid moves up and down
  if (kid == -1 || kid == 1 && ky < 210 && ky > 208)
  {
    ky = ky +2;
  }
  else if(kid == 0 || kid == 2 && ky < 210 && ky > 208)
  {
    ky = ky -2;
  }
}


