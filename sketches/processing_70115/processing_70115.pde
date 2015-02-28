
//Jenny H. CP mods 14/15, Functions and Animation
int p1 = 120;
int p1change = 9;
int p24 = 180;
int p24change = 10;
int p3 = 180;
int p3change = -10;
int x1 = 125;
int x2 = 175;
int change = 1;
void setup ()
{
  size (300,600);
  frameRate (6);
  smooth();
}

void draw ()
{
  body ();
  head ();
  face ();
  backdrop ();
}

void head ()
{
  stroke (204);
  noFill ();
  ellipse (150, 150, 200, 200);
}

void face ()
{
  //eyes
  fill (204);
  ellipse (115, 125, 20, 50);
  ellipse (185, 125, 20, 50);
  //eyebrows
  line (100, 90, 140, 100);
  line (160, 100, 200, 90);
  //tongue
  bezier (110, 180, p1, p24, p3, p24, 200, 180);
  stroke (0);
  line (155, 180, p1, p24);
  p1 = p1 - p1change;
  if(p1 < 0)
  {
    p1change = 0;
  }
  p24 = p24 + p24change;
  if(p24 > 301)
  {
    p24change = 0;
  }
  p3 = p3 + p3change;
  if(p3 < 19)
  {
    p3change = 0;
  }
}

void body ()
{
  background (0);
  frameRate (10);
  stroke (204);
  //body
  line (150, 252, 150, 400);
  //arms
  line (150, 275, 110, 350);
  line (150, 275, 190, 350);
  line (110, 350, 150, 390);
  line (190, 350, 150, 390);
  //legs
  line (150, 400, x1, 550);
  line (150, 400, x2, 550);
  x1 = x1 + change;
  x2 = x2 - change;
  if (x1 > 180)
  {
    change = -1;
  }
  if (x1 < 120)
  {
    change = 1;
  }
}

void backdrop ()
{
  fill (204);
  quad (0, 552, 300, 552, 300, 600, 0, 600);
}
