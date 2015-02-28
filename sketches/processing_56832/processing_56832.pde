
// March 2012
// http://www.modcam.com
//
// This work is licensed under a Creative Commons 3.0 License.
// (Attribution - NonCommerical - ShareAlike)
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// 

import processing.video.*;
MovieMaker mm;
float cx, cy, rectWidth, colr, fillBrightness, sat, inc, frame, a, breathRadius;
boolean animating, recording, reflect;

void setup() {
  size(640,480);
  smooth();
  cx = width/2;
  cy = height/2;
  noFill();
  colorMode(HSB);
  rectMode(CENTER);
  reflect = true;
  breathRadius = 10;
}

void draw() {
    background(0);
    
    // Fluctuate the starting fillBrightnessness
    fillBrightness = sin(frame*.03) * cos(frame*.06)*50 + 20;
    
    // Starting color saturation amount
    sat = 250;
    
    // Use mouse position and frame count to determine starting color
    colr = mouseX % 255 +  sin(frame*.06)*100;
    
    //Begin with a rectangle larger than the viewport
    rectWidth =  width + 100;
    
    // Initialize angle of rotation
    a = 0;
    
    // Keep iterating until the rectangle shrinks to 1px wide
    while (rectWidth > 1) {
      // Begin rectangle transformations
      pushMatrix();
        // Move starting point to center of viewport
        translate(cx,cy);
        
        // Angle a is in degrees, so convert to radians
        rotate(radians(a));
        
        // Map mouse Y coordinate to a value between 94% and 99% for shrinkage amount
        rectWidth *= map(mouseY, 0, height, .94, .99);
        
        // Make stroke color brighter than fill color to accentuate lines
        float strokeBrightness = fillBrightness * 1.6;
        stroke (colr,sat,strokeBrightness, 255);
        
        // Fill rectangle with solid color
        fill(colr,sat,fillBrightness);
        
        // Add the rectangle width with a fluctuating "breathing" movement
        float finalRectWidth = rectWidth + sin(frame*.1) * breathRadius;
        rect(0, 0, finalRectWidth, finalRectWidth);
        
        // Create & rotate another rectangle at the opposite angle
        if (reflect) {
          rotate(radians(-a*2));
          rect(0,0,finalRectWidth, finalRectWidth);
        }
      popMatrix();
      
      if (animating) 
        inc = frame*.05; 
      else
        inc = mouseX * .1;
      
      
      // Increase the angle of rotation by the increment amount
      a += inc;
      
      // Create a gradient by shifting color as iteration continues
      colr += .8;
      
      // Saturation decreases to make the color white
      sat--;
      
      // Brightness inceases as iteration continues
      fillBrightness++;
    }
  
  // Keep track of frame number for animating things
  frame++;
  
  // If the applet is currently recording the sequence to a movie file, then add a frame
  if (recording) mm.addFrame();
}

void mouseClicked(){
  reflect = !reflect;
}

void keyPressed() {
  if ( keyCode == ESC ) key = 0;
  switch (key) {
    case ('a'):case('A'):
      animating = !animating;
      break;
    case ('s'):case ('S'):
      saveFrame();
      break;
    case('r'):case('R'):
      if (recording) {
        mm.finish();
        recording = false;
      } else {
        mm = new MovieMaker(this, width, height, "coriolis-" + frame + ".mov", 15, MovieMaker.ANIMATION, MovieMaker.BEST);
        recording = true;
      }        
  }

}


