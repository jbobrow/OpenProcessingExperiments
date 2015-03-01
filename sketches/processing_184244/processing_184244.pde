
// Haus ohne Nikolaus
// 02.12.2014

size(300,300);
background(0,154,188);
void draw() {
  background(204);
  int s = second(1-5);  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  line(s, 0, s, 33);
  line(m, 33, m, 66);
  line(h, 66, h, 100);

}
