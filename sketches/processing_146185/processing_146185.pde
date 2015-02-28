
/**
 * talleres CCE mariana carranza
 * Example 17: imagen-17
 * by mariana carranza.   
 */

PImage myImage, blendImage;
int numberPixels;

float contr = 8;

void setup() {
  //frame size = image size
  size (320, 480, P2D);
  smooth();

  //load image
  myImage = loadImage ("rio.jpg");
  blendImage = loadImage ("Spindel.jpg");

  // just a line :)
  // find blend in references
  // try BLEND, ADD, SUBTRACT, DARKEST, LIGHTEST, DIFFERENCE, EXCLUSION and so on
  blendImage.blend(myImage, 0, 0, width, height, 0, 0, width, height, LIGHTEST);

  // draw the modified image on the screen
  image (blendImage, 0, 0);
}


