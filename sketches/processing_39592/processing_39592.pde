
/*
BabaYagaHouse03Interact
"Baba Yaga House, version 03 with interaction"
 
An object to be used for continuing examples
in the Processing course.
By Barton Poulson
16 September 2011

In this version, the color of the house, the height of the roof, and
the width of the feet are all fixed. However, three elements of 
interaction are included: (1) the house follows with mouse (with a
slight delay via easing); (2) the legs of the house  grow longer 
when the left mouse button is pressed and shorter when the right
mouse button is pressed; and (3) if any keys on the keyboard are
pressed, a picture of Baba Yaga fills the canvas.
 
*/
 
float heightLegs = 20;                                // Sets value for height of legs.
float easing = 0.03;                                  // Sets value for easing (delay in following mouse).
float easeX;                                          // Variable used in easing.
float easeY;                                          // Variable used in easing.
PImage scaryBaba;                                     // Declares a variable for the scary Baba Yaga picture.
 
void setup() {
  size(450, 450);                                     // Flat orange background.
  scaryBaba = loadImage("scaryBaba.jpg");             // Assigns a variable for the scary Baba Yaga picture.
}

void draw() {
  if (keyPressed) {                                     // Checks if any key is pressed.
    image(scaryBaba, 0, 0);                             // If so, loads picture.
  } else {                                              // If not, does the following:
    background(#B87333);                                // Flat orange background.
    float targetX = mouseX;                             // Sets the target to the current value of mouseX.
    easeX += (targetX - easeX) * easing;                // Increments the easing value to allow delay.
    float targetY = mouseY;                             // Sets the target to the current value of mouseY.
    easeY += (targetY - easeY) * easing;                // Increments the easing value to allow delay.
    pushMatrix();                                       // Saves the original grid.
    translate(easeX, easeY);                            // Origin follows the mouse with some lag (easing).
    rectMode(CENTER);                                   // Draws rectangles from the center.
    smooth();                                           // Turns on anti-aliasing.
    strokeWeight(3);                                    // Thicker lines, more cartoon-like.
    fill(#FFF68F);                                      // Pale yellow fill.
    triangle(-30, 0, -30, -20, -80, 0);                 // Left foot (based on origin)
    triangle(30, 0, 30, -20, 80, 0);                    // Right foot (based on origin)
    line(-30, -20, -30, -20-heightLegs);                // Left leg.
    line(30, -20, 30, -20-heightLegs);                  // Right leg.
    rect(0, -70-heightLegs, 100, 100);                  // The box for the house.
    triangle(-75, -120-heightLegs, 75, -120-heightLegs, // The roof.
      0, -160-heightLegs);
    fill(0);                                            // Makes the door black in the next line.
    rect(0, -50-heightLegs, 30, 60);                    // The door
    
    if (mousePressed && (mouseButton == LEFT)) {
      heightLegs += 1;                                  // Makes the legs longer when the left mouse is pressed.
    }
    if (mousePressed && (mouseButton == RIGHT)) {
      heightLegs -= 1;                                  // Makes the legs shorter when the right mouse is pressed.
    }
    popMatrix();                                        // Restores the original grid.
  }
}


