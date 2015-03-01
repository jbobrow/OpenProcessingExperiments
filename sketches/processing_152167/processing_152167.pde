
/*
 * This simple sketch changes the background colour based on movement of the mouse in x and y.
 * Notice how the map() function is used to map mouse location to colour,
 * in particular the relationship between horizontal and vertical movements and colour change.
 * Can you think of a better method to map mouse position to colour?
 * Modify the code to see how well your idea works.
 * 
 * Creative Coding
 * Week 3, 01 - using map() to map mouse co-ordinates to background colour 
 * by Indae Hwang
 * Copyright (c) 2014 Monash University
 * This program allows you to change the background color.
 * Press and hold 'left mouse button' to change color.
 */

float red;
float green;
float blue;

void setup() {
 size(500, 500); // initialise the colour variables
 red = 0;
 blue = 0;
 green = 0;
}

void draw() {
 background(red, green, blue);
 if (mousePressed) {
  //red = map(mouseX, 0, width, 0, 255);
  //green = map(mouseY, 0, height, 0, 255);
  //blue = map(mouseX+mouseY, 0, width+height, 255, 0);
  red = lerp(0,255, (float)mouseX/width );
  green =lerp(0,255,(float)mouseY/height );
  blue = lerp(255,0,((float)mouseX/width)*((float)mouseY/height));
  println("red: "+red+", green: "+green+", blue: "+blue);
 }
}

