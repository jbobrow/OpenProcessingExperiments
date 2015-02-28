
/**
 * Alpha Mask. 
 * 
 * Loads a "mask" for an image to specify the transparency 
 * in different parts of the image. The two images are blended
 * together using the mask() method of PImage. 
 */
 
PImage img;
PImage maskImg;

void setup() 
{
  size(800,800);
  img = loadImage("test1.jpg");
  maskImg = loadImage("bulb.png");
  img.mask(maskImg);
}

void draw() 
{
  background((mouseX+mouseY)/5);
  image(img, 60, 60);
  image(maskImg, mouseX-50, mouseY-50);
}

