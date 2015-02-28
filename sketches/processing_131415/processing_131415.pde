
PImage paletteImage;
PImage hagarsharkImage;
float Scale = 1.0;
float Rotation = 0.0;
color brushColor;

void setup()
{
  size(500,500);
  background(255);
  frameRate(30);
  paletteImage= requestImage("rgbwheel.png");
  hagarsharkImage = requestImage("hagarshark.png");
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
      Scale = Scale + 1.0;
    }
    if (keyCode == DOWN )
    {
      Scale = Scale - 1.0;
    }
    if (keyCode == RIGHT)
    {
      Rotation = Rotation + 1.0;
    }
    if (keyCode == LEFT)
    {
      Rotation = Rotation - 1.0;
    }
    if (mouseButton == LEFT)
    {
      if (key == '1' )
      {
        pushMatrix();
        translate(mouseX, mouseY);
        rotate(Rotation);
        scale(Scale);
        triangle(0, 0, -55, 45, 80, 15);
        popMatrix();
      }
      else if (key == '2')
      {
        pushMatrix();
        rotate(Rotation);
        scale(Scale);
        translate(mouseX,mouseY);
        image(hagarsharkImage, -50, -50, 100,100);
        popMatrix();
      }
      else if (key == '3')
      {
      pushMatrix();
      rotate(Rotation);
      scale(Scale);
      ellipse(mouseX + random(100), mouseY + random(100), 10, 10);
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



