
//Ali Ghaleh - 3208392 - Interactive Media Final Project-  Semester 1 - 2010

import processing.video.*;
int numPixels;
int[] previousFrame;
Capture video;

void setup() {
  size(400, 300); // I originally wanted to put 640x480, but it was too hard to render and the result was too jerky.
  noStroke();  
  video = new Capture(this, width, height, 30);
  numPixels = video.width * video.height;
  previousFrame = new int[numPixels];
}  

void draw() {  //This is the part that creats the white noise in background. 2 sets of circles that randomly located within the window size. 1000 of white circles and 2000 of black ones.
  fill (255,255,255,0);
  rect (0,0,400,300);
  for(int j=0; j<1000; j=j+1) {
    float xb=random (400);
    float yb=random (300);
    ellipse(xb,yb,1,1);
    fill(255);
  }
  for(int k=0; k<2000; k=k+1) { // 2000 black circles
    float xk= random(400);
    float yk =random(300);
    ellipse(xk,yk,1,1);
    fill(0);
  }

  if (video.available()) {
      video.read(); 
      video.loadPixels();
      int movementSum = 0;
      loadPixels(); 
      for (int i = 0; i < numPixels; i++) { //This is basically the motion detection part that I haven't changed much. I used the original engine that was availbale on Shiffman's book.
        color currColor = video.pixels[i];
        color prevColor = previousFrame[i];
        int currR = (currColor >> 16) & 0xFF; // Like red(), but faster (see p. 673)
        int currG = (currColor >> 8) & 0xFF;
        int currB = currColor & 0xFF;
        int prevR = (prevColor >> 16) & 0xFF;
        int prevG = (prevColor >> 8) & 0xFF;
        int prevB = prevColor & 0xFF;
        int diffR = abs(currR - prevR);
        int diffG = abs(currG - prevG);
        int diffB = abs(currB - prevB);

        movementSum += diffR + diffG + diffB;
        pixels[i] = 0xff000000 | (diffR << 16) | (diffG << 8) | diffB;


        // Here's what I replace the static pixels with background (white noise).
        // There's 3 levels of difference detection with different tint and threshold.
        // I tried many different option and this was the closest to what I was originally planned. 
        if ((diffR+diffG+diffB) <=10){ 
        pixels[i] = color(255,0);
                tint (100);
          }
        if ((diffR+diffG+diffB) <=30){
        pixels[i] = color(255,50);
                tint (50);
          }
        if ((diffR+diffG+diffB) <=50){
        pixels[i] = color(255,75);
                tint (10);
          }
          
        previousFrame[i] = currColor;
     }
    
    if (movementSum > 0) {
      updatePixels();
    }
  }
}

