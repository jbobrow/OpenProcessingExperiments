
// Homework #4 Draft 48-257
// Humaira Tasnim htasnim Copyright 2012

float x, y, dia;

void setup()
{
  size (400, 400);
  smooth ();
  noStroke ();
  background (96, 208, 222);
  x = 200;
  y = 200;
  dia = 20;
}

void draw()
{
  fill (random(255), random(255), random(255), 35);
  ellipse (x, y, dia, dia);
}

void keyPressed()
{
  if (keyCode == UP)
  {
    y = y - dia;
    ellipse (x, y, dia, dia);
  }
   
  if (keyCode == DOWN)
  {
    y = y + dia;
    ellipse (x, y, dia, dia);
  }
  
  if (keyCode == LEFT)
  {
    x = x - dia;
    ellipse (x, y, dia, dia);
  }
  
  if (keyCode == RIGHT)
  {
    x = x + dia;
    ellipse (x, y, dia, dia);
  }
  
  if (key == 'c')
  {
    background (96, 208, 222);
  }
  
  if (key == '+')
  {
    dia = dia + 1;
    ellipse (x, y, dia, dia);
  }
  
  if (key == '-')
  {
    dia = dia - 1;
    ellipse (x, y, dia, dia);
  }
}

