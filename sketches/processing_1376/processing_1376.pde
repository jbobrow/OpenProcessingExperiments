
/**
 * Scale Shape.  
 * Illustration by George Brower. 
 * 
 * Move the mouse left and right to zoom the SVG file.
 * This shows how, unlike an imported image, the lines
 * remain smooth at any size.
 */

PShape bot;

void setup() {
  size(900, 360);
  smooth();
  // The file "bot1.svg" must be in the data folder
  // of the current sketch to load successfully
  bot = loadShape("bot1.svg");
} 

void draw() {
  background(102);
  translate(width/1.25, height/2);
  float zoom = map(mouseX, 0, height, 1, 0.05);
  scale(zoom);
  shape(bot, -140, -140);
}

