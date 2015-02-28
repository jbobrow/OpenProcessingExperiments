
void setup() {
  size(500, 500);
}

void draw() {
}

void mousePressed() {
  background(0);

  for (int a=0; a<width; a+=25) {
    for (int b=0; b<width; b+=25) {
      int c= floor(random(50));
      stroke(255);
      strokeWeight(3);
      point(a, b);
      strokeWeight(1);
      if (c>25) {
        stroke(0, 0, 255);
        line(a, b, a, b+25);
      }

      else {
        stroke(255, 132, 0);
        line(a, b, a+25, b);
      }
    }
  }
}


