
PImage mypic; //declare a PImage type variable called 'mypic'

void setup() {
  size(600, 400); //make the screen the same size as the photo

  mypic = loadImage("Pro.jpg"); //load your photo into the variable you declared at the top
  noStroke(); //switch off outlines
  smooth(); //smooth edges of shapes
  //noCursor();  //hides the mouse pointer, of course!
}

void draw() {
  background(0); //black background

  image(mypic, 0, 0);  //draw the image stored as 'mypic', starting at the top left, coordinates 0,0.
  fill(255);  //set fill to white for eyeball

  ellipse(224, 147, 40, 40);  //draw white circle over left eye
  ellipse(362, 147, 40, 40);  //draw white circle over right eye
  fill(0);  //set fill to black for eye pupil
  float mx1 = constrain(mouseX, 212, 237);  //uses mouse x coordinate, but only within x=212-237
  float my1 = constrain(mouseY, 135, 159);  //uses mouse y coordinate, but only within x=135-159
  ellipse(mx1, my1, 15, 15);  //draws a black left eye pupil using constrained x and y coordinates
  float mx2 = constrain(mouseX, 350, 374);  //uses mouse x coordinate, but only within x=350-374
  float my2 = constrain(mouseY, 135, 159);  //uses mouse y coordinate, but only within x=135-159
  ellipse(mx2, my2, 15, 15);  //draws a black right eye pupil using constrained x and y coordinates

  //println(mouseX);   //mouse coordinates to pinpoint ellipse locations
  //println(mouseY);
}


