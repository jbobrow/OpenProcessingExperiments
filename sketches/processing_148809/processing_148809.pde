
color[] colors = {#7D8A2E, #C9D787, #FFFFFF, #FFC0A9, #FF8598};
int theSize = 10;

void setup() {
  size(800, 600);
  noLoop();
}

void draw() {
  noStroke();
  for(int i=0; i<=80; i++) {
    for(int j=0; j<=60; j++) {
      int r = (int) random(5);
      fill(colors[r]);
      rect(i*theSize, j*theSize, theSize, theSize);
    }
  }
}


