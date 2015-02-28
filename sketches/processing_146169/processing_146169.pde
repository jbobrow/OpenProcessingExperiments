
/**
 * talleres CCE mariana carranza
 * Example 01: imagen-01
 * by mariana carranza.   
 */

PImage myImage;
int numberPixels;

void setup() {

  //load image
  myImage = loadImage ("frida.jpg");

  //frame size = image size
  size (myImage.width, myImage.height);
  smooth();
  numberPixels = myImage.width* myImage.height;

  //access to the pixels of the image
  myImage.loadPixels();
  for ( int i = 0; i < numberPixels; i++) {
    // access the  of each pixel - from 0 to 255
    color myPixel =  myImage.pixels[i];
    float brigthVal = brightness (myPixel);

    // if brightness more than 200: red pixel
    if ( brigthVal > 200) {
      myImage.pixels[i] = color (255, 0, 0);
    }
    // if brightness less than 200: green pixel
    else {
      myImage.pixels[i] = color (0, 255, 0);
    }
  }
  // draw the transformed pixels
  myImage.updatePixels();

  // draw the modified image on the screen
  image (myImage, 0, 0);
}


