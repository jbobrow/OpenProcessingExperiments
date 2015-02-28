
PImage logoImage;
PImage ryuImage;
PImage akumaImage;

void setup()
{
  size(500, 500);
  logoImage = requestImage("imgres.jpg");
  ryuImage = requestImage("ryu.jpg");
  akumaImage = requestImage("akuma.jpg");
}

void draw()
{
  if (logoImage.width >0)
  {
    imageMode(CENTER);
    // call for image
    image(logoImage, 250, 250, width, height);
    filter (THRESHOLD);
  }
  
  if (ryuImage.width >0)
  {
      image(ryuImage, 20, 400);
  }
  
  if (akumaImage.width >0)
  {
    image(akumaImage, 450, 400);
  }
  
  {
    stroke (0);
    int gridSize = 50;
    int x = 0;
    while (x < width)
    {
      line (x, 0, x, height);
      x += gridSize;
    }
    int y = 0;
    while ( y < height)
    {
      line (0, y, width, y);
      y += gridSize;
    }
    float x1 = 115;
    float y1 = 350;
    float prevX1 = x1;
    float prevY1 = y1;
    strokeWeight (3);
    stroke(36, 22, 245);
    while (x1 < 410)
    {
      x1+= 5;
      y1+= random(-10, 10);
      line(prevX1, prevY1, x1, y1);
      prevX1 = x1;
      prevY1 = y1;
    }
      
  }
}


