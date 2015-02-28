
PImage paletteImage;
PImage brushtwo;
float someScale = 0.1;
float someRotation = 0.1;
color brushColor;

void setup()
{
  size(500,500);
  paletteImage = requestImage("images.jpeg");
  brushtwo = requestImage("Tracks.png");
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
          rect(100, 100, 200, 200);
          popMatrix();
        }
        else if (key == '2')
        {
          if (brushtwo.width > 0)
          {
            image(brushtwo, mouseX, mouseY, 40, 40);
          }
        }
        else if (key == '3')
        {
          filter(INVERT);
          fill(random(255), random(255), random(255));
          pushMatrix();
          ellipse(mouseX + random(100), mouseY + random(100), 20, 20);
          popMatrix();
        }
      }
      if (mouseButton == RIGHT)
        {
          brushColor = get(mouseX, mouseY);
        }
        fill (brushColor);
    }
  }
          


