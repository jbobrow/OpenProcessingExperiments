
void setup() {
  size(640, 640);
  noStroke();
}

void draw() {
  fill(0, 30);
  rect(0, 0, width, height);
  fill(255, 150, 0, 3);
  translate(width/2, 0);
  for (int i = 0; i < 640; i+=2) {
    float angle = 20+sin(radians(i+frameCount*2)) * 10;
    float x = sin(radians(i+angle))*(angle*2);
    ellipse(x, i, angle, angle);
    ellipse(-x, i, angle, angle);
  }
}



