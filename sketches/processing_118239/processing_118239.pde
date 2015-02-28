
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="moonwalk.jpg"; */ 

PImage img;  // Declare variable "a" of type PImage

void setup() {
  size(800, 400);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("http://1.bp.blogspot.com/-dDd0vRVP38w/UIU8dtZCLzI/AAAAAAAAABs/BI_i9n3tDTE/s1600/800px-Resistencia_svg.png");  // Load the image into the program  
}

void draw() {
  // Displays the image at its actual size at point (0,0)
  image(img, 0, 0);
  // Displays the image at point (0, height/2) at half of its size
  image(img, 0, height/2, img.width/2, img.height/2);
}
