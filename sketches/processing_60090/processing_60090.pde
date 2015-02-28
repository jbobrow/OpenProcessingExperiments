
/**
 * Scale Shape.  
 * Illustration by George Brower. 
 * 
 * Move the mouse left and right to zoom the SVG file.

 */

PShape bot;

void setup() {
  size(640, 640);
  smooth();
  // The file "12.svg" must be in the data folder
  // of the current sketch to load successfully
  bot = loadShape("12.svg");
} 

void draw() {
  background(102);
  translate(width/2, height/2);
  float zoom = map(mouseX, 0, width, 0.1, 4.5);
  scale(zoom);
  shape(bot, -140, -140);
}

