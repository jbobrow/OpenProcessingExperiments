
/**
 * Based on Pixelate by Hernando Barragan. 
 * 
 * Using the camera instead of loading a movie, display the camera signal 
 * using rectangles as pixels by reading the values stored 
 * in the current cameras frame pixels array. 
 */


import processing.video.*;

int numPixels;
int blockSize = 5 ;
Capture cam;
color myMovieColors[];

void setup() {
  size(640, 480, P2D);
  noStroke();
  background(0);
  cam = new Capture(this, 640, 480);
  numPixels = width / blockSize;
  myMovieColors = new color[numPixels * numPixels];
}

// Read new values from movie
void captureEvent(Capture m) {
  m.read();
  m.loadPixels();
  
  for (int j = 0; j < numPixels; j++) {
    for (int i = 0; i < numPixels; i++) {
      myMovieColors[j*numPixels + i] = m.get(i*blockSize, j*blockSize);
    }
  }
}

// Display values from movie
void draw()  {
  
 //   if (cam.available() == true) {
 //   cam.read();
 //   image(cam, 0, 0);
 //   }
  
  for (int j = 0; j < numPixels; j++) {
    for (int i = 0; i < numPixels; i++) {
      fill(myMovieColors[j*numPixels + i]);
      rect(i*blockSize, j*blockSize, blockSize-1, blockSize-1);
    }
  }
}

