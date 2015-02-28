
/* This program creates an image (using only squares) 
 that contains three colors from a Shades palette
 Created by Olaf Keller for the Kunstwurfelspiel Academy course:
 "Creating Geometric and Generative Art with Code:
 An Introduction to Processing Software"
 */


void setup() {
  //set canvas size
  size(600, 600);
}

void draw() {
  //set background to black
  background(0);

  //this part of code draws 4 squares
  // set stroke to black for the next 3 squares
  stroke(0);

  //square 1
  fill(#FFAA1A);
  strokeWeight(11);
  rect(0, 0, 580, 580);

  //square 2
  fill(#7F550D);
  strokeWeight(10);
  rect(50, 50, 520, 520);

  //square 3
  fill(#BF7F13);
  strokeWeight(30);
  rect(100, 100, 400, 400);

  //square 4
  fill(#E59917);
  strokeWeight(50);
  stroke(#FFAA1A);
  rect(150, 200, 200, 200);
}

/* Functions below create and save the output as a normal .png file 
 and high resolution .png when 's' key is pressed - code by Amnon Owed: 
 http://amnonp5.wordpress.com/2012/01/28/25-life-saving-tips-for-processing/
 */

void keyPressed() {
  if (key == 's') {
    save("normal.png");
    saveHiRes(5);
    exit();
  }
}

void saveHiRes(int scaleFactor) {
  PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, JAVA2D);
  beginRecord(hires);
  hires.scale(scaleFactor);
  draw();
  endRecord();
  hires.save("hires.png");
}

