
color brushColor;
PImage paletteImage;
PImage brush2;
float someScale = 1.0;
float someRotation = 0.0;
 
void setup()
{
  size(500, 500);
  brush2  = requestImage("brush2.gif");
  paletteImage  = requestImage("colorWheel.png");
  background(255);
 
}  
    
void draw()
{
  noStroke();   
  if (paletteImage.width > 0)
  {
    image(paletteImage, 400, 400, 100, 100);
   }
   if (mousePressed == true)
   {
    if (mouseButton == LEFT)
    {
      if (key == '1')
      {
        pushMatrix();
        translate(mouseX, mouseY);
        rotate(someRotation);
        scale(someScale);
        triangle(0, 0, 30, 30, 30, 15);
        popMatrix();
      }
      else if (key == '2')
        {
          if (brush2.width > 0)
          {
          image(brush2, mouseX, mouseY, 50, 50);
          }
        }
    else if (key == '3')
      {
      pushMatrix();
      rotate(someRotation);
      scale(someScale);
      rect(mouseX, mouseY + random(100), 35, 30);
      popMatrix();
      }
    } 
    if (mouseButton == RIGHT)
      {
      brushColor = get(mouseX, mouseY);
      }    
    if (key == 'd')
    {
      background(255);
      image(paletteImage, 0, 0, 100, 100);
    }
      fill(brushColor);
  }
}



