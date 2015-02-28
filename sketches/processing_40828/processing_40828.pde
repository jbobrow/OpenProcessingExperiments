
/* This sketch measures overall motion to determine if the use can "bust out" from behind a concrete
wall. Change the threshold value to make it easier(or harder) to bust out.

Title: Motion Detection
Excercise: Ex.16-7 in Learning Processing
Date: October 5, 2011
By: David Oppenheim
Attribution: based on Example 16-14 in Learning Processing by Daniel Shiffman

*/


import processing.video.*;

PImage backgroundImage; // Variable for background image

// Variable for capture device
Capture video;
// Previous Frame
PImage prevFrame;

// How different must a pixel be to be a "motion" pixel; controls when the live video is displayed (instead of the wall)
float threshold = 40;

void setup() {
  size(480,640);
  // Load background image of wall
   backgroundImage = loadImage("concreteWall.jpg"); 
  // Using the default capture device
  video = new Capture(this, width, height, 15);
  // Create an empty image the same size as the video
  prevFrame = createImage(video.width,video.height,RGB);
}

void draw() {
  background(255);
  
  // Display background image
  image(backgroundImage,0,0);
  
  // Capture video
  if (video.available()) {
    // Save previous frame for motion detection
    prevFrame.copy(video,0,0,video.width,video.height,0,0,video.width,video.height);
    prevFrame.updatePixels();
    video.read();
  }
  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();
  
  // Begin loop to walk through every pixel
  // Start with a total of 0
  float totalMotion = 0;
  
  // Sum the brightness of each pixel
  for (int i = 0; i < video.pixels.length; i ++ ) {
    // Determine current color
    color current = video.pixels[i];
    
    // Determine previous color
    color previous = prevFrame.pixels[i];
    
    // Compare previous vs. current color
    float r1 = red(current); 
    float g1 = green(current);
    float b1 = blue(current);
    float r2 = red(previous); 
    float g2 = green(previous);
    float b2 = blue(previous);
    
    // Motion for an individual pixel is the difference between the previous color and current color.
    float diff = dist(r1,g1,b1,r2,g2,b2);
    // totalMotion is the sum of all color differences. 
    totalMotion += diff; 
  }
  
   // averageMotion is total motion divided by the number of pixels analyzed.
  float avgMotion = totalMotion / video.pixels.length; 
  
  // Display video image if motion gets above threshold, otherwise, display The Wall
  
  if (avgMotion > threshold) { 
   image(video,0,0);
  } else {
    image(backgroundImage,0,0);
 }
}


