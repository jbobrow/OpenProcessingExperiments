
/*
 * Creative Coding
 * Week 3, 01 - using map() to map mouse co-ordinates to background colour 
 * by Indae Hwang - adapted by Jackie Palman
 * Copyright (c) 2014 Monash University
 *
 * This program allows you to changes the background color in response to mouse position.
 * 
 * 
 */

float h;
float s;
float b;


void setup() {
  size(500, 500);

colorMode(HSB, 360,100,100);
  // initialise the colour variables
  h = 0;
  s = 0;
  b = 0;
}


void draw() {
  background(h, s, b);

 // if (mousePressed) {
    h = map(mouseX, 0, width, 0, 360);
    s = map(mouseY, height, 0, 0, 100);
    b = map(mouseX+mouseY, 0, width+height, 100, 0);
    
    //println("hue: "+h+", sat: "+s+", brill: "+b);
    
 // }
}

