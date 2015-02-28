
// Document Comment follows
/**
 * Wafer02mm version 20071229. 
 * Copyright (c) 2007-2010 by Thomas J. Greenbaum.
 * Description:
 * An image of a semiconductor factory tool (stepper) is shown on screen. 
 * Moving the mouse from screen left to right brings the image of a silicon wafer from back to front.
 * As the wafer moves to the front the stepper image fades to white.
 * Moving the mouse from bottom of screen to top of screen rotates the wafer about the x-axis.
 * In this way, the user can make the wafer emerge from the stepper stage and fly toward the viewer.
 * HINT: Start with the mouse in the lower left corner, then move to the upper right corner of the screen.
 * An animated Quicktime movie of the wafer movements can be made by uncommenting a line in the code.
 * This also requires a MovieMaker library to be loaded.
 * Look inside the code for instructions to activate the MovieMaker function.
 * Start recording the movie by pressing the 's' key.
 * End recording mode and save the move by pressing the 'e' key.
 */

//UNCOMMENT TO USE OPENGL LIBRARY
//import processing.opengl.*;
//UNCOMMENT TO USE MOVIE MAKER LIBRARY
//import processing.video.*;

PImage imgWfr;
PImage imgStp;

// MovieMaker mm;  // Declare MovieMaker object

void setup() {
  //UNCOMMENT TO USE OPENGL LIBRARY
  //size(640, 480, OPENGL);
  size(640, 480, P3D);
  // Create MovieMaker object with size, filename, compression codec and quality, framerate
  // See Reference\Libraries\Video for more information
  // NEED TO LOAD THE MovieMaker object library in order to make the movie
  // UNCOMMENT THE FOLLOWING LINE TO CREATE A QUICKTIME MOVIE AS YOU MANIPULATE THE WAFER ON SCREEN
  // mm = new MovieMaker(this, width, height, "drawing.mov", 30, MovieMaker.H263, MovieMaker.HIGH);
  // Load images for use in animation - NOTE: images loaded before draw() increases speed of program
  imgWfr = loadImage("Wafer01.gif"); // Wafer GIF image with transparency
  imgStp = loadImage("Stepper.jpg"); // Semiconductor factory tool (stepper) image
  noStroke();
}

float imgStpM  = 1.15; // Scale multiplier for stepper image to fill entire display
float imgStpZ  = -50;  // Since stepper image is at a negative Z it will appear smaller
float imgWfrSz =  70;  // Initial screen size of the wafer image so it fits on stepper stage
float imgWfrYo =  75;  // Offset the wafer (from screen center) to stepper stage center

void draw() {
  background(255);
  // Stepper image to fill display behind the wafer
  translate(width/2, height/2); // Move relative to center of the screen
  pushMatrix(); // Save current state of the translation matrix
  // Fade the stepper image to white as the mouse moves from left to right
  tint(255, map(mouseX, 0, width, 255, 0)); // Tint with white to create the fade
  beginShape();
    texture(imgStp);
    scale(imgStpM, imgStpM, 1);
    vertex(-width/2, -height/2, imgStpZ,   0,   0);
    vertex( width/2, -height/2, imgStpZ, 640,   0);
    vertex( width/2,  height/2, imgStpZ, 640, 480);
    vertex(-width/2,  height/2, imgStpZ,   0, 480);
  endShape();
  popMatrix(); // Restore the saved state of the translation matrix
  noTint(); // Do not tint the wafer image
  // As the mouse moves from left to right the wafer moves up slightly and towards the viewer
  translate(0, map(mouseX, 0, width, imgWfrYo, 0), map(mouseX, 0, width, -50, 350));
  // As the mouse moves from bottom to top the wafer rotates on the x-axis
  rotateX(map(mouseY, 0, height, -PI, PI*1.5));
  beginShape();
    texture(imgWfr);
    vertex(-imgWfrSz/2, -imgWfrSz/2, 0,   0,   0);
    vertex( imgWfrSz/2, -imgWfrSz/2, 0, 390,   0); // Wafer image size = 390x390 pixels
    vertex( imgWfrSz/2,  imgWfrSz/2, 0, 390, 390);
    vertex(-imgWfrSz/2,  imgWfrSz/2, 0,   0, 390);
  endShape();
// UNCOMMENT THE FOLLOWING LINES WITH THE MOVIE MAKER FUNCTION ENABLED
//  if (key == 'e') {
//    // 
//    mm.finish();  // Finish the movie if the 'e' key is pressed
//  } 
//  else {
//    if (key == 's') { // Start recording movie if 's' key is pressed
//      mm.addFrame();  // Add window's pixels to movie
//    }
//  }
} // End Draw

