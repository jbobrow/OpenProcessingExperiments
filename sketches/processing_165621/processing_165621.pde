
float R = random(0,255);
float G = random(0,255);
float B = random(0,255);

void setup()
{
  size(600,600);
  background(255);
  smooth();
  noStroke();
}

void draw()
{
  float R = random(0,255);
  float G = random(0,255);
  float B = random(0,255);

  ellipse(mouseX, mouseY, 25, 25);
  fill(R,G,B);
  
  if(mousePressed)
  {
    if(mouseButton == LEFT)
    {
      ellipse(mouseX, mouseY, 50, 50);
    }
    if(mouseButton == RIGHT)
    {
      ellipse(mouseX, mouseY, 10, 10);
    }
  }
}
  


