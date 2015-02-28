
/*
Name: Baba Yaga House 05 (Moving Image)
File: BabyYagaHouse04Image
By:   Barton Poulson
Date: 29 September 2011
Goal: Create a version of the Baby Yaga house but with a photo of the forest in
      the background and photos of actual chicken legs that move in response to
      input from the keyboard. This is the essential element of my proposed
      Charette animations.
 */

PImage forest;                             // Declares a variable for the scary forest background.
PImage leg1;                               // Declares a variable for the first chicken leg.
PImage leg2;                               // Declares a variable for the second chicken leg.
float angleLeft = 0;                       // Variable to change angle of left leg.
float angleRight = 0;                      // Variable to change angle of right leg.
PImage cottage;                            // Declares a variable for the cottage.
PFont babaFont;                            // Declares a variable for the font.
String baba = "Baba Yaga is running for you..."; // Creates the text string.

void setup() {
  size(450, 450);                          // Maximum canvas for OpenProcessing.
}

void draw() {
  imageMode(CORNER);                       // Returns the image position to the default corner method.
  forest = loadImage("forest.jpg");        // Assigns a variable for the scary forest background.
  image(forest, 0, 0);                     // Positions the image of the forest at the origin.

  pushMatrix();                            // Sets aside the centered grid for the house.
  translate(width/2 - 23, height/2 + 5);
  rotate(angleLeft);
  leg1 = loadImage("leg1.png");            // Assigns a variable for the first chicken leg.
  image(leg1, -66, -5);                   // Positions the left leg (the image is 89 pixels wide).
  if (keyPressed) {
    if (key == 'a') {
      angleLeft += .1;
    } else if (key == 'd') {
      angleLeft -= .1;
    } else if (key == 's') {
      angleLeft = 0;
    }
  }
  popMatrix();                             // Restores the centered grid for the house.
  
  // This is the right leg and I want it to rotate from the hip.
  pushMatrix();                            // Sets aside the centered grid for the house.
  translate(width/2 + 23, height/2 + 5);   // Moves origin to joint at 23 pixels from left, 5 pixels down.
  rotate(angleRight);
  leg2 = loadImage("leg2.png");            // Assigns a variable for the second chicken leg.
  image(leg2, -23, -5);                    // Positions the right leg from the 0 point.
  if (keyPressed) {
    if (key == 'l') {
      angleRight -= .1;
    } else if (key == 'j') {
      angleRight += .1;
    } else if (key == 'k') {
      angleRight = 0;
    }
  }
  popMatrix();                             // Restores the centered grid for the house.

  translate(width/2, height/2);            // Moves the origin to the center of the screen
  imageMode(CENTER);                       // Changes to center mode for the next image. 
  cottage = loadImage("cottage.png");      // Assigns a variable for the cottage.
  image(cottage, 0, -75);                 // Positions the cottage.
  babaFont = loadFont("AGaramondPro-Italic-24.vlw"); // Assigns the font.
  textFont(babaFont);                      // Assigns the font.
  fill(80);                                // Darkish gray for the font.
  text(baba, -200, 200);                   // Inserts the text.

}

