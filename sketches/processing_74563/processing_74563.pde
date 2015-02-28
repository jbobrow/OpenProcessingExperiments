
//Kitty Kwan, mods 4/5, One Hundred Random Shapes

void setup ()
{
  size (500, 500);
  frameRate (5);
}

void draw ()
{
  background (80,73,73);
  noStroke ();
  fill (int(random(255)), int(random(255)), int(random(255)));
  int x=1;
  while (x<30)
  {
    ellipse (int(random(0, 500)), int(random(0, 500)), 35, 35);
    x++;
  }
  stroke(255,255,255);
  strokeWeight (4);
  int line=1;
  while (line<30)
  {
    line (250, 250, int(random(500)), int(random(500)));
    line++;
  }
}
