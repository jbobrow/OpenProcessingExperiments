
//Mitsuko Verdery 
//hw#4
//Copyright 2012

float x;
float y;
void setup()
{
  size(400, 400); 
  smooth();
  background (0, 0, 0);
  x = random(width);
  y = random(height);
}

void draw()
{
  if (mousePressed && (mouseButton ==RIGHT))
  {
    background (0, 0, 0);
  }
}


void mouseDragged()
{
  if (mouseButton == LEFT)
  {
    {
      noStroke();
      fill(random(255), random(255), random(255), 50);
      quad(200, 200, mouseX, mouseY, x, y, 100, 53);
    }
  }
}

void mouseReleased()
{
  x = random(width);
  y = random(height); 
}

void keyPressed () {
  
  if (key == ' ') {
    background (random (255), random (255), random (255), 100);
  }
}
