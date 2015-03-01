
/* @pjs preload="obama.png"; */
PImage obama;


void setup() {
//  PImage obama;
  obama = loadImage("obama.png");
  size(500, 500);
  noStroke();
  background(0);
}
void draw() {
  for (float i = 0; i < 100; i+=3) {
    if (mousePressed == true) {
      tint(255, 6);
      image(obama, mouseX + i*i, mouseY + i*i, 60, 79);
    } else {
      fill(135,215,115, 4);
      ellipse(mouseX + i*i, mouseY + i*i, i*4, i*4);
  }
}
}


