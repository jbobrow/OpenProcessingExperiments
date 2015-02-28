
PImage colors;
color brushColor;
float someScale = 1;
float someRotation = 0;
int dim;
float drip = 0; 
float dripX = 0; 
float dripY = 0; 
boolean shouldDrip = false;
int currentBrush = 1;


void setup()
{
  size(500,500);
  dim = width/2;
  background(255);
  colors = requestImage("colors.gif");
  //colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  frameRate (30);
}

void draw()
{
  noStroke();
  
  if (colors.width > 0)
  {
    image(colors, 0, 0, 150, 150);
  }
  
  if (currentBrush == 2 && shouldDrip == true)
  {
    rect(dripX, dripY, 40,40); 
    dripY = dripY + 10;
  }
  
  if (keyPressed)
  {
    if (key == 'w')
    {
      someScale = someScale + 1;
    }
    if (key == 's')
    {
      if (someScale > 1)
      { 
        someScale = someScale - 1;
      }
    }
    if (key == 'q')
    {
      someRotation = someRotation + 1;
    }
    if (key == '1')
    {
      currentBrush = 1;
    }
    if (key == '2')
    {
      currentBrush = 2;
    }
    if (key == '3')
    {
      currentBrush = 3;
    }
  }
  

  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      if (currentBrush == 1)
      {
        pushMatrix();
        fill(red(brushColor), green(brushColor), blue(brushColor));
        translate(mouseX,mouseY);
        rotate(someRotation);
        scale(someScale);
        triangle(-10, -10, 10, -10, 0, 10);
        popMatrix();
      }
      if (currentBrush == 2)
      {
        fill(red(brushColor), green(brushColor), blue(brushColor));
        rect(mouseX, mouseY, 40,40); 
        shouldDrip = true;
        dripX = mouseX; 
        dripY = mouseY + 40;
      }
      if (currentBrush == 3)
      {
        for (int x = 0; x <= width; x+=dim)
        {
          drawGradient(mouseX + x, mouseY);
        }
      }
    }
    if (mouseButton == RIGHT)
    {
      brushColor = get(mouseX,mouseY);
    }
  }
}

void drawGradient(float x, float y)
{
   colorMode(HSB, 360, 100, 100);
   int radius = dim/4;
  float h = random(0, 360);
  float sr = mouseX + random(-150, 150);
  float dr = mouseY + random(-90, 90);
  for (int r = radius; r > 0; --r)
  {
    fill(h, 90, 90);
    rect(sr, dr, r, r);
    h = (h+1) % 360;
    }
  colorMode(RGB, 255, 255, 255);
}



