
/* @pjs preload="RidiculousFish.jpg", "AnotherRidiculousFish.jpg; */

PImage myimage;
PImage myimage2;

void setup()
{
  size (300, 170);
  
  myimage = loadImage("RidiculousFish.jpg");
  myimage2 = loadImage("AnotherRidiculousFish.jpg");
}
void draw()
{
  image(myimage, 0, 0, width, height);
  image(myimage2, 100, 100, width, height);

filter(GRAY);

  for (int x = 0; x <= 300; x += 20) {
    stroke(0);
    strokeWeight(3);
    line(x, 0, x, 170);
  }

  for (int y = 0; y <= 170; y += 15) {
    stroke(0);
    strokeWeight(3);
    line(0, y, 300, y);
  
  }

  stroke(200,0,0);
  strokeWeight(3);
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



