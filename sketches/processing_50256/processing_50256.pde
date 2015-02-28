
// homework4
// copyright Victoria Adams 1.30.12

float x, y, z;

void setup ()
{
  size (400, 400);
  background (0);
  smooth ();
  x = 0;
  y = 400;
  z = 300;
}

void draw ()
{

}

void mousePressed ()
{
  strokeWeight (random(10));
  strokeCap (PROJECT);
  line (x+random(400), y, x+random(400), z);
  
  if (z<=200)
  {
    stroke (255, 233, random(220), random(200));
  }
  
  if (z>200)
  {
    stroke (252, 114, 90, random(200));
  }
}

void keyPressed ()
{
  if (keyCode == UP)
  {
    z = z-10;
  }
  
  if (keyCode == DOWN)
  {
    z = z+10;
  }
}               
