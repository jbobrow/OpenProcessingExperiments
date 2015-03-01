
void setup() {
  size(640, 640);
  fill(255, 0, 0, 50);
  noStroke();
  background(40);
}

void draw() {
  fill(40, 5);
  rect(0, 0, width, height);
  fill(255, 10, 0, 3);
  translate(width/2, height/2);
  for (int i = 0; i < 90; i++) {
    float x = tan(radians(dist(i, i, 0, 0)+45+frameCount))*30;
    float y = sin(radians(dist(i, i, 0, 0)+frameCount))*100;
    float d = map(dist(x, y, 0, 0), 0, width/2, 20, 0);
    ellipse(x, y, d, d);
    ellipse(-x, y, d, d);
    ellipse(y, x, d, d);
    ellipse(y, -x, d, d);
  }
}



