
void setup() {
  size(640, 640);
  stroke(255, 0, 100, 30);
}

void draw() {
  background(#1102F5);
  translate(width/2, height-180);
  for (int i = -360; i < 0; i+=12) {
    for (int q = 0; q < 360; q+=30) {
      float x = sin(radians(i)) * (360-q)/2;
      float y = -q+cos(radians(i)) * (360-q)/30;
      strokeWeight(12-q/30);
      line(0, -q+80, x, y);
    }
  }
}

