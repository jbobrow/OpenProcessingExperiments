
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="uno.jpg"; */ 

PImage img;  // Declare variable "a" of type PImage

void setup() {
  size(10000, 500);
    background(255);  //set background white
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("uno.png");  // Load the image into the program
  
}

void draw() {
  //if 
  if (mousePressed) {
    image(img, mouseX, mouseY);
  } else {
  }
/*  
  // Displays the image at its actual size at point (0,0)
  image(img, 0, 0);
  // Displays the image at point (0, height/2) at half of its size
  image(img, 0, height/2, img.width/2, img.height/2);*/
}
