
color  brushColor;
PImage vineImage;
PImage paletteImage;
float someScale = 1.0;
float someRotation = 0.0;
  
void setup()
{
  size(500, 500);
  vineImage  = requestImage("vine.png");
  paletteImage  = requestImage("g0000_palette.png");
  frameRate(30);
  background(255);
}
  
  
void draw()
{
  noStroke();
  if (paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 100, 100);
  }
  if (mousePressed == true)
  {
    if (keyCode == UP)
    {
      someScale = someScale + 1.0;
    }
    if (keyCode == DOWN )
    {
      someScale = someScale - 1.0;
    }
    if (keyCode == RIGHT)
    {
      someRotation = someRotation + 1.0;
    }
    if (keyCode == LEFT)
    {
      someRotation = someRotation - 1.0;
    }
    if (mouseButton == LEFT)
    {
      if (key == '1')
      {
        pushMatrix();
        translate(mouseX, mouseY);
        rotate(someRotation);
        scale(someScale);
        triangle(0, 0, -15, 15, 15, 15);
        popMatrix();
      }
      else if (key == '2')
      {
        pushMatrix();
        rotate(someRotation);
        scale(someScale);
        translate(mouseX,mouseY);
        image(vineImage, -50, -50, 100,100);
        popMatrix();
      }
      else if (key == '3')
      {
      pushMatrix();
      rotate(someRotation);
      scale(someScale);
      ellipse(mouseX + random(100), mouseY + random(100), 50, 50);
      popMatrix();
      }
    }
    if (mouseButton == RIGHT)
      {
      brushColor = get(mouseX, mouseY);
    }
    fill(brushColor);
  }
}



