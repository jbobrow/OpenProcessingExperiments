
/**
 * talleres CCE mariana carranza
 * Example 16: imagen-16
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

  numberPixels = myImage.width * myImage.height;

  //access to the pixels of the image
  myImage.loadPixels();
  for ( int i = 0; i < numberPixels; i++) {
    // access the  of each pixel - from 0 to 255
    float bi = brightness(myImage.pixels[i]);
    float bb = brightness(blendImage.pixels[i]);
    // choise the brightest image
    if(bi < bb){
      myImage.pixels[i] = blendImage.pixels[i];
    }
  }
  // draw the transformed pixels
  myImage.updatePixels();

  // draw the modified image on the screen
  image (myImage, 0, 0);
}


