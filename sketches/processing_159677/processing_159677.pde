
//unravel the code, wdka.nl
 
//a square image, replacing and rotating with a function


PImage img;  // Declare variable "a" of type PImage

void setup() {
  size(640, 360);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  
  //or load it from somewhere:
  
  //for this sketch to work it has to be a square of 80x80 pixels
  img = loadImage("http://contrech.home.xs4all.nl/examples/pattern.jpg");  // Load the image into the program
}

void draw() {

  drawImage(0, 0, 0);//numbers: place x - place y - rotation in degrees
  drawImage(1, 0, 90);
  drawImage(1, 1, 180);
  
}

void drawImage(int xC, int yC, float myAngle) {
  pushMatrix();
  translate(img.width/2 + 80*xC, img.height/2 + 80*yC );
  rotate(PI/2 * myAngle/90);
  image(img, -img.width/2, -img.height/2 );
  popMatrix();
}
