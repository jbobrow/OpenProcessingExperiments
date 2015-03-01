
// Pr0iect Final:  Bringing it all together
// 
// This sketch is titled African Mask.  First, I have
// created the "mask"in another sketch; took a picture;
// and uploaded to this program.
// The sketch has been adapted from the tutorials
// available in "Fun Programming.org" To the copy function, 
// I have included the algorithmic codes found in GENERATIVE GESTALTUNG.
// The original image collapses to create a new abstract image.
// 

// ====Global variables====
// Create a variable to hold the image 
  PImage img;
  float a = 0;

void setup() {
//load the image from file
  img = loadImage("Mask.jpg");
//set the size of the screen to be the same as the image (800px x 600px)
  size(img.width, img.height);
  background(255);
  image(img, 0, 0);
  stroke(255);
}

void draw() {
  //randomly create the variables that are inputs to the copy
  //function.  I used random and noise functions for this.
  int x1 = (int) random(0, width);
  int y1 = 0;

  int x2 = round(x1 + random(-10, 10));
  int y2 = round(random(-7, 7));

  int w = int(map(noise(a), 0, 1, 0, width));
  int h = height;

  copy(x1, y1, w, h, x2, y2, w, h);
  a = a + 0.15;
}
void keyReleased() {
  if (key=='s' || key=='S') saveFrame("_##.png");
  if (key == DELETE || key == BACKSPACE) background(255); 
  image(img, 0, 0); //to restore the image and start over.
  if (key == ESC) noLoop(); //to stop the sketch
}


