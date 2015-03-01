
float c=2;
float b=400;
float a=0;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {

  for (int i=0; i<50; i++) {
    if (i<20) {
      stroke (255, 0, 0);
    } else {
      c=c+3;
      stroke (0);
    }

    noFill();
    ellipse(i*50, i*50, c, c);
  }
}

