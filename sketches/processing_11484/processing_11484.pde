
/**
 * Pointillism
 * by Daniel Shiffman. 
 * 
 * Mouse horizontal location controls size of dots. 
 * Creates a simple pointillist effect using ellipses colored
 * according to pixels in an image. 
 * 
 * Updated 27 February 2010.
 */
 
PImage img;

int smallPoint = 3;
int largePoint;
int top, left;

void setup() {
  size(468, 263);
  frameRate(2000);
  img = loadImage("fall.jpg");
  //img = loadImage("sunflower.jpg");  // an alternative image
  noStroke();
  background(153,132,198);
  smooth();
  largePoint = min(width, height) / 10;
  // center the image on the screen
  left = (width - img.width) / 2;
  top = (height - img.height) / 2;
}

void draw() { 
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 128);
  rect(left + x, top + y, pointillize, pointillize);
 ellipse(left+x,top+y,pointillize,pointillize);
}

void keyPressed(){
//presiona tecla para borrar el Background
background(255);
}
void mouseClicked(){
//presiona tecla para borrar el Background
background(0);
}

