
/**
 In this image we see that we can load an image once and then use it 
 many many times. This example also shows how we can control the size
 of the the image when it is displayed.
 
 This builds our conventional grid, this time with the width and
 height of the individual grid cells being controlled independantly
 by the x and y movement of the mouse. In each grid cell, we squeeze
 one copy of our image inside.
 
 C. Andrews
 2014-01-16
 
 **/


PImage img;
void setup() {
  size(600, 600);
  img = loadImage("cole2.jpg");
}


void draw() {
  background(255);
  // the number of grid ceels can range from 1 to 100
  float numCellsX = map(mouseX, 0, width, 1, 100);
  float numCellsY = map(mouseY, 0, height, 1, 100);

  // determine how big they are
  float stepSizeX = width / numCellsX;
  float stepSizeY = height/ numCellsY;

  // use a nested for loop to visit each cell
  for (float y = 0; y <= height;y+=stepSizeY) {
    for (float x = 0; x <= width;x+=stepSizeX) {
      // draw the image filling the cell
      image(img, x, y, stepSizeX, stepSizeY);
    }
  }
}



