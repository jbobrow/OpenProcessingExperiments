
float c=2;

void setup() {
  size(400, 400);
  background(0);
}

void draw() {

  for (int i=0; i<20; i++) {
    if (i<10) {
      stroke (255, 0, 0);
    } else {
      stroke (255);
    }
    c=c+10;
    noFill();
    ellipse(i*20, i*20, c, c);
  }
}

