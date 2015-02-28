
/**
 * Brightness Tracking 
 * by Golan Levin. 
 *
 * Tracks the brightest pixel in a live video signal. 
 */

int redX = 0;
int redY = 0;
float pixelRed;
float pixelBrightness;
import processing.video.*;
PImage img;  // Declare variable "a" of type PImage
Capture video;

void setup() {
  size(640, 480, P3D);
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height);
  video.start();   
  noStroke();
  smooth();
  img = loadImage("fly.png");  // Load the image into the program
}

void draw() {
  if (video.available()) {
    video.read();
    image(video, 0, 0, width, height); // Draw the webcam video onto the screen
    int brightestX = 0; // X-coordinate of the brightest video pixel
    int brightestY = 0; // Y-coordinate of the brightest video pixel
    float brightestValue = 0; // Brightness of the brightest video pixel
    // Search for the brightest pixel: For each row of pixels in the video image and
    // for each pixel in the yth row, compute each pixel's index in the video
    video.loadPixels();
    int index = 0;
    for (int y = 0; y < video.height; y++) {
      for (int x = 0; x < video.width; x++) {
        // Get the color stored in the pixel
        int pixelValue = video.pixels[index];
        // Determine the brightness of the pixel
        pixelBrightness = red(pixelValue);
        // If that value is brighter than any previous, then store the
        // brightness of that pixel, as well as its (x,y) location
        if (pixelBrightness > brightestValue) {
          brightestValue = pixelBrightness;
          brightestY = y;
          brightestX = x;
        }
        
          if (pixelBrightness > brightestValue) {
          brightestValue = pixelBrightness;
          brightestY = y;
          brightestX = x;
        }
        if(pixelRed > 80 && pixelRed < 90){
          redX = x;
          redY = y;
        }
        index++;
      }
    }println(pixelBrightness);
    stroke(3);   
    color c = get(mouseX, mouseY);//video.pixels[y*width+x];
    fill(c);
    ellipse(150, 200, 50, 50);
    println(hex(c));
    
    
    // Draw a large, yellow circle at the brightest pixel
    
    image(img,brightestX, brightestY, 75, 75);
    
    fill(255,0,0,128);
    ellipse(redX+50, redY+50, 75, 75);
  }
}


