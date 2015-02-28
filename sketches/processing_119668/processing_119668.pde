
/**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */
 
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="moonwalk.jpg"; */ 

PImage img;  // Declare variable "a" of type PImage
HLine h1 = new HLine(20, 2.0); 
HLine h2 = new HLine(50, 2.5); 

void setup() {
  size(640, 360);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("moonwalk.jpg");  // Load the image into the program  
  
}

void draw() {
  // Displays the image at its actual size at point (0,0)
  image(img, 0, 0);
  // Displays the image at point (0, height/2) at half of its size
  image(img, 0, height/2, img.width/2, img.height/2);
  h1.update();
  h2.update();
}
class HLine { 

  float ypos, speed; 

  HLine (float y, float s) {  

    ypos = y; 

    speed = s; 

  } 

  void update() { 

    ypos += speed; 

    if (ypos > height) { 

      ypos = 0; 

    } 

    line(0, ypos, width, ypos); 

  } 

}


