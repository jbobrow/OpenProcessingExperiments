
PImage bg;
PFont font;

void setup() {
  size(750, 600);
  smooth();
  noStroke();
  bg = loadImage("cursive.jpg"); //Selects background image
  image(bg,0,0); //Displays background image
  font = loadFont("SansSerif-13.vlw"); //Selects font
}

void draw() {
}

void mouseMoved() {
  tint(255,127); //makes image slightly transparent for motion blur
  image(bg,0,0); //displays background image
  fill(#ff0036); //font colour
  textFont(font); 
  text("drag the mouse to write", 300, 560); //displays type 
  noStroke();
  fill(0);
  ellipse(mouseX, mouseY, 5, 5); //displays circle that follows mouse
}  

void mouseDragged(){ // changes properties when mouse is dragged
  fill(255);
  rect(0,535,750,65); //rectangle at the bottom to hide type
  fill(#ff0036);
  ellipse(mouseX, mouseY, 5, 5); //displays red circle
}



