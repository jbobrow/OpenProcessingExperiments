
/* @pjs reload="Super_sonic.gif"; */

PImage myImage;
PImage myImage2;
PImage myImage3;

void setup()
{
  size(501,501);
  myImage = requestImage("pikachuJPG.jpg");
  myImage2 = loadImage("Super_sonic.gif");
  myImage3 = requestImage("eeveeJPG.jpg");
  
  myImage2.filter(INVERT);
}

void draw()
{
  if (myImage.width > 0)
  {
    image(myImage, 0,0,width,height);
    myImage.filter(THRESHOLD);
  }
  if (myImage2.width > 0)
  {
    image(myImage2, width/2,height/2,200,200);
  }
  if (myImage3.width > 0)
  {
    tint(#FFFF33);
    image(myImage3, width/16,height/2,200,200);
    noTint();
  }
  
  
  
  for (int x = 0; x < width; x += 10)
  {
    stroke(#000000);
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y += 10)
  {
    line(0, y, width, y);
  }
  
  
  
  stroke(#0000FF);
  strokeWeight(10);
  float lx = 0.0;
  float ly = 0.0;
  while (lx < width)
  {
    float nextX = lx + random(50);
    float nextY = ly + random(50);
    line(lx, ly, nextX, nextY);
    lx = nextX;
    ly = nextY;
  }
  strokeWeight(1);
}


