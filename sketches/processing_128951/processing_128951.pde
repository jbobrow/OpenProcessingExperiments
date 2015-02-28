
/* @pjs preload="MeandRomeo2.gif, SkywGlasses.gif"; */

PImage myimage;
PImage myimage2;

void setup()
{
  background(255);
  size(450, 640);
  
  myimage = loadImage("MeandRomeo2.gif");
  myimage2 = loadImage("SkywGlasses.gif");
  myimage.filter(GRAY);
  
}

void draw()
{
  image(myimage2, 135, 0, 300, 300);
  filter(BLUR, 2);
  
  for (int x = 0; x < width; x += 15)
  {
    stroke(#CCCDCE);
    line(x, 0, x, height);
  }
  
  for (int y = 0; y < height; y = y + 15)
  {
    stroke(#CCCDCE);
    line(0, y, width, y);
  }
  
  if (myimage.width > 0)
  {
    image(myimage, 0, 0, width, height);
  }
}



