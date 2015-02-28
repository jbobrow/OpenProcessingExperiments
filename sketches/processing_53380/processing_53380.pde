
// Homework #8 48-257
// Humaira Tasnim htasnim Copyright 2012

void setup()
{
  size (400, 400);
  noStroke();
  smooth();
}

void draw()
{
  float i = 0;
  
  while (i < width)
  {
    fill (random(30,256), random(30,256), random(220,256), 10);
    rect (i, 0, 10, height);
    i = i + 10;
  }
  
  if (keyPressed == true)
  {
    float dia = random(10, 50);
    fill (random(220,256), random(30,256), random(30,256));
    ellipse (random(width), random(height), dia, dia);
  }
  
  if (mousePressed == true)
  {
    float dia = random(10, 50);
    fill (random(30,256), random(220,256), random(30,256));
    rect (random(width), random(height), dia, dia);
  }
}

