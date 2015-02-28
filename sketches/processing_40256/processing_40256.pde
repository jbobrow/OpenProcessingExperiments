
PImage pic;

void setup() {
  size(300, 300);
  pic = loadImage("looking up.JPG"); // image of looking up at a tree
  smooth();
}

int that = 8; // pixel size

void draw() {
  noStroke();
  background(pic); 


  if (mousePressed) { //interactive sketch
    background(0); //changes background to black
    strokeWeight(2);//creates stroke around grid of pixels

    for (int y=that; y <= width; y+=that) {   
      for (int x=that; x <= width; x+=that) {

        //makes the grid of stroke outlines to correspond with color from the image
        color myFill = color(pic.pixels[x + (y * width)]);
        fill(0);
        stroke(myFill);

        // brightness is from 0-255, so by dividing it by 255, we end up with a decimal fraction from 0.0-1.0
        // multiply this fraction time cell, and when brightness is maximum (1.0), cell is our maximum possible radius size
        float radius = that * (brightness(pic.pixels[x + (y * width)]) / 100);
        rect(x, y, radius, radius);// changes ellipses to stroked rectangles
      }
    }
  }

  //If mouse is not pressed then draw this (same code above just changes circle fill
  else {
    for (int y=that; y <= width; y+=that) {   
      for (int x=that; x <= width; x+=that) {

        fill(255);//creates white background

        float radius = that * (brightness(pic.pixels[x + (y * width)]) / 255);
        ellipse(x, y, radius, radius);
      }
    }
  }
}


