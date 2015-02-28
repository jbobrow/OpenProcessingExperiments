
// Created By : Irine Prastio
// Student ID : 301083131
// Date : Oct 4, 2012
// IAT 800
// Instructor : Phillipe Pasquire
// TA : Miles Thorogood

/*Create a responsive animation using curves that behaves differently when 
the mouse is dragged at different speeds. Make it so that it begins when 
the mouse is clicked and ends when any keyboard button is pressed.*/

int value = 0;  //declare initial value as 0
int x; // declare integer x

void setup () {
  size (550, 500); // setup canvas size to 500 x 500
  background (255); // setup background to white
}


void draw() {
  drawCurve();// call drawCurve function
}


void drawCurve() {
  background (255);
  for (float x = 0; x< width; x++) { // loop to initiate the drawing method as long as x smaller than width
    stroke(0);
    strokeWeight(1);
    float y = value/height; // initiate y as value/height
    fill (value, 0, 0, value); //pass the numeric value of "value" to fill color
    translate (mouseX, y); // translate the curves according to mouse position x
    rotate (noise (360)); // animate by rotating canvas using noise method
    // start drawing the control vertices
    beginShape();
    curveVertex(250, 500);
    curveVertex(200, 500);
    curveVertex(100, 350);
    curveVertex(200, 200);
    // ending vertex controlled by mouse position in X axis
    // random values are chosen every time the code is started
    curveVertex(random(value), random(value));
    curveVertex(random(value), random (value));
    endShape();

    // "primary" / displayed line (this is what you'll actually see)

    stroke(0);
    strokeWeight(1);

    beginShape();
    curveVertex(250, 500);
    curveVertex(200, 500);
    curveVertex(100, 350);
    curveVertex(200, 200);
    curveVertex(mouseX, 60);
    endShape();
    // draw ellipses to display the points that the curve is based on
    fill (255);
    ellipse(200, 500, 5, 5);
    ellipse(100, 350, 5, 5);
    ellipse(200, 200, 5, 5);
  }
}



void mouseDragged() 
{
  value = value + 2; // define the function when mouse is dragged
  if (value > 100) { 
    value = 0; // reset the value to 0 if it exceed 100
  }
} 
void keyPressed () { // define the function when keyboard are pressed
  background (255); // draw white background 
  drawCurve(); // call the drawCurve function
  value = 0; // reset value to 0
}




