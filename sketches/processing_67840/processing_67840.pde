
/* 
 Neil Jasper (Jazz) Trinos
 Assignment 1c: Video (Olympic Winner)
 Subject IDEA9203/4
 USYD ID 307040194
 Date 22 August 2012
 
 Credits: 
 1. Gough, P. (2012). IDEA9203 Processing 5 Tutorial Notes. Cited: 16 August 2012 
 2. Shiffman, D. (2008). "Example 16-14: Overall Motion". www.learningprocessing.com. Cited: 20 August 2012
 3. Trinos, J. (2012). "Kaleidoscopic Medal". www.openprocessing.com/sketch/66735. Cited: 20 August 2012
*/


//----------------------------------------------------------------------------------------------------------

// Start of Electronic Artwork

// Declare video variables
import processing.video.*;
Capture video;
MovieMaker Jazz;
PImage pf; // Call previous frame
float threshold = 20; // Difference between normal pixel to motion pixel


//----------------------------------------------------------------------------------------------------------

void setup() {
  size(700, 500); // Set-up window size
  smooth(); // Smooth edges of shapes

  // Video input specifications
  video = new Capture(this, width, height, 20);
  pf = createImage(video.width, video.height, RGB); // Create an empty image the same size as the video
  Jazz = new MovieMaker (this, width, height, "Olympic Winner.mov", 20, MovieMaker.H263, MovieMaker.BEST);
  println("Press 'space bar' to stop video recording");
}


//----------------------------------------------------------------------------------------------------------

void draw() {
  image(video, 0, 0); // Video position

  // Capture video
  if (video.available()) {
    // Save previous frame 
    pf.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
    pf.updatePixels();
    video.read();
  }

  // Declare pixel values
  loadPixels();
  video.loadPixels();
  pf.loadPixels();

  // Previous motion, named as pm, loop will start with 0
  float pm = 0; 

  // Sum the brightness of each pixel
  for (int i = 0; i < video.pixels.length; i ++ ) {

    // Declare current colour
    color current = video.pixels[i]; 

    // Declare previous colour
    color previous = pf.pixels[i]; 

    // Compare current and previous colours
    float r1 = red(current); 
    float g1 = green(current);
    float b1 = blue(current);
    float r2 = red(previous); 
    float g2 = green(previous);
    float b2 = blue(previous);

    // Declare individual pixel motion based on current and previous colours
    float diff = dist(r1, g1, b1, r2, g2, b2);
    pm += diff; // Total of overall colour differences
  }

  // Declare current motion, named am, which is the quotient of previous motion and number of pixels called
  float am = pm / video.pixels.length; 
  float slap = am * 5; // Declare radius change 

  // Display 'OLYMPIC' text
  fill(random(255), random(245), random(75)); // Rainbow colour
  textAlign(CENTER); // Aligns text in centre
  textSize (50); // Size 
  text("OLYMPIC", 350, 100); // Location

  // Display 'WINNER' text
  fill(random(255), random(245), random(75)); // Rainbow colour
  textAlign(CENTER); // Aligns text in centre
  textSize (50); // Size 
  text("WINNER", 350, 450); // Location

  // Display outer circle
  fill(240, 190, 10); // Gold
  stroke(HSB, random(100)); // Silver lining
  strokeWeight(10); // Thickness of lining
  ellipse (350, 260, slap * 5, slap * 5); // Location and size

  // Display red ring
  noFill(); // No colour fill
  stroke(random(250), 25, 0);
  strokeWeight(3); // Thickness of lining
  ellipse(325, 250, slap, slap); // Location and size

  // Display black ring 
  noFill(); // No colour fill
  stroke(random(100));
  strokeWeight(3); // Thickness of lining
  ellipse(350, 250, slap, slap); // Location and size

  // Display blue ring
  noFill(); // No colour fill
  stroke(24, 30, random(237)); // Flickering blue lining
  strokeWeight(3); // Thickness of lining
  ellipse(375, 250, slap, slap); // Location and size

  // Display yellow ring
  noFill(); // No colour fill
  stroke(random(255), 250, 0); // Flickering yellow lining
  strokeWeight(3); // Thickness of lining
  ellipse(335, 275, slap, slap); // Location and size

  // Display green ring
  noFill(); // No colour fill
  stroke(25, random(140), 0); // Flickering green lining
  strokeWeight(3); // Thickness of lining
  ellipse(365, 275, slap, slap); // Location and size

  // Adds drawn video file
  Jazz.addFrame();
}


//----------------------------------------------------------------------------------------------------------

void keypressed() {
  // Press 'space bar' to stop video recording
  if (key == ' ') { 
    Jazz.finish();
  }
}



//----------------------------------------------------------------------------------------------------------

void stop() {
  // Declare stop() function to end file properly
  Jazz.finish();
  super.stop();
}


//----------------------------------------------------------------------------------------------------------

// End of Electronic Artwork
