
void setup() {
  size(270, 600);
  noStroke();
  smooth();
  frameRate(10);
}

void draw() {
  for (int x=0; x<width; x+=30) {
    for (int y=0; y<height; y+=40) {
      leaf(x, y, 15);
    }
  }
}

void leaf(int x, int y, int r) {
  fill(random(255));
//  strokeWeight(5);
  arc(x, y, r, r, PI, TWO_PI - HALF_PI);
  arc(x, y, r+20, r-20, PI, TWO_PI - HALF_PI);
  arc(x+20, y+20, r, r, PI, TWO_PI - HALF_PI);
  line(x, y, x, y-r);
  line(x, y, x-r, y);
}

