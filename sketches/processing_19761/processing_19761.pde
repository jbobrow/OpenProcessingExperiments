
//drag the mouse around the screen to create a trail of letters; click and hold the mouse button to change letters
void setup() {
  size(250, 250);
  PFont font; 
  font = loadFont("Garamond-48.vlw");
  background(#A40B54);
  textFont(font, 60);
  fill(#F0B300, 200);
  text("N5Y 1R5", -110, 40);
  text("N5Y 1R5", -110, 180);
  text("N5Y 1R5", -110, 110);
  text("N5Y 1R5", -110, 250);
  fill(#E46F0A, 200);
  text("N5Y 1R5", -110, 75);
  text("N5Y 1R5", -110, 215);
  text("N5Y 1R5", -110, 145);
  
  fill(#E46F0A, 200);
  text("N5Y 1R5", 110, 40);
  text("N5Y 1R5", 110, 180);
  text("N5Y 1R5", 110, 110);
  text("N5Y 1R5", 110, 250);
  fill(#F0B300, 200);
  text("N5Y 1R5", 110, 75);
  text("N5Y 1R5", 110, 215);
  text("N5Y 1R5", 110, 145);
  textFont(font, 30);
}

void draw() {
  if(mousePressed) {
    fill(#11766D);
    text("1R5", mouseX, mouseY);
  } else {
    fill(#410936);
    text("N5Y", mouseX, mouseY);
  }
}


