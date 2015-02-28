
int currentBrush = 0;
PImage paletteImage;
color bColor;
float prevX;
float prevY;
float angle = 0.0;
float s = 1;

void setup()
{
  size(600,600);
  paletteImage = requestImage("palette.png");
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
    bColor = get(mouseX, mouseY);
  }
  if(mousePressed == true)
  {
    if(mouseButton == LEFT)
    {
      if(currentBrush == 0)
      {
        stroke(4);
        fill(red(bColor), green(bColor), blue(bColor));
        pushMatrix();
        translate(mouseX, mouseY);
        rotate(angle);
        scale(s);
        triangle(0,-30,-30,30, 30, 30);
        popMatrix();
      }
    }
  }
}

void keyPressed()
{
  if(key == '2')
  {
    angle += 0.1;
  }
  if(key == '1')
  {
    s += 0.1;
  }
  if(key == '3')
  {
    s -= 0.5;
    if(s < 0.5)
    {
      s = 0.5;
    }
  }
}


