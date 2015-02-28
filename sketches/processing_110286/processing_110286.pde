
PImage bigImage;
 
void setup() 
{
  size(380, 250);
  bigImage = requestImage("skull.jpg");
}
 
void draw() 
{
    if (bigImage.width > 0)
    {
      image(bigImage, 0, 0, width, height);
    }
}


