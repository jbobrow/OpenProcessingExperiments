
int delayCount;
int targetCount;

// setup function
void setup() {
  size(900, 400);
  background(178,255,223);

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
    style = (int) random(3);
    targetCount = (int) random(5, 20) ;
    delayCount = 0;
  }
  else {
    style = 0;
  }


  if (mousePressed) {

    stroke(0); 
    fill(255);

    // switch statement
    switch(style) {
    /*case 0:
      // draw a point
      point(mouseX, mouseY);
      break;
    */
    case 0:
      // draw a circle with random radius
      float esize = random(1, 15);
      ellipse(mouseX, mouseY, esize, esize);
      break;

    case 1:
      // draw a random sized rectangle
      float qsize = random(1, 10);
      quad(mouseX-qsize, mouseY, mouseX, mouseY-qsize, mouseX+qsize, mouseY, mouseX, mouseY+qsize   );
      break;

    case 2:
      // draw a triangle with random size
      float tsize = random(1, 10);
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
    background(178,255,223);
  }
}

