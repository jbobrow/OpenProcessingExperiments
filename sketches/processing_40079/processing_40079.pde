
// Credit to Nick Senske for providing dotFilter code which I used to base this drawing on.

PImage pic;

void setup() {
  size(300, 300);
  pic = loadImage("flower.jpg"); // picture of orchids
  noStroke();
  smooth();
}

int cell = 8; // pixel size

void draw() {

  background(pic); // background is the picture for a visual reference

  if (mousePressed) { //interactive sketch
    background(255); //mouse click change background of flower to white

    for (int y=cell; y <= width; y+=cell) {    
      for (int x=cell; x <= width; x+=cell) {

        //makes the colors the same as in the flower picture
        color myFill = color(pic.pixels[x + (y * width)]);
        fill(myFill);

        // Nick Senske's comments from the got dotFilter
        // brightness is from 0-255, so by dividing it by 255, we end up with a decimal fraction from 0.0-1.0
        // multiply this fraction time cell, and when brightness is maximum (1.0), cell is our maximum possible radius size
        float radius = cell * (brightness(pic.pixels[x + (y * width)]) / 255);
        ellipse(x, y, radius, radius);
      }
    }
  }
  
  //If mouse is not pressed then draw this (same code above just changes circle fill
  else {
    for (int y=cell; y <= width; y+=cell) {    
      for (int x=cell; x <= width; x+=cell) {

        fill(255);

        float radius = cell * (brightness(pic.pixels[x + (y * width)]) / 255);
        ellipse(x, y, radius, radius);
      }
    }
  }
}


