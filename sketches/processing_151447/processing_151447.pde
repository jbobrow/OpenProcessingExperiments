
/*
 * Creative Coding
 * Week 3, 01 - using map() to map mouse co-ordinates to background colour 
 * by Indae Hwang
 * Copyright (c) 2014 Monash University
 *
 * This program allows you to change the background color.
 * Press and hold 'left mouse button' to change color.
 * by pb as part of week 301
 */

float red;
float green;
float blue;

 //red=255.0/width*mouseX
 //green=255.0/width*mouseX
 //blue=255.0/width*mouseX
   
void setup() {
  size(500, 500);

  // initialise the colour variables
  red = 0;
  blue = 0;
  green = 0;
}


void draw() {
  background(red, green, blue);

  if (mousePressed) {
    //red = map(mouseX, 0, width, 0, 255);
    //green = map(mouseY, 0, height, 0, 255);
   // blue = map(mouseX+mouseY, 0, width+height, 255, 0);
    
    red=255.0/width*mouseX;
    green=255.0/height*mouseY;
    blue=255.0/width+height*mouseY+mouseY;






    
    
    println("red: "+red+", green: "+green+", blue: "+blue);
    
  }
}
