
void setup() {
  size(300, 300);
  background(252, 251, 234);
  smooth();
}

void draw() {
  noStroke();
  fill(232, 72, 65);
  quad(69, 0, 300, 0, 300, 222, 68, 221);


  fill(63, 149, 193);
  quad(0, 221, 67, 221, 67, 300, 0, 300);

  fill(247, 218, 46);
  quad(277, 266, 300, 266, 300, 300, 277, 300);

  stroke(69, 59, 58);
  fill(0);
  strokeCap(SQUARE);
  strokeWeight(7);
  line(69, 0, 67, 300);
  strokeWeight(12);
  line(0, 95, 68, 95);
  strokeWeight(6);
  line(0, 221, 300, 222);
  strokeWeight(6);
  line(277, 222, 277, 300);
  strokeWeight(8);
  line(277, 266, 300, 266);
}
