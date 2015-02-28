
float angle = 0;

void setup () {
  size(400, 400);
  background(255);
  fill(255, 255, 255, 10);
  stroke(0, 0, 0, 50);
  smooth();
}

void draw () {
  rect(0, 0, 400, 400);
  translate(200, 200);
  rotate(radians(angle));
  scale(10 + (8 * cos(radians(angle))));
  for (int i = 0; i < 400; i += 10) {
    line(i - 200, -200, i - 200, 200); 
    line(-200, i - 200, 200, i - 200);
  }
  filter(DILATE);
  angle++;
}



