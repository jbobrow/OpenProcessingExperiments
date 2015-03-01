
float a=200;
float b=200;
float c=200;
float d=200;
float e=400;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {


  a=a-50;
  stroke(255, 0, 0);
  line(200, 200, a, 0);

  b=b+50;
  stroke(0, 0, 255);
  line(200, 200, 0, b);

  c=c+50;
  stroke (0, 255, 0);
  line(200, 200, c, 400);

  d=d-50;
  stroke(0);
  line(200, 200, 400, d);

  for (int i=0; i<100; i++) {
    if (i<50) {
      stroke(30, 100, 200);
    } else {
      stroke(200, 30, 150);
    }
    e=e-10;
    noFill();
    rectMode (CENTER);
    rect(200, 200, i*100, e);
  }
}

