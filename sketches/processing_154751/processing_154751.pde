
/**
 * Rebel Pixels
 *
 * By Juan Sebastian Robles Jimenez
 *
 * What happens when some pixels from an image want to wander
 * a bit?
 *
 * The image used is  'Ill Give You All I Can...'
 * by Brandon Warren
 * https://www.flickr.com/photos/92694860@N00/4164759025
 * Licensed unde the Creative Commons Licence 2.0
 * https://creativecommons.org/licenses/by-nc/2.0/deed.es
 * found on flicrcc
 *
 * 's' Saves the actual frame.
 * 
*/



PImage img;
color imgPixels[];
int pixelX[];
int pixelY[];
int nPixels = 500;
int i = 0;

void setup()
{
  img = loadImage("img1.jpg");
  img.loadPixels();
  size(500, 348);
  imgPixels = new color[nPixels]; 
  pixelX = new color[nPixels];
  pixelY = new color[nPixels];
}

void draw()
{
  background(0);
  image(img, 0, 0);
  addPixel();
  movePixels();
  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("new_img_" + frameCount + ".jpg");
  }
}

// Adds a pixel from a random position to the containers
// it will cicle
void addPixel()
{
  if (i < nPixels) {
    pixelX[i] = (int)random(0, width);
    pixelY[i] = (int)random(0, height);
    imgPixels[i] = img.get(pixelX[i], pixelY[i]);
    i = (i + 1) % nPixels;
  }
}

// Draws and update the position of the current pixels
void movePixels()
{
  //img.loadPixels();
  for (int j = 0; j < i; ++j) {
    img.set(pixelX[j], pixelY[j], imgPixels[j]);
    pixelX[j] = constrain(pixelX[j] + (int)(random(-2, 2)), 0, width);
    pixelY[j] = constrain(pixelY[j] + (int)(random(-2, 2)), 0, height);
  }
  img.updatePixels();
}

