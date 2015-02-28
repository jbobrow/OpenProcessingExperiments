
color  brushColor;
PImage colorWheel;
float triRotate = 0.0;
float triScale = 1.0;
 
void setup()
{
  size(500, 500);
  colorWheel = requestImage("download.jpg");
}

void draw()
{
  if (colorWheel.width > 0)
  {
    image(colorWheel, 0, 0, 100, 100);
  }
  if (mousePressed == true)
  {
    if (mouseButton == RIGHT)
    {
      brushColor = get(mouseX, mouseY);
    }
  }
  
  noStroke();
  fill(255, 0, 0);
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      pushMatrix();
      
      translate(mouseX, mouseY);
      rotate(triRotate);
      scale(triScale);
      fill(brushColor); 
      triangle(0, 0, 50, 0, 0, 50);
      
      if (keyPressed)
      {
        if (keyCode == UP)
        {
          triScale = triScale + .1;
        }
        else if (keyCode == DOWN)
        {
          triScale = triScale - .1;
        }
      }
      else
      {
        triScale = 1.0;
      }
      
      if (keyPressed)
      {
        if (keyCode == RIGHT)
        {
          triRotate = triRotate + .1;
        }
        else if (keyCode == LEFT)
        {
          triRotate = triRotate - .1;
        }
      }
      else
      {
        triRotate = triRotate;
      }
      
      popMatrix();
    }
  }
}



