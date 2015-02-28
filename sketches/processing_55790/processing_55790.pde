
void setup() {
  size(500, 500);
  smooth();
  fill(0);
  frameRate(120);
}
void draw() {
  fill(#000000, 10);
  rect(0, 0, 500, 500);
  float color_red = mouseX;
  float color_blue = mouseY;
  float color_green = mouseX/45.8;
  float rad = dist(mouseX, mouseY, width/2, height/2);
  float mouse_angle = atan2(mouseY-height/2, mouseX-width/2);
  int numThings = 3600;
  float angle = TWO_PI / numThings;

  if (!mousePressed) {
    for (int i = 0; i < numThings; i++) {
      float dx = width/2 + rad * cos(frameCount/34.7) * i * angle;
      float dy = height/2 + rad * sin(frameCount/34.7) * i * angle;
      fill(random(255), random(255), random(255), 100);
      noStroke();
      ellipse(dx, dy, 20, 20);
    }
  }
}
void keyPressed() {
  if (key == ' ') {
    saveFrame("myframe-####.png");
  }
}


