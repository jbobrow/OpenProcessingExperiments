
void setup () {
  smooth();
  size(300, 300);
}

int a = 10;

void draw() {
  colorMode(HSB, width+50);
  background(0);

  //Draw ellipse that grows proportionally and changes color as mouseX approaches "width"
  for (int x = 27; x < 290; x+=20) {
    fill(255, 50);
    strokeWeight(3);
    stroke(mouseX, 255, 255);
    ellipse(x, x, mouseX, mouseX);

  //Draw bounding line that becomes translucent as mouseX approaches "width"
  }
  for (int x = 0; x<width-5; x+=5+mouseX) {
    strokeWeight(2);
    stroke(mouseX, 255, 255, mouseX);
    line (x, 0, x, width);

  //Draw bounding line that becomes opaque as mouseX approaches "width"
  }
  for (int y = 0; y<height-5; y+=5+mouseX) {
    strokeWeight(2);
    stroke(mouseX, 255, 255, 250-mouseX);
    line (0, y, height, y);
  }
}


