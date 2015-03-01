
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

float red;
float green;
float blue;



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
    red = lerp(0,255, (float)mouseX/width );
    green =lerp(0,255,(float)mouseY/height );
    blue = lerp(255,0,((float)mouseX/width)*((float)mouseY/height));
    
    println("red: "+red+", green: "+green+", blue: "+blue);
    
  }
}

