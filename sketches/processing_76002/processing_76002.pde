
//Kitty Kwan, mods 4/5, Doubling Shapes

int y=5;
void setup ()
{
  size (500, 500);
  frameRate (12);
}

void draw ()
{
  background (197,233,234);
  noStroke ();
  fill (int(random(255)), int(random(255)), int(random(255)));
  int x=1;
 
  while (x<=y)
  {
    ellipse (int(random(0, 500)), int(random(0, 500)), 35, 35);
  
    x++;
  }
   y=y*2;
   if (y>80)
   {
     y=5;
   }
  stroke(255,255,255);
  strokeWeight (4);
  int line=1;
  while (line<20)
  {
    line (250, 250, int(random(500)), int(random(500)));
    line++;
  }
}
