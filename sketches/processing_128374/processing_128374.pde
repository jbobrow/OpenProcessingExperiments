
/* @pjs preload="rock.gif, berserk.jpg"; */

PImage myimage;
PImage myimage2;

void setup()
{
  size(500, 500);
  
  myimage = requestImage("berserk.jpg");
  myimage2 = loadImage("rock.gif");
}

void draw()
{
  if (myimage.width > 0)
  {
  tint(105,255,255);
  image(myimage, 0, 0, width, height);
  noTint();
}

//use @pjs preolad if you use loadImage() to load the image
image(myimage2, width/2, height/2, 100, 100);

for (int x = 0; x < width; x += 10)
{
  stroke(0);
  line(x, 0, x, height);
}

for (int y = 0; y < height; y += 20)
{
  stroke(0);
  line(0, y, width, y);
  float ly = 0.0;
  float lx = 0.0;
  while (lx < width)
  {
    float nextX = lx + random(10);
    float nextY = ly + random(50);
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
  strokeWeight(1);
}

myimage2.filter(GRAY);

}


