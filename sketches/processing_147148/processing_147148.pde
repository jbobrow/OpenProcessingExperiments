
void setup() {
  size(800, 800);
  background(255);
  fill(50, 50, 150);
  smooth();
  frameRate(10);
}

void draw() {

  stroke(random(0, 150));
  strokeWeight(1);
  for (int i = 50; i < width ; i=i+100) {    // (i++ = i=i+1)
    for (int j = 50; j < height ; j=j+100 ) {

      line(i, j, 400, random(0, 800));
    }
  }
}

