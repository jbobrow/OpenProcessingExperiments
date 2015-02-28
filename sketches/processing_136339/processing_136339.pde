
/****************************************************************

Reflective Geometry by Sarah Kettell

This interactive sketch allows a user to draw using 3 different
shapes, in 5 colours, each of which are rotated and reflected 
as they are drawn. The combination of reflection with basic
shapes creates an intricate and unique geographic art peice.


Draw:
Press and hold MOUSE BUTTON.

Controls:
Clear Canvas   =   'n' or 'N'
Save Canvas    =   's' or 'S'

Change Colours:
LEFT and RIGHT arrow keys cycle through 5 colours.

Change Shapes:
Circle   =   '1'
Square   =   '2'
Line     =   '3'

****************************************************************/

// Colour Palette
color palette[] = {#AB1386, #FE1F5E, #FD9251, #D4E325, #15BDA3};
color black = #000000;

/* 
Global Variables
*/

// variables for selecting colour
int pNum = 0;
color activeColor = palette[pNum];

// variables for shape size, weight, and rotation
int maxSize = 100;
int minSize = 10;
int shapeSize = minSize;
boolean upSize = true;

int maxWeight = 5;
int minWeight = 1;
int weight = minWeight;

float rotation = 0;

// variables for which shape to draw
boolean circle = true;
boolean square = false;
boolean line = false;


// Setup
void setup() {
  size(800, 600);
  background(black);
}

// Draw
void draw() {
  
  if (mousePressed) {
    
    // shape styles
    stroke(activeColor);
    strokeWeight(weight);
    noFill();
    rectMode(CENTER);
    
    // set grid to draw normal
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(rotation);
    
    // draw circles
    if (circle) {
      ellipse(0, 0, shapeSize, shapeSize);
    }
    // draw squares
    if (square) {
      rect(0, 0, shapeSize, shapeSize);
    }
    // draw lines
    if (line) {
      line(0, 0, shapeSize, shapeSize);
    }
    
    popMatrix();


    // set grid to draw reflection
    pushMatrix();
    translate(width - mouseX, height - mouseY);
    rotate(rotation);
    
    // draw circle
    if (circle) {
      ellipse(0, 0, shapeSize, shapeSize);
    }
    // draw squares
    if (square) {
      rect(0, 0, shapeSize, shapeSize);
    }
    // draw lines
    if (line) {
      line(0, 0, shapeSize, shapeSize);
    }
    
    popMatrix();
    
  }
  
    // advance rotation
    rotation = (rotation + 0.1) % 360;
  
    // increase and decrease shape size
    if (upSize) {
      shapeSize += 2;
      if (shapeSize == maxSize) {
        upSize = false;
      }
    } 
    else {
      shapeSize -= 2;
      if (shapeSize == minSize) {
        upSize = true;
      }
    }
  
}

void keyPressed() {
  
  // change shape
  switch(key){
    case '1':  // circle
      circle = true;
      square = false;
      line = false;
      print("1:" + circle);
      print("1:" + square);
      print("1:" + line);
      break;
    case '2':  // square
      circle = false;
      square = true;
      line = false;
      print("2:" + circle);
      print("2:" + square);
      print("2:" + line);
      break;
    case '3':  // line
      circle = false;
      square = false;
      line = true;
      print("2:" + circle);
      print("2:" + square);
      print("2:" + line);
      break;
  }
  
  // change colour
  if (keyCode == RIGHT && pNum < 4) {
    pNum += 1;
    activeColor = palette[pNum];
  }
  if (keyCode == LEFT && pNum > 0) {
    pNum -= 1;
    activeColor = palette[pNum];
    print(pNum);
  }

}

void keyReleased() {
  
  // clear canvas
  if (key == 'n' || key == 'N') {
    background(black);
  }
  
  // save screenshot
  if (key == 's' || key == 'S') {
    saveFrame("screencap##.png");
  }
}

