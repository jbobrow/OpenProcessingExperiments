
/* @pjs preload="Unicorn.jpg":*/
PImage myImage;
PImage myImage2;
PImage myImage3;

void setup()
{
  size(500, 500);
  
  myImage = requestImage("Unicorn.jpg");
  myImage2 = requestImage("kittencute.jpg");
  myImage3 = requestImage("squirtle.jpg");

}

void draw()
{
  if (myImage.width > 0)
  {
    image(myImage, 0, 0, width, height);
    filter(INVERT);
  }
  if (myImage2.width > 0)
  {
    image(myImage2, 50, 325, 150, 150);
  }
  if (myImage3.width > 0)
  {
    image(myImage3, 250, 325, 150, 150);
  }
  for (int x = 0; x < width; x += 10)
  {
    stroke(255);
    line(x, 0, x, height);
  }
  for (int y = 0; y < width; y += 10)
  {
    stroke(0, 0, 255);
    line(0, y, width, y);
  }
  float ly = 50.0;
  float lx = 50.0;
  while(lx < width)
  {
    float nextX = lx + random(5, 20);
    float nextY = ly + random(50);
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
  lx = width/2;
  ly = height/2;
 /* for(int n = 0; n < 10; n+=1)
  {
    float nextX = lx + random(1, 10);
    float nextY = ly + random(50);
    line(lx, ly, nextX, nextY);
    //ly = nextY;
    //lx = nextX;
    */
  }



