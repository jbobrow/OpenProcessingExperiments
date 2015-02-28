
void setup() {
  size (500, 500);
  background(0);
  smooth();
  stroke(100);
  line(0, height*.75, 500, height*.75);
}

void draw() {
}

void mousePressed() {
  float a=(random(width));
  float b=(random(width));
  float d=(random(100));

  for (int x=0; x<width; x+=50) {
    for (int y=0; y<height; y+=50) {
      int c=floor(random(1, 255));

      if (c<=5) {
        stroke(200, 150, 0, 75);
        line(a, height*.75, random(0, 500), 500);
        fill(0, 200, 150, 75);
        arc(a, height*.75, d, d, 0, PI);
      }

      if (c>=250) {
        stroke(0, 200, 150, 75);
        line(b, height*.75, random(0, 500), 0);
        fill(200, 150, 0, 75);
        arc(b, height*.75, d, d, PI, TWO_PI);
      }
    }
  }
}


