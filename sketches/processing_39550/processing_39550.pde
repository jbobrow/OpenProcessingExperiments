
/*
Name: Baba Yaga House 04 (Image)
 File: BabyYagaHouse04Image
 By:   Barton Poulson
 Date: 27 September 2011
 Goal: Create a version of the Baby Yaga house but with a photo of the forest in
 the background and photos of actual chicken legs.
 */
PImage forest;                           // Declares a variable for the scary forest background.
PImage leg1;                             // Declares a variable for the first chicken leg.
PImage leg2;                             // Declares a variable for the second chicken leg.
PImage cottage;                          // Declares a variable for the cottage.
PFont babaFont;                          // Declares a variable for the font.
String baba = "Baba Yaga is looking for you..."; // Creates the text string.

size(450, 450);                          // Maximum canvas for OpenProcessing.
forest = loadImage("forest.jpg");        // Assigns a variable for the scary forest background.
leg1 = loadImage("leg1.png");            // Assigns a variable for the first chicken leg.
leg2 = loadImage("leg2.png");            // Assigns a variable for the second chicken leg.
cottage = loadImage("cottage.png");      // Assigns a variable for the cottage.

image(forest, 0, 0);                     // Loads the forest background at the top left origin.

translate(width/2, height/2);            // Moves the origin to the center of the screen

image(leg1, -89, -20);                   // Positions the left leg (the image is 89 pixels wide).
image(leg2, 0, -20);                     // Positions the right leg from the 0 point.

imageMode(CENTER);                       // Changes to center mode for the next image. 

image(cottage, 0, -100);                 // Positions the cottage.

babaFont = loadFont("AGaramondPro-Italic-24.vlw"); // Assigns the font.
textFont(babaFont);                      // Assigns the font.
fill(80);                                // Darkish gray for the font.
text(baba, -200, 200);                   // Inserts the text.

