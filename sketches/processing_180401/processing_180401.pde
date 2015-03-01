
void setup () {
  size (600, 600);
  smooth();
  noLoop();
}

void draw () {

  background (#57385c);
  stroke(#ffedbc, 60);

  foo5(width/2, height/2, 250, 2000);
}

void foo5(float centerX, float centerY, float radius, int num) {
  int i = 0;
  while
    (i < num) {
    float angle1 = random (0, TWO_PI);
    float x1 = centerX + cos(angle1) * radius;
    float y1 = centerY + sin(angle1) * radius;
    float angle2 = random(0, TWO_PI);
    float x2 = centerX + cos(angle2) * radius;
    float y2 = centerY + sin(angle2) * radius;
    line(x1, y1, x2, y2);
    i = i + 1;
  }
}

void mousePressed() {
  redraw();
}

