
/*

 SlitImage
 by James Patrick Gordon
 
 Based on 'Simple Real-Time Slit-Scan Program by Golan Levin
 
 */


PImage img;

int imgSliceX;
int drawPositionX;
int imgSliceY;
int drawPositionY;


void setup() {
  
  
  // Uses the default video input, see the reference if this causes an error
  img = loadImage("Sunset.jpg");
  size(img.width, img.height);
  imgSliceX = img.width / 2;
  imgSliceY = img.height / 2;
  drawPositionX = width - 1;
  drawPositionY = height - 1;
  background(0);
}


void draw() {
  
    img.loadPixels();
    
    // Copy a column of pixels from the middle of the video 
    // To a location moving slowly across the canvas.
    loadPixels();
    for (int y = 0; y < img.height; y++){
      int setPixelIndex = y*width + drawPositionX;
      int getPixelIndex = y*img.width  + imgSliceX;
      pixels[setPixelIndex] = img.pixels[getPixelIndex];
    }
    for (int x = 0; x < img.width; x++){
      int setPixelIndex = x*height + drawPositionY;
      int getPixelIndex = x*img.height + imgSliceY;
      pixels[setPixelIndex] = img.pixels[getPixelIndex];
    }
    updatePixels();
    
    drawPositionX--;
    drawPositionY--;
    // Wrap the position back to the beginning if necessary.
    if (drawPositionX < 0) {
      drawPositionX = width - 1;
    }
    if (drawPositionY < 0){
      drawPositionY = height - 1;
    }
  }


