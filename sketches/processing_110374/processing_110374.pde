

PImage myImage;
PImage myImage2;
PImage myImage3;
boolean alreadyInverted = false;
void setup()
{
  size(500, 500);
  frameRate(30);
  myImage = requestImage("wire.png");
  myImage2 = requestImage("Pear.png");
  myImage3 = requestImage("Banana.png");
}

void draw()
{
  if (myImage.width > 0)
  {
    if (alreadyInverted == false)
    {
      myImage.filter(INVERT);
      alreadyInverted = true;
    }
      image(myImage, 0, 0, width, height);
      image(myImage2, 100, 200, 100, 100);
      image(myImage3, 300, 200, 100, 100);
  }
  
  //Vertical lines going to the right
  int xx = 0;
  while (xx < width)
  {
    line (xx, 0, xx, height);
    xx += 30;
  }
  
  //horizontal lines going to the right
    int yy = 0;
    while (yy < width)
    {
      line (0, yy, width, yy);
      yy += 30;
    }    
    //Jagged line
        stroke(0);
    strokeWeight(2);
    float ly = 240.0;
    float lx = 170.0;
    while (lx < 301)
    {
      float nextX = lx + 10;
      float nextY = ly + random(-5, 5);
      line(lx, ly, nextX, nextY);
      ly = nextY;
      lx = nextX;
    }
    strokeWeight(1);

}


