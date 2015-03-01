
float a=20;
float b=10;
float c=10;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {

  for (int i=0; i<20; i++) {
    for (int j=0; j<20; j++) {

      noFill();
      stroke(50);
      rectMode(CENTER);
      rect(200, 200, i*20, j*20);
    }
  }

  a=a+12;
  stroke(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(200, 200, a, a);

  b=b+12;
  stroke(0, 255, 0);
  ellipseMode(CENTER);
  ellipse(200, 200, b, b);


  c=c+6;
  stroke(0);
  ellipseMode(CENTER);
  ellipse(100, 100, c, c);

  ellipseMode(CENTER);
  ellipse(300, 300, c, c);

  ellipseMode(CENTER);
  ellipse(300, 100, c, c);

  ellipseMode(CENTER);
  ellipse(100, 300, c, c);
}

