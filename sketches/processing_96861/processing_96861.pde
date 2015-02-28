
PImage img;  
// The base for this code was borrowed from processing.org
// This is an example of simple code which loads up a picture of a dog when the
// program is run
void setup() {
  size(640, 360);
  // This sets the size of the program as 640 x 360 
  img = loadImage("dog.jpg");  // this loads the image 'dog.jpg' into the program  
}

void draw() {
  // This code draws the image starting at the coordinates 0,0
  image(img, 0, 0); 
}



