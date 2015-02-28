
float x = 200;
float y = 0;
void setup()
{
  size(800, 600);
  background(88, 6, 6);
}
void draw()
{
}
void mouseDragged()
{  
  stroke(y);
  strokeWeight(4);
  smooth();
  fill(x-133, 6, 121, 3);
  line(random(800), random(800), 100, 100);
  line(random(800), random(800), 100, 100);
  ellipse(random(800), random(800), 100, 100);
  ellipse(random(800), random(800), 100, 100);
  
  x = x + 0.5;
  y = y + 0.5;
  if (x < 0)
  {
    x = 255;
  }
  if (y > 255)
  {
    y = 0;
  }
}
void keyPressed()
{
  if (key==' ')
  {
    background(88, 6, 6);
  }
}
