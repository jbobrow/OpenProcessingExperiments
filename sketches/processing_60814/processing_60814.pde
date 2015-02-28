
int shipx;
int shipy;

int bulletx;
int bullety;

alien_class alien;

class alien_class
{
  int alienx;
  int alieny;
  int alienxv;
  int alienyv;

  alien_class()
  {
    alienx=50;
    alieny=50;
    alienxv=5;
    alienyv=1;
  }

  void alien_update()
  {
    move_alien();
    fill(0, 255, 0);
    rect(alienx, alieny, 10, 10);
  }

  void move_alien()
  {
    alienx+=alienxv;
    if (alienx>width) alienxv=-alienxv;
    if (alienx<0) alienxv=-alienxv;

    alieny+=alienyv;
    if (alieny>height) alienyv=-alienyv;
    if (alieny<0) alienyv=-alienyv;
  }
}


void setup()
{
  size(400, 240);
  frameRate(30);

  alien = new alien_class();

  bulletx=-1; // if the bullets x coordinate is -1 we consider it not firing.
  shipx=width/2;
  shipy=height-20;

  fill(255);
  stroke(0);
}

void draw()
{
  background(0);

  fill(0, 255, 0);
  fill(255);
  rect(shipx, shipy, 10, 10);

  if (bulletx>0)
  {
    fill(255, 0, 0);
    rect(bulletx, bullety, 4, 4);
    bullety-=5;
    if (bullety<0) bulletx=-1;
  }

  alien.alien_update();
  move_ship();
}

void move_ship()
{
  if (mouseX>shipx) shipx+=5;
  if (mouseX<shipx) shipx-=5;
}


void mousePressed() {
  if (bulletx>=0) return; // do not fire if a bullet is already fired
  bulletx=shipx;
  bullety=shipy-5;
}


