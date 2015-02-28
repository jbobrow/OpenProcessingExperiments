

import processing.video.*;

boolean sketchFullScreen() {
  return true;
}  

color black = color(0);
color white = color(255);
int numPixels, threshold = 255;
int duration = 28000; // Aqui la duracion en ms
Capture video;

void setup() {
  size(1280, 800, P2D); // Change size to 320 x 240 if too slow at 640 x 480
 
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height);
  video.start();  
  numPixels = video.width * video.height;
  noCursor();
  smooth();
}

void draw() {
  
  int m = millis();
  float threshold = map(m, 0, duration, 255, 0);
  
//  println(m);
//  println(threshold);
  
  if (m > 0) {
  
  if (video.available()) {
    video.read();
    video.loadPixels();
    //int threshold; // 20 + int(random(200)); // Set the threshold value
    float pixelBrightness; // Declare variable to store a pixel's color
    // Turn each pixel in the video frame black or white depending on its brightness
    loadPixels();
    for (int i = 0; i < numPixels; i++) {
      pixelBrightness = brightness(video.pixels[i]);
      if (pixelBrightness > threshold) { // If the pixel is brighter than the
        pixels[i] = white; // threshold value, make it white
      
      } 
      else { // Otherwise,
        pixels[i] = black; // make it black
      }
    }
    updatePixels();
    
  };
  } ;
 
 
 
 if (threshold < 0) { // ENDING, manejar el threshold en relacion a la variable m, y mapearla
    
   // noLoop();
    background(255);
    fill(0);

 
  };
  
}
  


