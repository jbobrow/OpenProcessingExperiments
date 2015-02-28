
PImage[] images = new PImage[14];
PImage img = new PImage();
int r;

void setup()
{ 
  frameRate(15);
  size(366, 237);
  for (int i = 0; i < images.length; i ++)
  {
    images[i] = loadImage( i +".png");
  }
  background( images[0] );
}
void draw()
{
  if (mousePressed)
  {
    r=int(random(14));
    image(images[r], 0, 0);
  }
}


