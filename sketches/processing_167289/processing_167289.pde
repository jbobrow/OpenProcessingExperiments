
float a=0;
float b=20;
float c=0;
float d=0;

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



  b = b+10;
  c = c+10;
  fill(255, 0, 0);
  rect(b, c, 20, 20);

  fill(255, 0, 0);
  rect(c, b, 20, 20);

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

