
//Derek King, User Imput, CP1 mods 14-15
//http://dereklucca.webs.com/User Imput 2.html

int x, y;
void setup()
{
  size(400, 400);
  x= 200;
  y= 200;
}
void draw()
{
  stroke(255);
  rect(0, 0, 400, 400);
  stroke(random(256),random(256),random(256));
  fill(0,0,0,5);
  ellipse(x, y, 50, 50);
}
void keyPressed()
{
  if (key == 'a')
  {
    x=x-5;
  }

  if (key == 'w')
  {    
    y=y-5;
  }
  if (key == 'd')
  {
    x=x+5;
  }
  if (key == 's')
  {
    y=y+5;
  }
}
