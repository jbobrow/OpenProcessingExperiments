
// Introduction to Computational Arts: Processing
// An Interactive Sketch (Week 4, Assignment 3)
// Michael Kruger 2014-02-26
/* "SYMMETRY" is a simple sketch to draw symmetrical shapes form the centre of the screen.  
 To start you have to press your mouse button. 
 The default colour is black and the default shape ellipse. 
 The following keys allow to alter the drawing with the mouse:
 A. Color changes:
 “a” for black
 “b” for blue
 
 B. Shape changes:
 “1” for arc shape 1
 “2” for arc shape 2
 “3” for rounded rectangles
 
 Press backspace or delete to clear the screen.
 Press “s” to save a screen shot.
 */

// Global Variable
color strokeColor = color(0, 10);


void setup() {
  size(720, 720);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  background(360);
}

void draw() {
  if (mousePressed) {
    pushMatrix();
    translate(width/2, height/2);
    strokeWeight(2);
    stroke(strokeColor);


    switch(key) {
    default:
      // Shape 1 'Circle'
      ellipse(0, 0, mouseX+10, mouseY+10);
      break;

    case '1':
      // Shape 2 'Arc'
      arc(0, height/2, mouseX+20, mouseY+20, PI, PI+PI/2);      // arc a
      arc(0, height/2, mouseX+20, mouseY+20, PI+PI/2, 2*PI);    // arc b
      arc(0, -height/2, mouseX+20, mouseY+20, 0, PI/2);          // arc c
      arc(0, -height/2, mouseX+20, mouseY+20, PI/2, PI);        // arc d
      break;

    case '2':
      // Shape 2 'Arc'
      arc(width/2, height/2, mouseX+width/2, mouseY+height/2, PI, PI+PI/2);      // arc a
      arc(-width/2, height/2, mouseX+width/2, mouseY+height/2, PI+PI/2, 2*PI);    // arc b
      arc(-width/2, -height/2, mouseX+width/2, mouseY+height/2, 0, PI/2);          // arc c
      arc(width/2, -height/2, mouseX+width/2, mouseY+height/2, PI/2, PI);        // arc d
      break;

    case '3':
      // Shape 3 'rect': rect(a, b, c, d, r)
      rectMode(CENTER);
      rect(0, 0, mouseX+20, mouseY+20, mouseX);
      break;
    }
    popMatrix();
  }
}


// keyPressed()
void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's' || key == 'S') saveFrame("sreenshot.png");

  switch(key) {
  case 'a':
    strokeColor = color(0, 10);
    break;
  case 'b':
    strokeColor = color(185, 40, 36, 10);
    break;
  }
}



