
//Sophia Chu 4-5 CP1
//http://iamacarrot.webs.com/Animation.html

int y = 300;
int move = 1;
int middle = 3;
int z = 400;


void setup()
{
  size(500,500);
  smooth();
  frameRate(40);
}
void draw ()
{
  background(0);
  head();
  eyes();
  mouth();
}
void head()
{
  fill(238,255,5);
  stroke(0);
  ellipse(250,250,400,400);
}
void eyes()
{
  fill(0);
  ellipse(180,180,30,60);
  ellipse(320,180,30,60);
}

void mouth ()
{
  noFill();
  strokeWeight(10);
 
  bezier (120,y,200,z,300,z,380,y);
  y = y+move;
  z = z-middle;
  if (y>321)
  {
    move = -1;
  }
  if (y<300)
  {
    move = 1;
  }
  if (z<250)
  {
    middle = -3;
  }
  if (z>400)
  {
    middle = 3;
  }
}
