
int alienx;
int alieny;
int alienxv;
int alienyv;

int shipx;
int shipy;

void setup()
{
  size(400,240);
  frameRate(30);
  alienx=50;
  alieny=50;
  alienxv=5;
  alienyv=1;  
  
  shipx=width/2;
  shipy=height-20;
  
  fill(255);
  stroke(0);
}

void draw()
{
  background(0);
  
  fill(0,255,0);
  rect(alienx,alieny,10,10);
  fill(255);
  rect(shipx,shipy,10,10);
  move_alien();
  move_ship();
}

void move_ship()
{
  if (mouseX>shipx) shipx+=5;
  if (mouseX<shipx) shipx-=5;
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


