
void setup() {
  size(640, 640);
  noStroke();
}

void draw() {
  fill(255, 40);
  rect(0, 0, width, height);
  fill(0, 75);
  translate(width/2, height/2);
  for (int x = -180; x <= 180; x+=10) {
    for (int y = -180; y <= 180; y+=10) {
      float d = dist(x, y, 0, 0);
     // ellipse(sin(radians(d+frameCount))*x, cos(radians(d+frameCount))*y, 7, 7);
      ellipse(cos(radians(d+frameCount))*y, sin(radians(d+frameCount))*x, 7, 7);
    }
  }
}



