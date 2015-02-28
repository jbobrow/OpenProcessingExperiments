
//*******************************************************************************
// Project: CLOCK
// By: Carlyn Maw
// Date: June 22 2003 updated January 2014
// Ver: 1.1
// MAKE SURE THAT THESE FILES ARE IN YOUR DATA DIRECTORY: fountain.jpg 
//*******************************************************************************

// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="fountain.jpg"; */

PImage img;  // Declare variable "a" of type PImage

int offset, lastsec, y, mo, d, h, m, s, ms; //added ones for bigger time periods
float lineY=0, lineMO=6, lineD=13, lineH=25, lineM=50, lineS=100, lineMS=200;

void setup() {
  size(200, 200);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("fountain.jpg");  // Load the image into the program  
  img.loadPixels();

  offset=0; // initialize the offset variable. used for calibrating the milliseconds.
}

void draw() {
  //***************************************************************
  // THE CLOCK 
  //***************************************************************
  ms=(millis()-offset)%1000; // Milliseconds
  h=hour(); // Hours
  m=minute(); // Minutes
  s=second(); // Seconds
  d=day();//Day
  mo=month(); //Month
  y=year(); // Year
  // if the offset has not yet been set. (this is a 'do once' routine).
  if (offset==0) {
    // if the second has just changed ...
    if (lastsec!=s) {
      // .. than figure out the 'millisecond' offset (how many 'ms' have passed before the 'second' changed).
      offset=millis();
    }
  }
  //***************************************************************
  // YOUR CODE GOES BELOW ... (use the ms,h,m,s variables in your work)
  //***************************************************************

  // Displays the image at its actual size at point (0,0)
  image(img, 0, 0);
  // Displays the image at point (0, height/2) at half of its size
  //get the line
  lineS = 100 + 99*s/60;
  lineM = 50 + 49*m/60; 
  lineH = 25 + 24*h/24; 
  lineD = 13 + 12*d/31;
  lineMO = 6 + 5*mo/12;
  lineY = 0 + 5*y/3000; 

  //second stripes
  //start a series that starts with 0 and is the width of stage
  for (int i=0; i<width; i++) { 
    //create a color object and get the color of the pixel in the i positions (x) of the current line (y)
    color c = get(i, int(lineS)); 
    //set the drawing color to be that color
    stroke(c); 
    //draw a verticle line from the starting point of the section to the bottom of the section
    line(i, 100, i, 199);
  } 
  //minute stripes
  for (int i=0; i<width; i++) { 
    color c = get(i, int(lineM)); 
    stroke(c); 
    line(i, 50, i, 99);
  } 
  //hour stripes
  for (int i=0; i<width; i++) { 
    color c = get(i, int(lineH)); 
    stroke(c); 
    line(i, 25, i, 49);
  } 
  //day stripes
  for (int i=0; i<width; i++) { 
    color c = get(i, int(lineD)); 
    stroke(c); 
    line(i, 13, i, 24);
  } 
  //month stripes
  for (int i=0; i<width; i++) { 
    color c = get(i, int(lineMO)); 
    stroke(c); 
    line(i, 6, i, 12);
  } 
  //year stripes
  for (int i=0; i<width; i++) { 
    color c = get(i, int(lineY)); 
    stroke(c); 
    line(i, 0, i, 5);
  }
}



