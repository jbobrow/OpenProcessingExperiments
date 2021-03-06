
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
float colour;


void setup() {
  size(500, 500);
  background(255, 255, 255);
  

  // initialise the colour variables
  red = 0;
  blue = 0;
  green = 0;
}


void draw() {
 

  if (mousePressed) {
     
    fill(red,green,blue);
    noStroke(); 
    ellipse(mouseX,mouseY,10,10);
            
    red = map(mouseX, 0, width, 0, 255);
    green = map(mouseY, 0, height, 0, 255);
    blue = map(mouseX+mouseY, 0, width+height, 255, 0);
    
    println("red: "+red+", green: "+green+", blue: "+blue);
    
  }
  
   // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("yourName.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(255);
  }
}



