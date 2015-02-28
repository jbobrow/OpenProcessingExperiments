
//Allison Wong, Repeating, CP1 mods 4-5
//http://allisonprogrammingsite.webs.com/

int diameter = 5;
void setup()
{
 background (0,0,0);
 smooth ();
 size (300,500);
 strokeWeight (1);
 stroke (32,178,170);
 fill (186,85,211);
 frameRate (4);
}
void draw ()
{
 ellipse (150,150,diameter,diameter);
 diameter = diameter + 10;
}
{
 background (0,0,0);
 smooth ();
 strokeWeight (3);
 stroke (176,48,96);
 fill (205,92,92);
 frameRate (2);
}
{
 fill (0,0,0,10);
 rect (0,0,100,100);
 ellipse (150,180,diameter,diameter);
 diameter = diameter + 30;
}
int x = 0;
int y = 0;
int xChange = 1;
void setup()
{
  size(400,400);
  fill(32,178,170);
  strokeWeight (5);
  stroke(153,50,204);
  frameRate (10);
}
void draw ()
{
  ellipse(x,y,30,50);
  x = x + xChange;
  y = y + 1;
  if(x < 150)
  {
    xChange = xChange + 1;
  }
  if(x >= 150)
  {
    xChange = xChange - 1;
  }
}
