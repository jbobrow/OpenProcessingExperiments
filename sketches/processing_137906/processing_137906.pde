
/* The theme of this project was to go from darkness to light.
By dragging the mouse over the top image, the background image 
is displayed. This was done by copying the pixels. In the next attempt,
I will experiment with changing the forground pixel to transparent,
to see if that will speed up the sketch.
*/
/* @pjs preload="sunrise.jpg"; */
/* @pjs preload="darkness.jpg"; */

PImage bg;
PImage top;

void setup() {
  size(854, 643);
  bg = loadImage("sunrise.jpg");
  top = loadImage("darkness.jpg");
  background(bg);
}

void draw() {
  image(top, 0, 0);
}

void mouseDragged() { 
  eraseFunction();
}


void eraseFunction() {
  top.loadPixels();
  for (int x=0; x<top.width; x++) {
    for (int y=0; y<top.height; y++ ) {
      float distance = dist(x, y, mouseX, mouseY);
      if (distance <= 50) {
        int loc = x + y*top.width;
        top.pixels[loc] = bg.pixels[loc];
      }
    }
  }
  top.updatePixels();
}
// Printscreen
  void keyPressed() {
    if (key == 's' || key == 'S') {
      save("screenshot.png");
      
    }
  }


