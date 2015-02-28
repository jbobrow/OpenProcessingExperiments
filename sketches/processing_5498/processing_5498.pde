
/**
 * Painterly:
 * Uses the mouse to 'paint' a photograph.
 */


PImage canvas, palette;
PFont font;
int brushSize = 5;

void setup() {
  size(700, 525);
  frameRate(300);
  font = loadFont("MyriadPro-Cond-20.vlw");
  canvas = loadImage("Canvas.jpg");
  palette = loadImage("Iceland.jpg");
  background(canvas);
  textAlign(CENTER, BASELINE);
  textFont(font, 20);
  fill(0);
  text("press + or - to change brush size", 350, 495);
  text("press r to reveal photograph", 350, 515);
}

void draw() {
  smooth();
  strokeWeight(brushSize);
  if(mousePressed) {
    int paint = palette.get(mouseX, mouseY);
    stroke(paint);
    line(pmouseX,pmouseY,mouseX,mouseY);
  } 
  if(keyPressed) {
    if (key == '+') {
      brushSize++;
      strokeWeight(brushSize);
    }
    if (key == '-' && brushSize > 1) {
      brushSize--;
      strokeWeight(brushSize);
    }
    if (key == 'r') {
      background(palette);
    }
  } 
}



