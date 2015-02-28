

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
float symmetryProperty3;
float symmetryProperty4;
//when you have multiple variables of the same type, you can create them like this:
float asymmetryProperty1, asymmetryProperty2, asymmetryProperty3, asymmetryProperty4;

float myColor1;
float myColor2;
float myColor3;


void setup() {
  size(600, 400);
  smooth();
  rectMode(CENTER);
  fill(64, 52, 5);
  //noStroke();
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
  if (key == 'a') {
    if (drawingMode == 0) {
      drawingMode = 1;
      //change the properties of our drawing, but *only* when we switch modes (not every frame!)
      changeSymmetricComposition();
       }
    }
  if (key == 's') {
    if (drawingMode == 1) {
       drawingMode = 0;
       changeAsymmetricComposition();
    }
  }
 }


void drawSymmetricComposition() {
  
  myColor1 = random(255);
  myColor2 = random(255);
  myColor3 = random(255);
  for (float x =200; x> -100; x -= 5) {
      stroke(myColor1, myColor2, myColor3, random(150,200));
      line(x, symmetryProperty1/symmetryProperty2, width/2, symmetryProperty3);
      line(width-x, symmetryProperty1/symmetryProperty2, width/2, symmetryProperty3);
      strokeWeight(2);
      line(width/2, 0, width/2, symmetryProperty3);  
}
   
  //rect(symmetryProperty1, symmetryProperty2 * 2/3, symmetryProperty1 / 2, symmetryProperty1 / 3);
  //rect(width - symmetryProperty1, symmetryProperty2 * 2/3, symmetryProperty1 / 2, symmetryProperty1 / 3);
}

void drawAsymmetricComposition() {
   for (float x =200; x> -100; x -= 5) {
     stroke(myColor1, myColor2, myColor3, random (150, 200));
     line(x, symmetryProperty1/symmetryProperty2, asymmetryProperty4, symmetryProperty3);
     line(width-x, symmetryProperty1/symmetryProperty2, asymmetryProperty4, symmetryProperty3);
     line(width/2, 0, asymmetryProperty4, symmetryProperty3);
   }
  //draw two almost mirrored rectangles, but vary them
 // rect(asymmetryProperty1, asymmetryProperty3, asymmetryProperty1 / 2, asymmetryProperty1 / 3);
 // rect(width - asymmetryProperty1 * .8, asymmetryProperty2 * 3/5, asymmetryProperty1, asymmetryProperty2 );
  
}

//randomize some values:
void changeSymmetricComposition() {
 symmetryProperty1 = random(width / 4, width / 3); 
 symmetryProperty2 = random(height / 4, height * 3 / 4); 
 symmetryProperty3 = random(0, height);
 symmetryProperty4 = random(100);
 }

void changeAsymmetricComposition() {
 asymmetryProperty1 = random(width / 4, width / 3);  
 asymmetryProperty2 = random(height / 4, height * 3 / 4);  
 asymmetryProperty3 = random(height / 4, height * 3 / 4); 
 asymmetryProperty4 = random(0, width); 
}

