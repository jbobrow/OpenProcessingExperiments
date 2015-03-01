
/*
 * Creative Coding
 * Week 3, 01 - using map() to map mouse co-ordinates to background colour 
 * by Indae Hwang
 * Copyright (c) 2014 Monash University
 *
 * This program allows you to change the background color.
 * Press and hold 'left mouse button' to change color.
 * 
 */

float hue;
float saturation;
float brightness;


void setup() {
  size(500, 500);
  colorMode(HSB, 255);
  // initialise the colour variables
  hue = 0;
  saturation = 0;
  brightness = 255;//0;
}


void draw() {
  background(hue, saturation, brightness);//brightness);

  if (mousePressed) {
    hue = map(mouseX, 0, width, 0, 255);
    saturation = map(mouseY, 0, height/2, 0, 255);
    brightness = map(mouseY, height/2, height, 255, 0);
    
    println("hue: "+hue+", saturation: "+saturation+", brightness: "+brightness);
    
  }
}



