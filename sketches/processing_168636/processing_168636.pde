
void setup() {
  size(500, 500);
  background(255);
  translate(250, 250);
  stroke(0, 0, 100);
  for (int i=0; i<490; i=i+10) {
    rotate(5);
    line(0, 0, 400, 400);
  }
  strokeWeight(3);
  stroke(200, 0, 0);
  rotate(-245);
  translate(-250, -250);
  line(200, 0, 200, 500);
  line(300, 0, 300, 500);
}
