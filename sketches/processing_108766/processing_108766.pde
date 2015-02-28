
void setup() {
  size(800, 800);
  background(255);
}

void draw() {
  for (int square = 800; square > 0; square = square - 10) {
    int trans = 10;
    rectMode(CENTER);
    fill(square/4, 0, 111, trans);
    rect(width/2, height/2, square, square);

    fill(square/4, 0, 255, trans);
    rect(width/2, height/2, square-5, square-5);
  }

  for (int x = 50; x < 800; x = x + 50) {
    for (int y = 750; y > 0; y = y - 50) {
    for (int a = 100; a > 0; a = a - 10) {
      int b = a - 5;
      int c = 2;
      fill(a/3, 138, 255, c);
      ellipse(x, y, a-5, a-5);
      fill(b/3, 233, 255, c);
      noStroke();
      ellipse(x, y, a, a);



      //SPINWHEEL
       arc(x, y, a, a, TWO_PI, TWO_PI+QUARTER_PI/2);
      arc(x, y, a, a, TWO_PI+QUARTER_PI, TWO_PI+QUARTER_PI+QUARTER_PI/2);
      arc(x, y, a, a, TWO_PI+HALF_PI, TWO_PI+HALF_PI+QUARTER_PI/2);
      arc(x, y, a, a, TWO_PI+HALF_PI+QUARTER_PI, TWO_PI+HALF_PI+QUARTER_PI+QUARTER_PI/2);
      arc(x, y, a, a, PI, PI+QUARTER_PI/2);
      arc(x, y, a, a, PI+QUARTER_PI, PI+QUARTER_PI+QUARTER_PI/2);
      arc(x, y, a, a, PI+HALF_PI, PI+HALF_PI+QUARTER_PI/2);
      arc(x, y, a, a, PI+HALF_PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI+QUARTER_PI/2);
    }
  }
  }
}
