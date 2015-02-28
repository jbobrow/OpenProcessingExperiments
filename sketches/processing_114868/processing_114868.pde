
float prevX;
float prevY;
float angle = 0.0;
float s = 0;
float e = 0.3;
int currentBrush = 0;
PImage paletteImage;
color simColor;

void setup()
{
  size(600,600);
  paletteImage = requestImage("ColorWheel_Base.png");
}

void draw()
{
  fill(red(simColor), green(simColor), blue(simColor));
  if(paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 200, 200);
  }
  if (mousePressed == true && mouseButton == RIGHT)
  {
    simColor = get(mouseX, mouseY);
  }
  
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      pushMatrix();
      translate(mouseX, mouseY);
      rotate(angle);
      scale(s, s);
      triangle(30-60, 75-60, 58-60, 20-60, 86-60, 75-60);
      popMatrix();
    }
  }
}

void keyPressed()
{
  //Up & Down: Rotate; Left & Right: Scale
  if (keyCode == UP)
  {
     angle += 0.1;
      if (angle > TWO_PI)
      {
        angle = 0;
      }
  }
  
  if (keyCode == DOWN)
  {
    angle -= 0.1;
    if (angle < -10)
    {
     angle = 0;
    }
  }
  
  if (keyCode == LEFT)
  {
    s += e;
    if (s > 5)
    {
     e = - 0.3;
    }
    if (s < 0.5)
    {
     e = 0.3;
    }
  }
  
  if (keyCode == RIGHT)
  {
    s -= e;
    if (s < -2)
    {
     e = - 0.3;
    }
    if (s > -0.5)
    {
     e = 0.3;
    }
  }
}


