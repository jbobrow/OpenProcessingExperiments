
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
  background(#2A951A);
}


void draw() {
  
  // add a small increment to the offsets
  // (chnage these numbers and look at the visula results)
  noiseXoff += 0.005;
  noiseYoff += 0.003;
  
  // location of the ellipse
  float x = width*noise(noiseYoff*0.8);
  float y = height*noise(noiseXoff*0.3);
  
  ellipse(x, y, 3, 8);
  
  // angle changes with time
  float angle = radians(frameCount);
  
  // radius changes with noise
  float radius = 200 * noise(noiseXoff);
  
  // calculate positions at the rotation point
  float rotateX = x + radius * cos(angle);
  float rotateY = y + radius * sin(angle);
  
  stroke(155,25);
  line(x, y, rotateX, rotateY);
  ellipse(rotateX, rotateY, 2, 2);
  
}


