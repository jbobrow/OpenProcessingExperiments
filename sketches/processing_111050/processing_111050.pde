
PImage upImage;
PImage upyoung;
PImage married;
void setup()
{
  size(600, 600);
  upImage = requestImage ("up.jpg");

}

void draw()
{
  if (upImage.width > 0)
  {
    image(upImage, -350, 0);
    filter(GRAY);
    filter(POSTERIZE, 9);
  }
  
}



