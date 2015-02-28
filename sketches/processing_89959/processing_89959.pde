
int r;
int g;
int b;

void setup()
{
  size (200,200);
 
}

void draw()
{
  background (r, g, b);
  stroke(248, 250, 187);
  strokeWeight(3);
  
  line (width/2, 0, width/2, height);
  line (0, height/2, width, height/2);
  
  if (mouseX > width/2 && mouseY < height/2)
  {
    r = r + 1;
  }
  else
  {
    r = r - 1;
  }
  
  if (mouseX < width/2 && mouseY < height/2)
  {
    g = g + 1;
  }
  else
  {
    g = g - 1;
  }
  
  
  if (mouseY > height/2 && mouseX < width/2)
  {
    b = b + 1;
  }
  else
  {
    b = b - 1;
  }
  
  
  r = constrain (r, 0, 255);
  g = constrain (g, 0, 255);
  b = constrain (b, 0, 255);
  
}


