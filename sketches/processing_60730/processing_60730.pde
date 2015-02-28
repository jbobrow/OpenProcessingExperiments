
int alienx;
int alieny;
int alienxv;
int alienyv;

void setup()
{
  size(400,240);
  frameRate(30);
  alienx=50;
  alieny=50;
  alienxv=5;
  alienyv=1;  
  fill(255);
  stroke(0);
}

void draw()
{
  background(0);
  rect(alienx,alieny,10,10);
  move();
}

void move()
{
  alienx+=alienxv;
  if (alienx>width) alienxv=-alienxv;
  if (alienx<0) alienxv=-alienxv;
  
  alieny+=alienyv;
  if (alieny>height) alienyv=-alienyv;
  if (alieny<0) alienyv=-alienyv;
}


