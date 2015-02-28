
//Mitsuko Verdery 
//hw#3 
//60-257 A
//Copyright 2012 


float dia = 20;
 
void setup()
{
  size(400, 400); 
  smooth();
  background(0, 0, 0);
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
      quad(200, 200, mouseX, mouseY, 250, 200, 100, 53);
    }
  }
}
                
                                
