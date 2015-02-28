
/* @pjs preload="face.jpg"; */

PImage img;

void setup() {
  img = loadImage("face.jpeg");
  size(168,163);
}
void draw() {
  pushStyle();
  if (keyPressed && mousePressed) {
    if (key == 'q') {
      noStroke();
      fill(random(255),random(255),random(255));
      ellipse(mouseX, mouseY, 33, 33);
    }
  }
  }



