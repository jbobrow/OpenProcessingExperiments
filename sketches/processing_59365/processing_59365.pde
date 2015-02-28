
// END OF FREE RANGE
 
PImage  egg1, egg2;
PGraphics msk;
 
void setup()
{
  size(900, 636);
 egg1 = loadImage("Egg Infographic - layer 1.4 - resized.jpg");
  egg2 = loadImage("Egg Infographic - layer 2.4 - resized.jpg");
  msk = createGraphics(width, height, JAVA2D);
}
 
void draw()
{
  msk.beginDraw();
  msk.smooth();
  msk.background(255);
  msk.fill(0);
  msk.noStroke();
  msk.ellipse(mouseX, mouseY, 180, 180);
  msk.filter(BLUR, 5); // blur the edges of the mask
  msk.endDraw();
  egg1.mask(msk);
  image(egg2,0,0);
  image(egg1,0,0);
}


