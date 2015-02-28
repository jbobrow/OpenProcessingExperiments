
import processing.video.*;
Capture cam;
PImage [] savedImages ;
int imgIndex=0;

float[][] kernel = { 
  { 
    13, -21, 4
  }
  , 
  { 
    -5, 15, -1
  }
  , 
  { 
    -2, 9, -12
  }
};


void setup() {
  size(700, 500);
  // setup camera
  cam = new Capture(this, 700, 500);
  savedImages = new PImage[4];
}

void draw() {
  background(255);
  if (savedImages[0] != null) {
    image(savedImages[0], 0, 0);
  }
  for (int i = 0; i<savedImages.length;i++) {
    if (savedImages[i] != null) {
  
      translate(width, 0);
      scale(-1,1);
        
        blend(savedImages[i], 0, 0, width, height, 0, 0, width, height, LIGHTEST);
        tint(#FF0000);

        //image(savedImages[i], 0, 0);

        // filter(THRESHOLD);   
        // filter(BLUR,2);
      
    }
  }
} 

PImage getProcessImage() {
  cam.loadPixels();
  // Create an opaque image of the same size as the original
  PImage edgeImg = createImage(cam.width, cam.height, RGB);
  // Loop through every pixel in the image.
  for (int y = 1; y < cam.height-1; y++) { // Skip top and bottom edges
    for (int x = 1; x < cam.width-1; x++) { // Skip left and right edges
      float sum = 0; // Kernel sum for this pixel
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          // Calculate the adjacent pixel for this kernel point
          int pos = (y + ky)*cam.width + (x + kx);
          // Image is grayscale, red/green/blue are identical
          float val = red(cam.pixels[pos]);
          // Multiply adjacent pixels based on the kernel values
          sum += kernel[ky+1][kx+1] * val;
        }
      }
      // For this pixel in the new image, set the gray value
      // based on the sum from the kernel
      edgeImg.pixels[y*cam.width + x] = color(sum);
    }
  }
  // State that there are changes to edgeImg.pixels[]
  
  edgeImg.updatePixels();
  edgeImg.filter(THRESHOLD);   
  edgeImg.filter(BLUR, 2);
  return edgeImg;

}

void mousePressed () {

  if (cam.available() == true) {
    cam.read();
    savedImages[imgIndex] = getProcessImage();
    imgIndex = (imgIndex+1)%3;
    tint(#FF0000);
    
  }
}


