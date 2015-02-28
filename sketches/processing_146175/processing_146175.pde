
/**
 * talleres CCE mariana carranza
 * Example 01: imagen-01
 * by mariana carranza.   
 */

PImage myImage;
int numberPixels;

float bright = 100;

void setup() {
  //frame size = image size*2 
  size (640, 480, P2D);
  smooth();

  //load image
  myImage = loadImage ("rio.jpg");
  
  image (myImage, 0, 0);

  numberPixels = myImage.width * myImage.height;

  //access to the pixels of the image
  myImage.loadPixels();
  for ( int i = 0; i < numberPixels; i++) {
    // access the  of each pixel - from 0 to 255
    float r = red(myImage.pixels[i]);
    float g = green(myImage.pixels[i]);
    float b = blue(myImage.pixels[i]);

    myImage.pixels[i] = color(r+bright, g+bright, b+bright);
  }
  // draw the transformed pixels
  myImage.updatePixels();

  // draw the modified image on the screen
  image (myImage, myImage.width, 0);
}


