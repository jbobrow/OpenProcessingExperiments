
float c=2;
float b=400;
float a=0;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {

  for (int i=0; i<50; i++) {
    if (i<25) {
      stroke (255, 0, 0);
    } else {
      stroke (0, 255, 0);
    }
    c=c+0.5;
    noFill();
    ellipse(i*50, i*50, c, c);
  }


  b=b-5;
  noFill();
  stroke(0, 255, 0);
  line(0, 400, b, 0);

  a=a+5;
  noFill();
  stroke(255);
  line(400, 0, a, 400);
}

