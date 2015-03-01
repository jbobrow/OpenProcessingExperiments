
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
  background(120);

  delayCount = 0;
  targetCount = (int) random(5, 50); // set target count to a random integer between 10 and 50
}

// draw function
void draw() {

  /* draw a rectangle on your mouse point while you pressing 
   the left mouse button*/

  int style; 

  delayCount++; // increment delay count (shorthand for delayCount = delayCount + 1)

  if (delayCount == targetCount) {
    style = (int) random(4);
    targetCount = (int) random(2, 4) ;
    delayCount = 0;
  }
  else {
    style = 0;
  }


  if (mousePressed) {

    stroke(255); 
    fill(int(random(255)), int(random(255)), int(random(255)));
    // switch statement
    switch(style) {
    case 0:
      // draw a point
      point(mouseX, mouseY);
      break;

    case 1:
      // draw a circle with random radius
      float esize = random(1, 20);
      ellipse(mouseX, mouseY, esize, esize);
      break;

    case 2:
      // draw a random sized rectangle
      float qsize = random(1, 10);
      quad(mouseX-qsize, mouseY, mouseX, mouseY-qsize, mouseX+qsize, mouseY, mouseX, mouseY+qsize   );
      break;

    case 3:
      // draw a triangle with random size
      float tsize = random(1, 5);
      triangle(mouseX-tsize, mouseY+tsize, mouseX, mouseY-tsize, mouseX+tsize, mouseY+tsize); 
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



