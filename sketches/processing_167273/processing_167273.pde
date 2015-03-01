
float c=2;
float b=400;
float a=0;

void setup() {
  size(400, 400);
  background(0);
}

void draw() {

  for (int i=0; i<100; i++) {
    if (i<50) {
      stroke (255, 0, 0);
    } else {
      stroke (255);
    }
    c=c+1;
    noFill();
    ellipse(i*100, i*100, c, c);
  }


  b=b-5;
  noFill();
  stroke(0, 255, 0);
  line(0, 0, b, 400);

  a=a+5;
  noFill();
  stroke(255);
  line(400, 400, a, 0);
}

