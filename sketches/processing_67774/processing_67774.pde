
float x = 100;
float y = 75;

void setup()
{
  size (200,200);
}

void draw()
{
  background(random (0,255), random (0,255), random (0,255));
  smooth();
  ellipse (x,y,50,50);
  rect (x-10,y+25,20,65);
  line (x-10,y+35,x-50,y+5);
  line (x+10,y+35,x+50,y+5);
  line (x-10,y+90,x-25,y+150);
  line (x+10,y+90,x+25,y+150);
  fill (random (0,255), random (0,255), random (0,255));
  ellipse (x+10,y,15,25);
  ellipse (x-10,y,15,25);

  y = y + random(-2,2);
  x = x + random(-3,3);
}



