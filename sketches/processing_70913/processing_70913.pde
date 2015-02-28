
//SNAKE, Peter Harrington, CP1 mods 16/17 
int x=250;
int y=250;
void setup()
{
  size(500,500);
  background(0);
  frameRate(20);
}
void draw()
{
  text("Use WASD to move the circle. Do not let it touch the edge.",10,20);
  fill(0,0,0,40);
  stroke(255,0,0);
  strokeWeight(3);
  rect(0,0,499,499);
  stroke(255,104,3);
  fill(0,255,253);
  ellipse(x,y,10,10);
  if(x>0 && x<500 && y>0 && y<500)
  {
    Controls();
  }
}

void Controls()
{
  if (key=='w')
  {
    ellipse(x,y,10,10);
    y=y-10;
  }
  if (key=='s')
  {
    ellipse(x,y,10,10);
    y=y+10;
  }
  if (key=='a')
  {
    ellipse(x,y,10,10);
    x=x-10;
  }
  if (key=='d')
  {
    ellipse(x,y,10,10);
    x=x+10;
  }
  if(key!='w' && key!='a' && key!='s' && key!='d');
  {
    ellipse(x,y,10,10);
  }
}
