
PImage paletteImage;
color currentColor;
float a;
float s = 1;

void setup()
{
  size (500, 500);
  paletteImage = requestImage("palette.jpg");
}

void draw()
{
  if (paletteImage.width > 0);
  {
   image (paletteImage, 0, 0, 100, 100); 
  }
  
  if (mousePressed == true)
  {
    if (mouseButton == RIGHT)
    {
       currentColor = get(mouseX, mouseY); 
    }
    if (mouseButton == LEFT);
    {
      pushMatrix();   
    translate(mouseX, mouseY);
    rotate(a);
       scale(s);
  fill(red(currentColor), green(currentColor), blue(currentColor));
  triangle(0, 0, 0, 75, 75, 0);
popMatrix();  
    }
  }   
}

void keyPressed()
{
  if (keyCode == LEFT)
  {
  a += .05;
  }
  
  if (keyCode == RIGHT)
  {
   s += .05; 
  }
  
}


