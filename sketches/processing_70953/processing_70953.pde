
/*****************************************
 * Assignment 2
 * Name:         Michelle Neuburger
 * E-mail:       mneuburger@brynmawr.edu
 * Course:       CS 110 - Section 1
 * Submitted:    9/19/2012
 * 
 * Ellipses appear on a click with size, position, and color depending on 
 * position of mouse. Background is stripes that alternate between horizontal
 * and vertical. This is done using conditionals, while loops, and keyPressed
 * and mousePressed commands.
***********************************************/
//key iteration variable
int i = 2;

//setup: window, rectMode, first background color.
void setup() {
  size(500,500);
  rectMode(CORNER);
  background(random(255),random(255),random(255));
}

//empty draw loop
void draw() {  }

//key press resets background
void keyPressed() {
  
  //color variables
  float r = random(255);
  float g = random(255);
  float b = random(255);
  
  //rectangle counting variables
  int e = 0;
  int w = 0;
  
  //reset background to white
  fill(255);
  rect(0,0,500,500);
  
  fill(r,g,b);
  
  //horizontal stripes across the window every other keypress
  if(i%2 == 0) {
    while(w < 500) {
      rect(w,0,5,500);
      w = w + 20;
    }
    
    //vertical stripes across the window every other keypress
  } else {
    while(e < 500) {
      rect(0,e,500,5);
      e = e + 20;
    }
  }
  
  //keypress count goes up
  i = i + 1;
}

//mouse presses draw ellipses
void mousePressed() {
  noStroke();
  //in the top left quadrant the color is a mouse-position-controlled
  //shade of red
  if((mouseX < 255) && (mouseY < 255)) {
    fill(255, mouseX, mouseY);
    //in the rest of the window the color is a mouse-position-controlled
    //shade of blue or green
  } else if((mouseX > 255) || (mouseY > 255)) {
    fill(0,(mouseX - 255),(mouseY - 255));
  } 
  
  //setting size variables based on mouse position
  int j;
  int k;
  if(mouseX < 60) {
    j = mouseX;
  } else {
    j = mouseX/8;
  }
  if(mouseY < 60) {
    k = mouseY;
  } else {
    k = mouseY/13;
  }
  
  //ellipse drawn according to mouse position
  ellipse(mouseX,mouseY,j,k);
}
