
PImage palletteImage;
color currentColor;
float a = 0; 
float s = 1;


void setup()
{
  size(500, 500);
  palletteImage = requestImage("pallette.jpg");
}


void draw()
{
  
  if (palletteImage.width > 0)
  {
    image(palletteImage, 0, 0, 100, 100);
  }
  
  if (mousePressed == true)
  {
    if (mouseButton == RIGHT)
    {
      currentColor = get(mouseX, mouseY);
    }
  }
  
  
  if (mousePressed == true)
  {
   if (mouseButton == LEFT)
    { 
    fill(red(currentColor), green(currentColor), blue(currentColor));
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(a);
    scale(s);
    triangle(0, 0, 50, 0, 0, 50);
    popMatrix();
    }
  }
      
}

void keyPressed()
{
  
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      s += 1;
    }
    else if (keyCode == DOWN)
    {
      s -= 1;
    }
    
    if (keyCode == RIGHT)
    {
      a += 0.1;
    }
    else if (keyCode == LEFT)
    {
      a -= 0.1;
    }
  }
}


