

// SCREEN SETUP
void setup() {
  size(600, 600);
  background(25);
}

// VARIABLES
float originX = 300;
float originY = 300;
//r value to hold the screen rotation value
float r = 0;
//Size factor for the shape to be drawn
float sizeFactor = 2;
//increment values in major directions (UP, Down, Right, Left sides of head)
float incrementValue = 15; // 15 px, at each key stroke



// MAIN FUNCTION 
void draw() {
  makeTransformations(); // Listen keystrokes here, and make screen transformations 
  drawMyTriangle(); // Draws the shape on screen with its current position and rotation 
  undoTransformations(); // Undoes the screen transformations, so that the screen is vertical again.

  fadeEffect(); // Refreshes the screen by using an effect
  writeInstructions(); // Writes instructions on Screen
}

// METHODS 
/* This will change the screen origin point and rotate */
void makeTransformations() {
  translate(originX, originY);
  rotate(r);
}

/* Method undoes all the screen transformations made before.
 Instead a built-in function may have been used, resetMatrix() */
void undoTransformations() {
  /*This will reset all the translate and rotation amount
   it will ease to determine the coordinates in FadeEffect and writeInstr. functions. */
  rotate(-r);
  translate(-originX, -originY);
}

/* Method refreshes screen by a fade effect */
void fadeEffect() {
  fill(25, 100);
  rect(0, 0, width, height);
}	

/* Method writes instructions on Screen */
void writeInstructions() {  
  textSize(15);
  textAlign(RIGHT, BOTTOM);
  fill(255);
  text("Control the movement by using Arrow Keys, UP, LEFT, RIGHT, DOWN", 550, 500);
  text("Shape can be rotated by using R and L keys", 550, 520);
  text("Press, Drag and Release mouse to place shape to anywhere ", 550, 560);
}

/* Method draws the triangle on Screen */
void drawMyTriangle() {

  // Axes are to emphasize the ways around Triangle
  drawAxes();

  // Draw the main Body
  stroke(100);
  fill(255, 0, 0);
  //(0,0) is the center of triangle
  triangle(0, 0-(10*sizeFactor), 0-(20*sizeFactor), 0+(10*sizeFactor), 0+(20*sizeFactor), 0+(10*sizeFactor));

  //Put an ellipse is to emphasize center point of triangle.	
  fill(255);
  ellipse(0, 0, 5*sizeFactor, 5*sizeFactor);
}

/* Method draws two perpendicular axis, to emphasize the main ways of triangle shape */
void drawAxes() {

  // Drwa Vertical axis
  stroke(255);
  line(0, -16*sizeFactor, 0, 15*sizeFactor);

  // Draw Horizontal Axis
  stroke(255);
  line(-25*sizeFactor, 5*sizeFactor, 25*sizeFactor, 5*sizeFactor);
}

//ACTION LISTENERS
/* mouseDRagged Function (an internal built-in function, listens for the drag movements of mouse */
void mouseDragged() {
  originX = mouseX;
  originY = mouseY;
}


/* KeyPressed Function (an internal built-in function, listens the keyboard entries) */
void keyPressed() {

  //Calculates vectorial displacement amount  
  if (keyCode == UP) {
    originX +=  incrementValue * sin(r);
    originY -=  incrementValue * cos(r);
  }

  else if (keyCode == DOWN) {
    originX -=  incrementValue * sin(r);
    originY +=  incrementValue * cos(r);
  } 

  else if (keyCode == LEFT) {
    originX -=  incrementValue * cos(r);
    originY -=  incrementValue * sin(r);
  } 

  else if (keyCode == RIGHT) {
    originX += incrementValue * cos(r);
    originY += incrementValue * sin(r);
  }

  // If user press R or L keys rotate the scene with PI/20 radian.
  else if ( key == 'r' || key == 'R') {
    r += (PI/20); // r represents the rotation amount of screen
  }
  else if (key == 'l' || key == 'L') {
    r -= (PI/20);
  }
}



