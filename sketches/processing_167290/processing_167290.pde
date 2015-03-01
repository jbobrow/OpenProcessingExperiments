
float a=0;
float b=20;
float c=0;
float d=0;
float e=20;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {

  d=d+10;
  stroke(0);
  line(0, d, 400, d);


  stroke(0);
  line(d, 0, d, 400);

//Don´t know how to associate this variable inside the rectangle line
  for (int i=0; i<10; i++) {
    if (i<5) {
      e=e*3;
    } else {
      e=e-100;
    }
    b = b+10;
    c = c+10;
    fill(255, 0, 0, 20);
    rect(b, c, e, e);

    fill(0, 0, 255, 20);
    rect(c, b, e, e);
  }

  a = a+5;
  stroke(255, 0, 0);
  fill(0);
  rect(a, a, 20, 20);

  stroke(255, 0, 0);
  noFill();
  ellipseMode(CENTER);
  ellipse(400, 0, b, b);

  stroke(255, 0, 0);
  noFill();
  ellipseMode(CENTER);
  ellipse(0, 400, b, b);
}

