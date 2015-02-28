
/* @pjs preload="colorwheel.png"; */
float drip = 0;
float dripX = 0;
float dripY = 0;
float s = 0.0;
float a = 0.0;
color brushColor;
PImage myimage;

void setup()
{
  size(600, 600);
  myimage = loadImage ("colorwheel.png");
  fill(HSB);
  background(0);
  
}

void draw()
{
  colorMode (HSB);
  image(myimage, 0, 0, 100, 100);
  fill(brushColor);
  a = a + 0.1;
  s = cos(a)*2;
  
  
  if (mousePressed == true)
  {
    if (mouseButton == CENTER)
    {
      stroke(255);
      drawX(mouseX, mouseY, 20);
      dripX = mouseX + 20;
      dripY = mouseY + 20;
    }
    if (mouseButton == LEFT)
    {
      fill(random(255), random(255), random(255));
      pushMatrix();
      translate(mouseX+10, mouseY+10);
      ellipse(56, 36, 25, 25);
      popMatrix();
    }
    if (mouseButton == RIGHT)
    {
      brushColor = get(mouseX, mouseY);
      translate(mouseX, mouseY);
      triangle(random(77), random(100), random(150), random(50), random(100), random(50));
      
    }  
    if (keyPressed)
    {
      if (key == '1');
      {
      pushMatrix();
      translate(mouseX+10, mouseY+10);
      scale(s);
      ellipse(56, 36, 25, 25);
      popMatrix();
      }
    }
  }
  
  
  
  stroke(255);
  float nextY = dripY + 10;
  line(dripX, dripY, dripX, nextY);
  dripY = nextY;
  
  
}

void drawX(float x, float y, float xSize)
{
  line(x - xSize, y - xSize, x + xSize, y + xSize);
  line(x + xSize, y - xSize, x - xSize, y + xSize);
}


