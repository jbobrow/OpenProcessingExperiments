
PImage paletteImage;
color BackgroundColor;
float angle = 0.0;
float s = 2;
int currentBrush = 0;

void setup()
{
  size(600,600);
  paletteImage = requestImage("color-palettes.jpg");
  background(255);
}

void draw()
{
  if(paletteImage.width > 0)
  {
    image(paletteImage, 0,0,200,200);
  }
  if(mousePressed == true && mouseButton == RIGHT)
  {
    BackgroundColor = get(mouseX, mouseY);
  }
  if(mousePressed == true)
  {
    if(mouseButton == LEFT)
    {
      if(currentBrush == 0)
      {
        stroke(4);
        fill(red(BackgroundColor), green(BackgroundColor), blue(BackgroundColor));
        pushMatrix();
        translate(mouseX, mouseY);
        rotate(angle);
        scale(s);
        triangle(0,-15,-15,15, 15, 15);
        popMatrix();
      }
    }
  }
}
  
void keyReleased()
{
  if (key == '1')
  {
    s += 1;
  }
  if (key == '2')
  {
    s += -1;
  }
  if (key == '3')
  {
    angle += 1;
  }
  if (key == '4')
  {
    angle += -1;
  }
}


