
color pColor;
float s = 1.0;
float angle = 45.0;
PImage paletteImage;

void setup()
{
  size(700,700);
  colorMode (HSB,360,100,100);
  paletteImage = loadImage("palette.jpg");
}

void draw()
{
  if (paletteImage.width > 0)
  {
    image(paletteImage,0,0,300,250);
  }
  
  if (mousePressed == true && mouseButton == RIGHT)
    {
    pColor = get(mouseX,mouseY);
    }
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      pushMatrix();
      translate(mouseX,mouseY);
      rotate(radians(angle));
      scale(s);
      stroke(100,80);
      strokeWeight(2);
      fill(hue(pColor),saturation(pColor),brightness(pColor));
      triangle(0,-30,-30,30,30,30);
      popMatrix();
    }
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      s += 1;
    }
    if (keyCode == RIGHT)
    {
      s -= 1;
      
      if (s <= 0.01)
      {
        s = 0.01;
      }
    }
  }
  if (keyCode == UP)
  {
    angle += 1;
  }
  if (keyCode == DOWN)
  {
    angle -= 1;
  }
}


