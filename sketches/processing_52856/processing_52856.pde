
/*
  Ka Kit Cheong
  Collage machine
  02/17/2012
*/

// objects
PImage img;

// variables
int xpos;

void setup(){
  size(1024,331);
  img = loadImage("body_motion.jpg");
}

void draw(){
  background(0);
  
  PGraphics maskImage;
  maskImage = createGraphics(img.width, img.height, JAVA2D);
  maskImage.beginDraw();
  maskImage.fill(200);
  maskImage.noStroke();
  maskImage.rect(xpos, 0, 130, 331);
  maskImage.endDraw();
  
  xpos+=2;
  
  if (xpos>width){
    xpos = -130;
  }
  
  PImage imgCopy = img; 
  imgCopy.mask(maskImage);
  image(imgCopy, 0, 0);
}

