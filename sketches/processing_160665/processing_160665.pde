
//Working with a font

PFont fontVariable;
PImage imageVariable;


void setup() {
  size(600, 600);
  fontVariable = loadFont("font.vlw");
  imageVariable = loadImage("cage.jpg");
  textFont(fontVariable, 42);
  fill(255, 0, 0);
}


void draw() {
  
  image(imageVariable, 0, 0);
  text(mouseX, mouseX, mouseY);
  text(mouseY, mouseX, mouseY+50);
  //text(thingToDraw, xPos, yPos);
}



