
/**
 * Brightness Thresholding 
 * by Golan Levin. 
 * 
 * Determines whether a test location (such as the cursor) is contained within
 * the silhouette of a dark object. 
 */


import processing.video.*;

color black = color(0);
color white = color(255);
color red = color(255,0,0);
color green = color(0,255,0);
int numPixels;
Capture video;
float x,y;

void setup() {
  size(640, 480); // Change size to 320 x 240 if too slow at 640 x 480
  strokeWeight(5);
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height, 24);
  numPixels = video.width * video.height;
  noCursor();
  smooth();
}

void draw() {
  if (video.available()) {
    video.read();
    video.loadPixels();
    int threshold = 75; // Set the threshold value
    float pixelBrightness; // Declare variable to store a pixel's color
    // Turn each pixel in the video frame black or white depending on its brightness
    loadPixels();
    for (int i = 0; i < numPixels; i++) {
      pixelBrightness = brightness(video.pixels[i]);
      if (pixelBrightness < threshold) { // If the pixel is brighter than the
        pixels[i] = black; // threshold value, make it white
      } else { // Otherwise,
        pixels[i] = red; // make it black
      }
  
    }
    updatePixels();
    // Test a location to see where it is contained. Fetch the pixel at the test
    // location (the cursor), and compute its brightness
    int testValue = get(mouseX, mouseY);
    float testBrightness = brightness(testValue);
    if (testBrightness > threshold) { // If the test location is brighter than
      fill(black); // the threshold set the fill to black
    } 
    
 
  }
}

