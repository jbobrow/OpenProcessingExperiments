
color  brushColor;
PImage paletteImage;
PImage stamp;
float someScale = 1.0;
float someRotation = 0.0;

void setup()
{
  size(500, 500);
  stamp  = requestImage("stamp.png");
  paletteImage  = requestImage("colorwheel.jpg");
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
          if (stamp.width > 0)
          {
          image(stamp, mouseX, mouseY, 50, 50);
          }
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
    if (key == 'q')
    {
      background(255); 
      image(paletteImage, 0, 0, 100, 100);
    }
      fill(brushColor);
  }
}



