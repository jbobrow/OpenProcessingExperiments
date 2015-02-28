
void setup()
{
  size(400, 600);
  background(225);
  smooth();
  frameRate(60);
}
void draw()
{
  fill(random(255),random(255),random(255));
  ellipse(random(width),random(height), random(100),random (50));
  line(random(width),random(height),random(width),random(height));
  
}

void mousePressed()
{
  background(random(255),random(255),random(255));
}
