

private PImage originalImage;
private float splotchSize = 10;
int y = 0;

public void setup() 
{
  originalImage = loadImage("Candy.jpg");
  size(originalImage.width, originalImage.height);
  //image(originalImage, 0, 0);
  
  noStroke();
}

public void draw() 
{
  y++;
  for(int i = 0; i < 500; i++)
  {
    drawSplotch();
  }
}

public void drawSplotch()
{
  int x = (int) random(0, width);
  //int y = (int) random(0, height);
  
  color pixelColor = originalImage.get(x, y);
  
  fill(pixelColor);
  ellipse(x, y, splotchSize, splotchSize);
}


