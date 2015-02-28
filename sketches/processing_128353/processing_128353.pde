
/* @pjs preload="dota2_logo.jpg, Teamliquid_logo_blue.png, Protoss.png"; */

PImage myimage;
PImage myimage2;
PImage myimage3;

void setup()
{
  size(500,500);
  myimage = loadImage("dota2_logo.jpg");
  myimage2 = loadImage("Protoss.jpg");
  myimage3 = loadImage("Teamliquid_logo_blue.jpg");
}

void draw()
{

 image(myimage, 0, 0, width, height);
 image(myimage2, 5, 225, 100, 100);
 image(myimage3, 300, 225, 100, 100);

for (int x =0; x < width; x += 10)
  {
  stroke(255,0,0);
  line(x, 0, x, height);
  }
for (int y = 0; y < height; y += 20)
  {
    stroke(0,0,0);
    line(0, y, width, y);
  }
stroke(255);
strokeWeight(10);
float ly = 300.50;
float lx = 0.0;
while (lx < width)
  {
    float nextX = lx + random(100);
    float nextY = ly + random(300);
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
  strokeWeight(1);
  filter(INVERT);
 
}



