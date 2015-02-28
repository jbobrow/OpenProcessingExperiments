
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 16-14: Overall motion

import processing.video.*;

// Variable for capture device
Capture video;
// Previous Frame
PImage prevFrame;

// How different must a pixel be to be a "motion" pixel
float threshold = 50;
float h;
int e = 1;
int difficulty = 40;
void setup() {
  size(640,480);
  // Using the default capture device
  video = new Capture(this, width, height, 15);
  // Create an empty image the same size as the video
  prevFrame = createImage(video.width,video.height,RGB);
  video.start ();

}

void draw() {
  background(0);
  
  // You don't need to display it to analyze it!
  image(video,0,0);
  
  // Capture video
  if (video.available()) {
    // Save previous frame for motion detection!!
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
    // Step 2, what is the current color
    color current = video.pixels[i];
    
    // Step 3, what is the previous color
    color previous = prevFrame.pixels[i];
    
    // Step 4, compare colors (previous vs. current)
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
  
  // Draw a circle based on average motion
  smooth();
  noStroke();
  fill(0);
  float r = avgMotion;

 if (avgMotion >difficulty){
   h--;}
   if (h<-300){
     h=0;
     e++;
     difficulty+=5;
   }
   fill(0);
rect (20,400,20,-300);
   fill(255,255);
rect (20,400, 20,h);
text (e,25,90);
text ("motion =",25,460);
text (r,72,460);
text ("difficulty =",25,440);
text (difficulty,80,440);
line (10,20,30,40);
 
  }




