
//   @pjs preload="/bboop_normal.jpg";
//   @pjs preload="/bboop_xray.jpg";


// XRay - Jim Bumgardner
//
// Artwork by http://michaelpaulus.com/
// 

PImage  boop, xray;
PGraphics msk;

void setup()
{
  size(190,334);
  boop = loadImage("bboop_normal.jpg");
  xray = loadImage("bboop_xray.jpg");
  msk = createGraphics(width, height, P2D);
  noLoop();
  image(boop.get(),0,0);
}

void draw()
{
  msk.beginDraw();
  msk.smooth();
  msk.background(255);
  msk.fill(0);
  msk.noStroke();
  msk.ellipse(mouseX, mouseY, 80, 80);
  msk.filter(BLUR); // optional, blur the edges of the mask
  msk.endDraw();
  boop.mask(msk.get());
  image(xray.get(),0,0);
  image(boop.get(),0,0);
}

void mouseMoved()
{
  redraw();
}


