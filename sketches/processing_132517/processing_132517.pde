
color Brushcolor;
PImage paletteImage;
PImage stamp;
float someScale = 1.0;
float someRotation = 0.0;
void setup()
{
  size(500, 500);
  stamp = requestImage("akuma.png");
  paletteImage = requestImage("palette.png");
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
        rect(0, 0, 130, 130);
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
        ellipse(mouseX + random(150), mouseY + random(150), 30, 30);
        popMatrix();
      }
    }
    if (mouseButton == RIGHT)
    {
      Brushcolor = get (mouseX, mouseY);
    }
    fill (Brushcolor);
  }
}



