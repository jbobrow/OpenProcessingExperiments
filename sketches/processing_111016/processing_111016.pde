

PImage cakeImage;
PImage faceImage;
boolean filterApplied = false;
PImage catImage;

void setup()
{
  size(400, 400);
  frameRate(12);
  catImage = requestImage("catlike.jpg");
  cakeImage = requestImage("catcake.jpg");
  faceImage = requestImage("catnoface.jpg");
}

void draw()
{
  if (catImage.width > 0)
  {
    image(catImage, 0, 0, width, height);
  }
  filter(THRESHOLD, .6);
  
  float a = 40;
  float b = 320;
  float prevA = a;
  float prevB = b;
  
  stroke(144, 191, 29);
  while (a < 360)
  {
    a += 20;
    b += random(-10, 10);
    line(prevA, prevB, a, b);
    prevA = a;
    prevB = b;
  }
  
  if (cakeImage.width > 0)
  {
    image(cakeImage, 0, height*.6, width*.3, height*.4);
  }
  
  if (faceImage.width > 0)
  {
    image(faceImage, width*.7, height*.6, width*.3, height*.4);
  }
  filter(INVERT);
  
    stroke(0, 0, 255);
  int gridSize = 40;
  int x = 0;
  int y = 0;
  
  for(x = 0; x < width; x += gridSize)
  {
    line(x, 0, x, height);
  }
  stroke(255, 0, 0);
  for(y = 0; y < height; y += gridSize)
  {
    line(0, y, width, y);
  }
  
}


