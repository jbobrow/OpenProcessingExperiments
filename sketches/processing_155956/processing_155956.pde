
int xpos = 0;
int xdir = 1;

void setup()
{
  background(0);
  size(300,300);
}


void draw()
{
  
  xpos = xpos + xdir;
  
  // if xpos is greater than the width-20 (280) 
  // or if xpos is less than 1 then negate xdir
  if (xpos > width-20 || xpos < 1)
  {
    xdir = -xdir;
  }
  
  int colors = 255;
  fill(random(colors), random(colors), random(colors));
  ellipse(xpos, 50, 50, 50);
}
