
void setup() {
  //size of window
  size(900, 900);
  //color mode
  colorMode(HSB);
  //change background color
  background(0);
}

void draw() {
  //color spit out by mouse into circles
  fill(mouseX/3, 255, 255, 80);
  //size of dots
  ellipse(mouseX, mouseY, 100, 100);
  ellipse(mouseY, mouseX, 70, 70);
  ellipse(height-mouseY, width-mouseX, 60, 60);
  ellipse(width-mouseX, height-mouseY, 50, 50);
  ellipse(height-mouseY, mouseX, 30, 30);
  ellipse(mouseX, height-mouseY, 20, 20);
  ellipse(mouseY, width-mouseX, 40, 40);
  ellipse(width-mouseX, mouseY, 90, 90);
}
