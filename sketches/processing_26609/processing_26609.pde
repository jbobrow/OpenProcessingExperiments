
// Created with "Processing":http://processing.org/
// Draws a Lissajous figures
// 2 April 2011
// http://www.rupert.id.au/tutorials/processing/examples.php

int screen_width = 400;
int screen_height = 400;

/* Scale image and reduce by 5 pixels to remove from edge of screen */
int AX = (screen_width / 2) - 5;
int BX = (screen_height / 2) - 5;

float a = 1;
float b = 3;
float x1;
float y1;
float x2;
float y2;

int counter = 0;
int saveCounter = 0;
String file_name;

void setup(){
  smooth();
  fill(255);
  strokeWeight(1);   
  size(400, 400);
  }

// Based on Microworlds LOGO code from http://www.mathcats.com/gallery/15wordcontest.html
// repeat 360 [setxy (sin(2 * repcount)) * 150 (sin(3 * repcount)) * 150] 

void draw(){
  fill(#000000);
  
  // Find 2 points and draw a line between them
  x1 = (sin(a * counter) * AX) + screen_width / 2;
  y1 = (sin(b * counter) * BX) + screen_height / 2;
  
  counter = counter + 1;
  x2 = (sin(a * counter) * AX) + screen_width / 2;
  y2 = (sin(b * counter) * BX) + screen_height / 2;
   
  line(x1,y1,x2,y2);
    
  saveCounter = saveCounter + 1;
  if (saveCounter == 365) {
    String file_name = "Lissajou_a=" + str(a) + "_b=" + str(b);
    // save(file_name);
    noLoop();
  }
}                               
