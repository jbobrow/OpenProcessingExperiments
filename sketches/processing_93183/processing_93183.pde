
void setup () {
 size(1000, 1000);
}

void dob (int a, int b, int x) {
  rect (a, b, x, x);
  rotate(radians(10));
}


void draw () {
  colorMode(HSB, 100, 100, 100);
  background(50*(frameCount % 3), 100, 100);
  translate (500, 500);
  for(int i = 0; i < 100; i++) {
  fill(i, 100, 100);
  dob(100, 100, 50);
  translate(i, i);
  }
}
