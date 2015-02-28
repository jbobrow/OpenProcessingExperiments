
//
// Coursera project by Jeremy Smith
//
// Take a picture with a camera
// Holding down the mouse takes a virtual picture complete with shutter sound 
// The longer the mouse hold the longer the shutter stays on the screen
//


import ddf.minim.*; // import for sound
Minim minim;
AudioSample click; // define the click
PImage img;  // Declare variable "img" of type PImage
boolean runonce = true;

// 
// Setup the variables
//

void setup() {
  size(800, 600);
  img = loadImage("wall.jpg");  // Load the image into the program  
minim  = new Minim (this);
click = minim.loadSample ("shutter.wav"); // Load the click
}

//
// The Main Loop
//

void draw() {
   if (runonce) {
     // only want to draw the background image once while looping
     image(img,0,0);
     redraw();
     runonce=false;
   }
}

// Check for mouse pressed
void mousePressed() {
  click.trigger(); // play the click sound
  stroke(10);
  fill(#c0c0c0);
  pushMatrix();
  translate(width/2,height/2);
  for(int i = 0; i <= width; i += 22) { // draw the shutter every 22 degrees
    rotate(7*radians(i*4));
    triangle(600, 50, 600, -width, 50, 600/3); 
  }
  popMatrix(); 
}

// Check for mouse released
void mouseReleased() {
  image(img,0,0); // redraw the background image removing the shutter
}
// end of program.

