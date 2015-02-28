
//copyright Victoria Adams 2.21.25
//hw8


void setup ()
{
  size (400, 400);
}

void draw ()
{
  background (mouseX, mouseY, 0);
  float x = 1;
  float c = 1;
  if (keyPressed == true)
  {
    c = 255;
  }
  while (x < width)
  {
    strokeWeight (x*.02);
    stroke (frameCount%255, c, x);
    line (x, 0, x, height);
    x = x +10;
  }
  
}

                
                
