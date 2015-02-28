
PImage image1;
void setup()
{
  size(800, 600);
  
}

void draw()
{
  image1 = loadImage("image1.png");
  image(image1, 0, 0);
}

