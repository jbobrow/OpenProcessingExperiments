
// What lies beneath the surface

 
PImage  egg1, egg2;
PGraphics msk;
 
void setup()
{
  size(842,595);
 egg1 = loadImage("Egg Infographic - layer 1.jpg");
  egg2 = loadImage("Egg Infographic - layer 2.jpg");
  msk = createGraphics(width, height, JAVA2D);
}
 
void draw()
{
  msk.beginDraw();
  msk.smooth();
  msk.background(255);
  msk.fill(0);
  msk.noStroke();
  msk.ellipse(mouseX, mouseY, 150, 150);
  msk.filter(BLUR, 5); // blur the edges of the mask
  msk.endDraw();
  egg1.mask(msk);
  image(egg2,0,0);
  image(egg1,0,0);
}


