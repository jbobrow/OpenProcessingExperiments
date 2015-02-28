
void setup() {
  size (100, 100);
  background (255);
  fill (255);
  smooth ();
}

void draw() {
  for (float x = 20; x <= 80; x= x+5) {
    if (x <= 50) {
      line ( x, 20, x, 60);
    }
     else {
      line ( x, 40, x, 80);
    }
  }
}






