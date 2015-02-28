
void setup() {
  size(300, 100);
  background(0);
}

void draw() {
  float h = map(hour(), 0, 24, 200, 40 );
  // 24hours to 200 - 40
  float m = map(minute(), 0, 60, 0, 250);
  float s = map(second(), 0, 60, 0, 250);

  for ( int i = 0; i < height; i++ ) {

    float a1 = map( i, 0, height, 0, 1);
    a1 = a1 * 256;
    stroke( color(s, h, m, a1 ));
    line(0, i, width, i );
    stroke( color(m, 100, 100, a1 ));
    line(0, i, width, i );
  }
}


