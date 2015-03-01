
/*
  MFADT BOOTCAMP Day02 HOMEWORK2 by Sherry Zhang
  There will be a fancy random pattern and you can capture it by pressing any key. 
 */

void setup() {
  size(600, 800);
}

void draw() {
  line(mouseX+mouseY, pmouseX, mouseX-mouseY, pmouseY);
}

void keyPressed() {
  saveFrame();
}

