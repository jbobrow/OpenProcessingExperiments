

float y = 0.0;

void draw() {
  frameRate(44);
  println(frameRate);
  background(y*7, y*10, y*2.5);
  line(y, 0, y, 100);
  y = y + 0.5;
  rect(y, 0, y, 100);
  if (y > 100) {
    y = 0;
    noLoop();
  }
}



