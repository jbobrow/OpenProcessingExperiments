
PImage floresta;
/**
 * Scale Shape.  
 * Move the mouse left and right to zoom the SVG file.
 * This shows how, unlike an imported image, the lines
 * remain smooth at any size.
 */
PShape bot;

void setup() {
size(800, 600);
  
floresta = loadImage("floresta.jpg");
  
smooth();
bot = loadShape("bot1.svg");
} 

void draw() {
background(255);
  
image(floresta, 0, 0);
  
translate(width/2, height/2);
float zoom = map(mouseX, 0, width, 0.1, 4.5);
scale(zoom);
shape(bot, -140, -140);
}

