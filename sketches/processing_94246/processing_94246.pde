
void setup() {
  size (850, 500);
  strokeWeight(20);
  background(70);
  smooth();
}

float n;

void draw() {
  //background(180);
  n += 0.01;
  
  translate(width * .5, height * 0.5);
  scale(0.2);
  stroke(cos(n)*255, -sin(n)*255, -cos(n)*255);
  
  line (x(-cos(n)), y(-cos(n) * sin(n)), x(-sin(n)),y(cos(n)));
  line (x(cos(n)), y(cos(n) / sin(n)), x(-sin(n)),y(-cos(n)));
  
  translate(-width, 0);
  line (x(-cos(n)), y(-cos(n) + sin(n)), x(-sin(n)),y(-cos(n)));
  line (x(cos(n)), y(-cos(n) - sin(n)), x(-sin(n)),y(-cos(n)));
  
  translate(-width, 0);
  line (x(-cos(n)), y(-cos(n) + sin(n)), x(-sin(n)),y(-cos(n)));
  line (x(cos(n)), y(cos(n) - sin(n)), x(-sin(n)),y(-cos(n)));
  
  translate(width * 3, 0);
  line (x(-cos(n)), y(-cos(n) * sin(n)), x(sin(n)),y(-cos(n)));
  line (x(cos(n)), y(cos(n) - sin(n)), x(-sin(n)),y(-cos(n)));
  
  translate(width, 0);
  line (x(-cos(n)), y(-cos(n) * sin(n)), x(sin(n) * cos(n)),y(-cos(n)));
  line (x(-cos(n)), y(cos(n) + sin(n)), x(-sin(n)),y(-cos(n)));
}

float x (float n) {
  float is = 300 * n;
  return is;
}

float y (float n) {
  float is = 300 * n;
  return is;
}
