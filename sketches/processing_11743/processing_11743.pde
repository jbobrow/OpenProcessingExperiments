

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
float asymmetryProperty4, asymmetryProperty5;

//color palette = color(palette);


void setup() {
  size(600, 400);
  smooth();
  rectMode(CENTER);
  colorMode(HSB);
  fill(200, 250, 75);
  stroke(0, 0, 0);
  strokeWeight(5);
  changeSymmetricComposition();
  changeAsymmetricComposition();
//  createColorPalette();
}


void draw() {

  background(0, 0, 220);

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
    } else if (drawingMode == 1) {
      drawingMode = 0;
      //change the properties of our drawing, but *only* when we switch modes (not every frame!)
      changeAsymmetricComposition();
    }
  }
}


void drawSymmetricComposition() {
  //draw two mirrored rectangles
  //rect(symmetryProperty1, symmetryProperty2 * 2/3, symmetryProperty1 / 2, symmetryProperty1 / 3);
  ellipse(175, 200, 150, symmetryProperty1);
  line(20, symmetryProperty2, 250, 50);
  line(20, 350, 250, 100);
  line(10, 10, 300, 350);
  ellipse(425, 200, 150, symmetryProperty1);
  line(580, symmetryProperty2, 350, 50);
  line(580, 350, 350, 100);
  line(590, 10, 300, 350);
  //rect(width - symmetryProperty1, symmetryProperty2 * 2/3, symmetryProperty1 / 2, symmetryProperty1 / 3);
}

void drawAsymmetricComposition() {
  //draw two almost mirrored rectangles, but vary them
  //rect(asymmetryProperty1, asymmetryProperty3, asymmetryProperty1 / 2, asymmetryProperty1 / 3);
  //rect(width - asymmetryProperty1 * .8, asymmetryProperty2 * 3/5, asymmetryProperty1, asymmetryProperty2 );
  ellipse(150, asymmetryProperty1, 200, 100);
  line(250, 250, 110, 25);
  line(asymmetryProperty2, 10, 100, height - asymmetryProperty1);
  ellipse(490, 245, asymmetryProperty3 - width, 115);
  line(580, 300, 350, 50);
  line(580, asymmetryProperty3, 350, 150); 
  line(500, 15, 420, 350);
  line(275, 50, 585, 375);
  
}

//randomize some values:
void changeSymmetricComposition() {
 symmetryProperty1 = random(10, 200); 
 symmetryProperty2 = random(height / 4, height * 3 / 4);
 //fill(30, 20, 100, 10);
 
}

void changeAsymmetricComposition() {
 asymmetryProperty1 = random(70, 180);  
 asymmetryProperty2 = random(height / 4, height * 3 / 4);  
 asymmetryProperty3 = random(width / 3, height * 2);  
 asymmetryProperty4 = random(450, 600);
 asymmetryProperty5 = random(10, 10);
}

//void palette() {
//  color(85, 10, 200, 3);
//  color(100, 50, 45);
//  color(12, 250, 200);
//}

