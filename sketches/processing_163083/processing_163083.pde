
void setup()
{
  size(600,600);
  background(0);
  frameRate(20);
}

void draw()
{
  if (mousePressed)
  {
  float a = random(0, width);
  float b = random(mouseY, 600);
  float c = random(0, 300);
  float d = random(mouseY, 600);
  
  line(mouseX, mouseY, a, b);
  line(a, b, c, d);
  stroke(252,240,0);
  strokeWeight(5);
  }
  else 
  {
    background(0);
  }
}
