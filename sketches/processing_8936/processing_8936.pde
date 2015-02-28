
void setup() {
  size(200, 300);
}

void draw() {
  background(0);
  int s = second();
  int m = minute();
  float h = hour();
  noStroke();
  fill(#0000FF);
  quad(10, 10, 10, 50, 10 + h*7.5, 50, 10 + h*7.5, 10);
  fill(#FF0000);
  quad(10, 110, 10, 150, 10 + (m*3), 150, 10 +(m*3), 110);
  fill(#008000);
  quad(10, 210, 10, 250,  10 + s*3, 250,  10 + s*3, 210);
  stroke(255);
  strokeWeight(1);
  line(10, 10, 190, 10);
  line(10, 50, 190, 50);
  line(10, 110, 190, 110);
  line(10, 150, 190, 150);
  line(10, 210, 190, 210);
  line(10, 250, 190, 250);
  for(float a = 10.0; a <= 190.0; a += 7.5) {
    line(a, 10, a, 50);
  }
  for(int b = 10; b<= 190; b += 3) {
    line(b, 110, b, 150);
    line(b, 210, b, 250);
  }
}

