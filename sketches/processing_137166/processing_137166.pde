
float Wave;
float angle;
float radius = 1;
float frequency = 6;
float l;
float x;


void setup() {
  size(800, 800);
  background (255);
}

void draw() {

  l = 400 + sin(radians(angle))*(radius);

  //  l = inital start + aplitude*sin(frequency*x);

  //  background(24);
  angle -= frequency;
  x+=2;
  radius-= .15;

  //  Wave = l;
  //
  //  float Wave = map(l, 0, 1023, 0, 255);

  ellipse(x, l, 1, 1);

  println(l);
  println(x);

  if (x>width) {
    x=0;
  }
}



