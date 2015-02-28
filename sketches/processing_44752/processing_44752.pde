
/**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */

PImage a, c;  // Declare variable "a" of type PImage
int numpix;
float offset;

void setup() {
  size(709, 609);
  numpix = width*(height+100);

  a = loadImage("Cesaria-Evora.jpg");
  c = loadImage("PB020019.jpg");  // Load the image into the program
  a.loadPixels(); 
  for (int i = 0; i< numpix-1; i++) {
    float db = abs ( brightness(a.pixels[i]) - brightness(a.pixels[i+1]));
    if (db > 9) {

      a.pixels[i] = color(0);
    }
    else {
      a.pixels[i] = color(255);
    }
  }
  a.updatePixels(); 
  //noLoop();  // Makes draw() only run once
}

void draw() {

  image(a, 0, -100);
  float offsetTarget = map(mouseX, 0, width, - width+100, 0); // -c.width/2
  offset += (offsetTarget-offset)*0.05;
  tint(255, 153);
  image(c, offset, -100);

  //save("cesariaevora-11.PNG");
}


