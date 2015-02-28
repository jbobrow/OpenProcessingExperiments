
PImage niceImage;
PImage maskImage;
PImage img;
PImage glass;
PGraphics graphicalMask;
int iw, ih;
int dw, dh;

void setup()
{
  size(400, 600);
  niceImage = loadImage("pic5paws.jpg");
  img = loadImage("pic5.jpg");
  glass = loadImage("brush.png");
  iw = niceImage.width;
  ih = niceImage.height;
  dw = width - iw;
  dh = height - ih;
  graphicalMask = createGraphics(iw, ih, JAVA2D);
}

void draw()
{
  background(img);
  
  graphicalMask.beginDraw();
  // Erase graphics
  graphicalMask.background(0);
  // Draw the mask
  int x = mouseX - dw/2;
  int y = mouseY - dh/2;
  graphicalMask.fill(255);
  graphicalMask.noStroke();
  graphicalMask.ellipse(x, y, 100, 100);
  graphicalMask.stroke(128);
  graphicalMask.strokeWeight(5);

  graphicalMask.endDraw();

  // Copy the original image (kept as reference)
  maskImage = niceImage.get();
  // Apply the mask
  maskImage.mask(graphicalMask);
  // Display the result
  image(maskImage, dw/2, dh/2);
  
  image(glass,mouseX-30,mouseY-80);

}



