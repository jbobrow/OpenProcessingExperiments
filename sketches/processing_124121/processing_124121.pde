
PImage img;
PImage img2;

void setup ()
{
  size (800, 500);
img= loadImage("DSC_0404.jpg");
img2= loadImage ("IMG_8086.JPG");
}
void draw ()
{
  background (0);
  imageMode(CORNER);
  tint(255, 153, 204);
  image(img, mouseX, mouseY, 200, 150);
  
  imageMode(CORNER);
  noTint();
  image(img2, 50, 50, 100, 100);
}



