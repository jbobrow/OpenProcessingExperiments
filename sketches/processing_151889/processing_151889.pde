
// colors here are for reference only, used below as base colors, actual variables are not used
color pink = color(255, 154, 173);
color blue = color(170, 224, 255);
color purple = color(225, 160, 255);

void setup() {
  size(500, 500);
  noStroke();
  background(255);
}

void draw() {
  // rectangle that follows mouse horizontal movement
  rectMode(CORNER); 
  fill(170, 244, mouseY, 10); // blue changes according to mouseY, is semi transparent
  rect(mouseX, 0, 250, 500);
  
  // rectangle that follows the mouse vertical movement
  rectMode(CORNER); 
  fill(mouseY, 160, 255, 10); // red changes according to mouseY, is semi transparent
  rect(0, mouseY, 500, 250);
  
  // rectangle that follows the mouse
  rectMode(CENTER); // so rectangle is centered around mouse
  fill(255, 20); // white, semi transparent
  rect(mouseX, mouseY, 200, 200);
}


