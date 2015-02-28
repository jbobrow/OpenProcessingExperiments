
/* 
 Neil Jasper (Jazz) Trinos
 Assignment 1a: Animation (Kaleidoscopic Olympic Medal)
 Subject IDEA9203/4
 USYD ID 307040194
 Date 08 August 2012
 
 Credits: 
 1.) Gonzalez, L. (2009)."Beating Heart". www.openprocessing.org/sketch/3797. Cited: 03 August 2012
 2.) Sharer, M. (2012)."Sun". www.openprocessing.org/sketch/51775. Cited: 05 August 2012
*/

//-------------------------------------------------------------------------------------------------

// Start of Electronic Artwork

// Declare ray variables
int rsize = 250; // Size of rays
int rglow = 100; // Distance change in ray length
int numPoints = 175; // Number of rays
float radius; // Radius of rays
float angle = 360 / (float)numPoints; // Location of rays 

// Declare message variables
String[] message = {"WINNER"};
int index = 0;
float a = 50;
float b = 50;
float c = 50;


//-------------------------------------------------------------------------------------------------

void setup() {
  size(500, 700); // Set-up window size
  smooth(); // Smooth edges of shapes
}


//-------------------------------------------------------------------------------------------------

void draw() {
  background(100); // Draw gray background 

  // Create twinkling rays of medal
  for (int i=0;i<numPoints;i++) {
    radius = rsize - (int)random(0, rglow); // Update rays' radius
    line(250, 250, radius * sin(angle * i) + 250, radius * cos (angle * i) + 250); // Update rays' location 
    stroke(random(255), random(245), random(75)); // Rainbow colour
    strokeWeight(5); // Thickness of ray strand
  }

  // Create olympic medal
  ribbon1();
  ribbon2();
  circle();
  ring1();
  ring2();
  ring3();
  ring4();
  ring5();

  // Create moving message
  frameRate(13); // Movement regulator
  textAlign(CENTER); // Aligns message in centre
  fill(random(255), random(245), random(75)); // Rainbow colour 
  b = sin(0.2 * a++) * 50; // Initialise overall message behaviour
  textSize (c + b + 2); // Size
  text(message[index], 300 - c, 485 + c); // Location
  println ("WINNER!!!"); // Print message
}


//-------------------------------------------------------------------------------------------------

void ribbon1() {
  // Draw left portion of ribbon
  fill(190, 20, 240); // Dark purple
  stroke(HSB, 100);  // Silver lining
  strokeWeight(5);  // Thickness of lining
  quad(125, 350, 65, 650, 250, 580, 250, 425); // Location and size
}


//-------------------------------------------------------------------------------------------------

void ribbon2() {
  // Draw right portion of ribbon
  fill(225, 155, 235); // Light purple
  stroke(HSB, 100); // Silver lining
  strokeWeight(5); // Thickness of lining
  quad(375, 350, 435, 650, 250, 580, 250, 425); // Location and size
}


//-------------------------------------------------------------------------------------------------

void circle() {
  // Draw outer circle
  fill(240, 190, 10); // Gold
  stroke(HSB, random(100)); // Silver lining
  strokeWeight(10); // Thickness of lining
  ellipse (250, 250, 375, 375); // Location and size
}


//-------------------------------------------------------------------------------------------------

void ring1() {
  // Draw red ring
  noFill(); // No colour fill
  stroke(random(250), 25, 0); // Flickering red lining
  strokeWeight(15); // Thickness of lining
  ellipse(150, 210, 125, 125); // Location and size
}


//-------------------------------------------------------------------------------------------------

void ring2() {
  // Draw black ring  
  noFill(); // No colour fill
  stroke(random(100)); // Flickering black lining
  strokeWeight(15); // Thickness of lining
  ellipse(250, 210, 125, 125); // Location and size
}


//-------------------------------------------------------------------------------------------------

void ring3() {
  // Draw blue ring
  noFill(); // No colour fill
  stroke(24, 30, random(237)); // Flickering blue lining
  strokeWeight(15); // Thickness of lining
  ellipse(350, 210, 125, 125); // Location and size
}


//-------------------------------------------------------------------------------------------------

void ring4() {
  // Draw yellow ring
  noFill(); // No colour fill
  stroke(random(255), 250, 0); // Flickering yellow lining
  strokeWeight(15); // Thickness of lining
  ellipse(200, 295, 125, 125); // Location and size
}


//-------------------------------------------------------------------------------------------------

void ring5() {
  // Draw green ring
  noFill(); // No colour fill
  stroke(25, random(140), 0); // Flickering green lining
  strokeWeight(15); // Thickness of lining
  ellipse(300, 295, 125, 125); // Location and size
}


//-------------------------------------------------------------------------------------------------

// End of Electronic Artwork
