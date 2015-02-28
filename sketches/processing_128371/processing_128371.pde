
/* @pjs preload="images.jpg, imgres.jpg"; */

PImage myimage;
PImage myimage2;

void setup()
{
  size(500, 300);
  
  myimage = requestImage("imgres.jpg");
  myimage2 = loadImage ("images.jpg");
  
}

void draw()
{
  if (myimage.width > 0)
  {
    tint(0,153,204);
    image(myimage, 0, 0, width, height);
    noTint();
  }
  image(myimage2, width/2, height/2, 100, 100);
  myimage2. filter(GRAY);
  for (int x = 0; x < width; x  += 10)
  {
    stroke(0,0,255);
    strokeWeight(1);
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y += 20)
  {
    stroke(0,255,0);
    strokeWeight(1);
    line(0, y, width, y);
  }
  
  stroke(255);
  strokeWeight(5);
  float ly = 0.0;
  float lx = 0.0;
  while (lx < width)
  {
    float nextX = lx + random(1, 10);
    float nextY = ly + random(50);
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
 }


