
int pos = 10;
int movex = 0;

void setup()
{
  size(600,400);
  background(255);
  frameRate(2);
}

void draw()
{
  if ((pos += 50) > width)
  {pos = newpos();
  drawline();}
  else
  {drawline();}
}


void drawline()
{
  stroke ((50 + (movex * 2)),0,(255-(movex*2)));
  strokeWeight ((pos * .05));
  line(pos,0,pos,int(random(height)));
  pos += 50;
}

int newpos()
{
  movex += 10;
  return movex;
}

void mousePressed()
{
  background(255);
  pos = 10;
  movex = 0;
}


