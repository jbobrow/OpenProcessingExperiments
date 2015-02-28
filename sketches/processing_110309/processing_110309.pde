
PImage bigImage;
 
void setup() 
{
  size(400, 400);
  bigImage = loadImage("stoneskull.jpg");
}
 
void draw() 
{
  image(bigImage, 0, 0, width, height);
}


