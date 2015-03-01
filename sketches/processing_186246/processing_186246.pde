
// The next line is needed if running in JavaScript Mode with Processing.js- credit from Processing.org help
/* @pjs preload="cat.png"; */ 

PImage img;  // Declare variable "a" of type PImage

void setup() {
  size(550, 550);
  background(0);
  img = loadImage("cat.png");  // Load the image into the program  
  // The image file must be in the data folder of the current sketch to load 
}

void draw() {
  image(img, random(500), random(500), random(img.width/4), random(img.height/4));
  // Displays the image at random points at 1/4 of its size
}


