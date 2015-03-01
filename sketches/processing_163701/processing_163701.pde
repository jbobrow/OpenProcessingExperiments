

float y = 0.0;

void draw() {
  frameRate(4);
  println(frameRate);
  background(y*7, y*10, y*2.5);
  line(0, y, 100, y);
  y = y + 0.5;
  ellipse(0, y, 100, y);
  if (y > 100) {
    y = 0;
  }
}



