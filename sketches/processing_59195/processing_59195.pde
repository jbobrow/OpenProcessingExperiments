
void setup () {
size(100,100);
smooth();
}

void draw() {
  background(250,249,240);
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  noStroke();
  fill(165,17,17);
  rect(0, s, 10, 10);
  fill(7,5,160);
  rect(30, m, 20, 20);
  fill(0,113,12);
  rect(70, h, 30, 30);
}

