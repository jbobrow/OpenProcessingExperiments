
int x, y, r;


void setup() {
  size(500, 500);
  background(0);
  smooth();
  ellipseMode(CENTER);
  noStroke();
}

void draw() {
  for (y=1; y<5; y++) {
    for (x=1; x<5; x++) {
      for (r=10;r>1; r--) {
        fill(255);
        if (r%2==1) {
          fill(255, 0, 0);
        }
        ellipse(x*100, y*100, r*8, r*8);
     }
    }
  }
}
