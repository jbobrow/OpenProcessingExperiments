
/*
 * Creative Coding
 * Week 4, 05 - noise-based spinning top
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch is a different cut of the spinning top example from week 3
 * It uses the noise function to change the direction of the path
 *
 */

// the two variables below shift the position in the noise field, 
// allowing the value returned by the noise() function to change.
float noiseXoff = 0;
float noiseYoff = 0;


void setup(){
  size(500,500);
  background(0);
}


void draw() {
  
  // add a small increment to the offsets
  // (chnage these numbers and look at the visula results)
  noiseXoff += 0.0039;
  noiseYoff += 0.0045;
  
  // location of the ellipse
  float x =width*noise(noiseYoff*0.5);
  float y = height*noise(noiseXoff*0.5);
  stroke(255,0,0);
  strokeWeight(.01)
  noFill();
  ellipse(x, y, 2, 2);
  
  // angle changes with time
  float angle = radians(frameCount);
  
  // radius changes with noise
  float radius = 300 * noise(noiseXoff);
  
  // calculate positions at the rotation point
  float rotateX =  x + radius * cos(angle);
  float rotateY = y + radius * sin(angle);
  
  

 
  if (rotateX > 200){

    stroke(220, 220, 0);
    strokeWeight(.2);
    line(x, y, rotateX, rotateY);
  }
  else{
    stroke(255,255,255);
    strokeWeight(.2);
    line(x, y, 1.5*rotateX, 1.5*rotateY);
  }
  
}
