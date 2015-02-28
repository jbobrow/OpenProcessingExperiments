
/**
 * Brightness Tracking 
 * by Golan Levin. 
 * 
 * Tracks the brightest pixel in a live video signal. 
 *
 *Switch off video output, trace brightest pixel added by Seamus Bradley
 */


import processing.video.*;

Capture video;

boolean bDisplayPointer;

 int brightestX = 0; // X-coordinate of the brightest video pixel
    int brightestY = 0; // Y-coordinate of the brightest video pixel

int startTime = 0;
int refreshTime = 20000;
int pointerTime = 0;
int pointerOff = 10;

void setup() {
  size(800, 600); // Change size to 320 x 240 if too slow at 640 x 480
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height, 30);
  noStroke();
  smooth();
  background(0,0,0);
  
}

void draw() {
  
  if (mousePressed == true){
  
  saveFrame("brightnessTracking-####.jpg");
}
 if(millis() - startTime > refreshTime){
fill(0,0,0, 128);
   rect(0,0,width,height);
    startTime = millis();
  }
  
  if(bDisplayPointer){
    fill(255,255,255, 10);
    ellipse(brightestX, brightestY, 2, 2);
    if(millis()-pointerTime > pointerOff){
      bDisplayPointer = false;
    }
  }
  

    
  if (video.available()) {
    video.read();
 //   image(video, 0, 0, width, height); // Draw the webcam video onto the screen
   
    float brightestValue = 0; // Brightness of the brightest video pixel
    // Search for the brightest pixel: For each row of pixels in the video image and
    // for each pixel in the yth row, compute each pixel's index in the video
    video.loadPixels();
    int index = 0;
    for (int y = 0; y < video.height; y++) {
      for (int x = 0; x < video.width; x++) {
        
         index = (video.width - x - 1) + y*video.width;
        // Get the color stored in the pixel
        int pixelValue = video.pixels[index];
        // Determine the brightness of the pixel
        float pixelBrightness = brightness(pixelValue);
        // If that value is brighter than any previous, then store the
        // brightness of that pixel, as well as its (x,y) location
        if (pixelBrightness > brightestValue) {
          brightestValue = pixelBrightness;
          brightestY = y;
          brightestX = x;
        }
      
        index++;
         
      }
    }
    // Draw a large, yellow circle at the brightest pixel
  fill(255,0,0);
  ellipse(brightestX, brightestY, 4, 4);
  }
   
}

/*
void keyPressed(){
  
  
    if(key =='u' || key == 'U'){
        fill(255, 0, 0, 128);
    ellipse(brightestX, brightestY, 4, 4);
    }else{
    if(key == 'i' || key == 'I'){
      fill (0, 255, 0, 128);
      ellipse(brightestX, brightestY, 4, 4);
    }else{
    if(key == 'o' || key == 'O'){
      fill(0, 0, 255, 128);
      ellipse(brightestX, brightestY, 4, 4);
    }else{
    if(key == 'p' || key == 'P'){
      fill(255);
      ellipse(brightestX, brightestY, 4, 4);
    }else{
    if(key == DELETE){
      fill(0);
      ellipse(brightestX, brightestY, 4, 4);
    }/*else{
      if(key == ENTER){
       fill(255,255,255, 50);
      ellipse(brightestX,brightestY, 2, 2);
        int lastbrightestX = brightestX;
        int lastbrightestY = brightestY;
        delay(200);
        fill(0);
        ellipse(lastbrightestX, lastbrightestY, 2, 2);
    }
    }
    }
    }
    }
*/

    


