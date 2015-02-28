
int a = 50;


void setup() {
  size(800, 800);
  background(0);
}

void draw () {
  while (a <= 600 ) {
    int b = 100;
    while (b <= 600 ) {
      stroke(random(0, 225), 100, 200);
      line (a, b, 10, 10);
      b = b+ 50;
    }
    a = a + 50;

    if ( a <= 300 && a >= 500) {
      a = 700;
    }
  }
}





