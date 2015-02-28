
/*Joseph Kotay. Practice Computational Methods. Professor Nick SensKe. Lab 6 Assignment. Arrays and Image Data
 *This sketch is adapted from the pickPaint example.  I found an image online that actually reminded me
 of the pickPaint sketch.  It's a grafiti bomb form the atrist Daim, who is known for his "3d grafiti"
 installations:  http://daim.org/site/en
 
 *I recoded the script so that there is a elliptical and rectangular brush stroke.
 *Also, the animation loops independently of the mouse position, and has brush strokes that rotate around
 the original image.
 */

/////////////////////    Digital Grafiti     //////////////////////

PImage myPic;

void setup() {
  size(667,400);  
  myPic = loadImage("daim_dai03569.jpg");
  frameRate(2);

  noStroke();
  smooth();

  background(myPic); // The original image is displayed in the background.
}


void draw() {
  ellipseMode(CORNERS);
  rectMode(CORNERS);


  int x = int(random(10,myPic.width/2));    // take a random x coordinate from myPic
  int y = int(random(10,myPic.height));   // take a random y coordinate from myPic

  // Rotate the random bruch strokes over the image as they are drawn.
  pushMatrix();
  translate(width/2,y);
  float brush = random(10,30);

  color myColor = myPic.get(x,y);      // use the random coordinate to get a color from myPic
  fill(myColor,90);
  rotate(frameRate*180);
  rect(x,y,brush,brush);  
  rotate(frameRate*360);
  ellipse(x,y,brush,brush);
  popMatrix();
}

void mousePressed() { //clears the random bruch strokes and reveals the image.
  background(myPic);
}






