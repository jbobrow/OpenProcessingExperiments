
/*
Ben Norskov, Creative Computing Fall 2013

Conditional Operators:
  is equal to ==
  greater than >
  less than <
  not equal to !=
  greater than or equal to >=
  less than or equal to <=
  
If statement Structure
  if (condition is true) {
    //do this stuff
  };
*/

void setup() {
  size(300, 500);
};
void draw() {
  background(255);
  line(0, height*.5, width, height*.5);
  line(width*.5, 0, width*.5, height);
  /*Moving from english to computereese:
  
  if the mouse is more than halfway down the screen, draw a circle
  //if (mouse is more than halfway down the screen) {
  //if (mouseY more than halfway down the screen) {
  //if (mouseY > halfway down the screen) {
  if (mouseY > height/2) {
    ellipse(103, 200, 100, 14);
  }*/
  
  //if the mouse is in the bottom right of the screen, draw a circle
  if (mouseX < width*.5) {
    //is in bottom of screen
    if (mouseY < height*.5) {
      //ellipse(230, 340, 10, 10);
    }
  }
  
  //this is the same as above
  if ( (mouseX < width*.5) && (mouseY < height*.5) ) {
      ellipse(230, 340, 10, 10);
  }
};
