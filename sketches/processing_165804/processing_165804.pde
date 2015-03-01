
/**
 * Pointillism
 * by Daniel Shiffman.
 *
 * Mouse horizontal location controls size of dots.
 * Creates a simple pointillist effect using ellipses colored
 * according to pixels in an image.
 *
 *Thanks to  Georg Fischer (aka Snorpey)  for the original image
 */


/* @pjs preload="lincoln-glitch.jpg"; */

PImage img;
int smallPoint, largePoint;

void setup() {
  size(1046, 700);
  img = loadImage("Sunset2.jpg");
  int strokeWeightVal = 20;
  largePoint = 80;
  imageMode(CENTER);
  strokeWeight(strokeWeightVal);
  background(255);
  frameRate(50);
}

void draw() {
  color pix = img.get(mouseX, mouseY);
  stroke(pix, 150);
  if (mousePressed)
  {
    line(mouseX, mouseY, mouseX + random(-50, 50), mouseY + random(-50, 50));
  }
}

void keyPressed()
{
  if (key=='s')
  {
    saveImage();
  }
  if (key=='z')
  {
    background(255);
  }
  if (key=='f')
  {
    background(img);
  }
  if (key=='b')
  {
    filter(BLUR);
  }
  if (key=='i')
  {
    filter(INVERT);
  }
}

void saveImage() {
  String fileName = timeStamp()+".tiff";
  PImage imageSave = get(0, 0, width, height);
  imageSave.save(fileName);
}

String timeStamp() {
  String timestamp = year()+"_"+month()+"_"+day()+"_"+minute()+"_"+second()+"_"+millis();
  return timestamp;
}



