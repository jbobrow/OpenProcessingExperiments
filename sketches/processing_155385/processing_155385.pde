
void setup()
{
  size(400, 200);
  smooth();
  background(0);
  frameRate(12);
}

void draw()
{
  fill(0, 10);
  rect(0, 0, width, height);
  
  noStroke();
  fill(255, 236, 156, 100);
  ellipse(random(width), random(height), 60, 60);
  
  filter(BLUR, 1.5);
}
