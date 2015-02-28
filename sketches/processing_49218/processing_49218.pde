
int counter;

void setup() {  //setup function called initially, only once
  size(350, 350);
  background(255);  //ellipse(50, 50, 80, 80);
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}ellipse(50, 50, 80, 80);
                void setup() {
  size(500, 520);
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}noFill();
bezier(85, 20, 10, 10, 90, 90, 15, 80);
fill(255);
int steps = 10;
for (int i = 0; i <= steps; i++) {
  float t = i / float(steps);
  float x = bezierPoint(85, 10, 90, 15, t);
  float y = bezierPoint(20, 10, 90, 80, t);
  ellipse(x, y, 5, 5);
}
