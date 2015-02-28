
void setup()
{
  size(600, 600);
  background(0);
  //strokeWeight(100);
  //point(width, height*(3/4));
}

void draw()
{
  
}

void mouseDragged()
{
  if(mouseY > height/2)
  {
    float red = map(mouseY-height/2, 0, height/2, 0, 255);
    float blue = 255;
    float green = map(mouseY-height/2, 0, height/2, 0, 255);
    stroke(red, green, blue);
  }
  else
  {
    if(mouseY < height/4)
    {
      float red = 0;
      float blue = map(mouseY, 0, height/4, 0, 255);
      float green = 255;
      stroke(red, green, blue);
    }
    else
    {
      float red = 0;
      float blue = 255;
      float green = map(height/2-mouseY, 0, height/4, 0, 255);
      stroke(red, green, blue);
    }
  }
  strokeWeight(100);
  line(pmouseX, pmouseY, mouseX, mouseY);
}
