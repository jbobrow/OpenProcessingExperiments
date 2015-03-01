

float a = 50;
float b = 50;
float c = 50;
float d = 50;

void setup() {

  size(500, 500);
  background(255, 200, 100);
}

void draw() {

  stroke(c, a, b);
  arc(a, d, 500, c, d, a);
  noFill();
  a = random(a+150);
  b=b+100;
  c=c+20;
  d=random(d+0.1);
  stroke(a, a, 255);
  a=a+0.1;
}



