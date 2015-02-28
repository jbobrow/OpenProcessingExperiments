
// load the appropriate toxiclibs libraries
import toxi.geom.*;
import toxi.color.*;

// declare four TColor variables
TColor c, c1, c2, c3;

void setup() {
  // set things up
  size(525,150);
  background(0);
  noStroke();
  // this is a static sketch so tell it not to loop
  noLoop();
}

void draw() {
  // create a new random colour
  c = TColor.newRandom();
  // generate various modifications of the chosen colour
  c1 = c.getComplement();
  c2 = c.getInverted();
  c3 = c.getRotatedRYB(0.5);
  
  // draw four squares to screen filled with our colours
  // of choice
  fill(c.toARGB());
  rect(25,25,100,100);
  fill(c1.toARGB());
  rect(150,25,100,100);
  fill(c2.toARGB());
  rect(275,25,100,100);
  fill(c3.toARGB());
  rect(400,25,100,100);
}

// if a key is pressed call draw() again to pick a new
// set of colours
void keyPressed() {
  redraw();
}


