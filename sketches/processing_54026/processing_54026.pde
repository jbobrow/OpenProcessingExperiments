
//homework #8 - 48257 S'12
//melissa (macy) goh copyright 2012

color gradientColour;

void setup()
{
  size(400, 400);
  background(255);
  smooth();
  noStroke();
  frameRate(10);
  
  gradientColour = color(random(255), random(255), random(255));
  
}

void draw()
{
  drawLines();
  fill(255, 30);
  rect(0, 0, width, height);

}

void drawLines()
{
  int x = 0;
  
  while (x < width)
  {
    fill (gradientColour, 10);
    rect (x, 0, mouseX, height);
    x = x + 50;
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    gradientColour = color(random(255), random(255), random(255));
  }
}

void mouseDragged()
{
  rect (0, 0, mouseX, height);
}


