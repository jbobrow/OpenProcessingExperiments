

/*
Create a variable to store a value that represents a "mode" within the program.
See how it's simply used in draw(), and changed in keyReleased()
-Here, we'll use a value of 0 to mean "symmetric mode" and 1 to mean asymmetric mode.

Briefly see
http://en.wikipedia.org/wiki/Finite-state_machine
and recognize how this is a 2 state machine, with transitions when the space bar is pressed.
How would you transition to symmetric with the 's' key and asymmetric with the 'a' key?
*/

int drawingMode = 0;

//some variables to model properties of our drawings:
float symmetryProperty1;
float symmetryProperty2;
//when you have multiple variables of the same type, you can create them like this:
float asymmetryProperty1, asymmetryProperty2, asymmetryProperty3;


void setup() {
  size(600, 400);
  smooth();
  rectMode(CENTER);
  fill(5,5,5);
  noStroke();
  changeSymmetricComposition();
  changeAsymmetricComposition();
}



void draw() {

  background(255, 252, 240);

  //based on the drawing mode, call the appropriate function (as defined below)
  if (drawingMode == 0) {
    drawSymmetricComposition();
  } else if (drawingMode == 1) {
    drawAsymmetricComposition();
 
  }

}

/*
keyReleased() is a special kind of function, known as an event handler

Here, the event is the releasing of a key on the keyboard, 
and this function is automatically called when that happens, 
once for each key (right after draw() finishes this frame).

This is how we add interactivity to programs. We'll change values of variables here based on what
key was pressed, and then those variables will affect what happens the next time draw() runs.
*/
void keyReleased() {
  //look for the space bar
  if (key == ' ') {
    if (drawingMode == 0) {
      drawingMode = 1;
      //change the properties of our drawing, but *only* when we switch modes (not every frame!)
      changeSymmetricComposition();
      fill(252,10,10);
    } else if (drawingMode == 1) {
      drawingMode = 0;
      //change the properties of our drawing, but *only* when we switch modes (not every frame!)
      changeAsymmetricComposition();
      fill(5,5,5);
    }
  }
}


void drawSymmetricComposition() {
  //draw two mirrored rectangles
  rect(symmetryProperty1, symmetryProperty2 , 20, 400);
  rect(width - symmetryProperty1, symmetryProperty2 , 20, 400);
}

void drawAsymmetricComposition() {
  //draw two almost mirrored rectangles, but vary them
  rect(asymmetryProperty1, asymmetryProperty3, asymmetryProperty1 / 2, asymmetryProperty1 / 3);
  rect(width - asymmetryProperty1 * .8, asymmetryProperty2 * 3/5, asymmetryProperty1, asymmetryProperty2 );
  
}

//randomize some values:
void changeSymmetricComposition() {
 symmetryProperty1 = random(50, 350); 
 symmetryProperty2 = random(200, 30); 
}

void changeAsymmetricComposition() {
 asymmetryProperty1 = random(width , width/2);
 asymmetryProperty2 = random(height / 4, height);  
 asymmetryProperty3 = random(height/3 , height );  
}

