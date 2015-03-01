
/*
 * Creative Coding
 * Week 1, 03 - Draw your name! (part 3)
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image.
 * Press 'r' to erase all your drawing and start with a blank screen
 * 
 */

// variables to store the delay and target counts
int delayCount;
int targetCount;

// setup function
void setup() {
  size(500, 500);
  background(255);

  delayCount = 0;
  targetCount = (int) random(5, 50); // set target count to a random integer between 10 and 50
  
  rectMode(CENTER);
}

// draw function
void draw() {

  /* draw a rectangle on your mouse point while you pressing 
   the left mouse button*/

  int style; 

  delayCount++; // increment delay count (shorthand for delayCount = delayCount + 1)

  if (delayCount == targetCount) {
    style = (int) random(4);
    targetCount = (int) random(5, 20) ;
    delayCount = 0;
  }
  else {
    style = 0;
  }


  if (mousePressed) {

    stroke(0); 
    fill(0);

    // switch statement
    switch(style) {
    case 0:
      // draw a point
      strokeWeight(1);
      stroke(random(125));
      fill(random(255,100));
      rect(mouseX, mouseY,30,30,10);
      
      break;

    case 1:
      // draw a circle with random radius
      float esize = random(1, 20);
      fill(random(255),random(255),random(255));
      rect(mouseX, mouseY,35,35,10);
      break;

    case 2:
      // draw a random sized rectangle
      float qsize = random(1, 10);
      stroke(random(255));
      rect(mouseX, mouseY,40,40,10);
      break;

    case 3:
      // draw a triangle with random size
      float tsize = random(1, 5);
      //strokeWeight(random(1,4));
      rect(mouseX, mouseY,45,45,10);
      break;
    } // end of switch statement
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



