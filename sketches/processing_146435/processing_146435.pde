
/**
 * talleres CCE mariana carranza
 * Example 18: imagen-18
 * by mariana carranza.   
 */

PImage myImage;

void setup() {
  //frame size = image size
  size (320, 480, P2D);
  smooth();

  //load image
  myImage  = loadImage ("Spindel.jpg");

  // just a line :)
  // find filter in references
  // try THRESHOLD, GRAY, INVERT, POSTERIZE, BLUR, OPAQUE, ERODE, or DILATE
  myImage.filter(THRESHOLD, .6);

  // draw the modified image on the screen
  image (myImage, 0, 0);
}


