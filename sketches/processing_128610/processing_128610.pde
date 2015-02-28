
/**
This is a very simple example of how to load an image and display it
in Processing.

C. Andrews
2014-01-16
**/

PImage img; // create  PImage variable
void setup(){
  size(600,600);
  img = loadImage("cole2.jpg"); // load the image into the variable
}


void draw(){
  background(255);

  image(img, 5,5); // display it
  
}


