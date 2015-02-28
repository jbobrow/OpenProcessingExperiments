

void setup() {
  size(1000, 800);
  background(0);

}

void draw() {
  for ( int i = 0; i < 1200; i+=20) {
    for ( int j = 0; j < 800; j+=15) {
      fill( random(0,255), random(0,255), random(0,255));
      stroke( random(0,255), random(0,255), random(0,255));
      ellipse(i, j, 20, 20);
    }
  }
}


