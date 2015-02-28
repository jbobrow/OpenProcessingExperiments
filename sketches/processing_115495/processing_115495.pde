
PImage paletteImage;
color currentColor; 
float s = 1;
float angle = 0;

void setup()
{
  size( 500, 500);
  paletteImage = requestImage("palette.png");
}

void draw()
{
 
  if (paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 100, 100);
  }
  
  if (mousePressed == true)
  {
    if (mouseButton ==  RIGHT)
    {
      currentColor = get (mouseX, mouseY);
    }  
  }
  
  if (keyPressed == true)
  {
    if (key == CODED)
    {
      if (keyCode == UP)
      { 
        s += .01;
      }
    }
    if (keyCode == DOWN)
    {
      s -= .01;
    }
    if (keyCode == LEFT)
    {
      angle -= .5;
    }
    if (keyCode == RIGHT)
    {
      angle += .5;
    }
  }
  
  
  fill(red(currentColor), green(currentColor), blue(currentColor));
 
  if (mousePressed == true)
  {
    if (mouseButton ==  LEFT)
    {
  pushMatrix();
  translate(mouseX, mouseY);
  scale(s);
  rotate(radians(angle));
  triangle(-30, 55, 0, 0, 35, 55);
  popMatrix();

    }  
  } 

}





