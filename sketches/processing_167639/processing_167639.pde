
float x = 100.0;
float y = 50.0;
float angle = 0.0;
float speed = 0.5;

void setup() {
  size(500,500);
  background(0);
  stroke(255, 130, 50, 50);
  smooth();
  randomSeed(100);
}

void draw() {
  angle += random(-0.3, 0.3);
  x += cos(angle) * speed * HALF_PI;
  y += sin(angle) * speed;
  translate(x,y);
  rotate(angle * PI);
  line(100, -100, HALF_PI, PI);
  triangle(40, 40, PI, HALF_PI, 10, 10);
  fill(10, 10, 255, 100);
  ellipse(10*x, 10*y, PI, 10);
    ellipse(10 + (sin(angle+PI) * 5), 125, 10, 10);
  ellipse(10 + (sin(angle + HALF_PI) * 5), 155, 10,10);
  ellipse(10 + (sin(angle + QUARTER_PI) * 5), 185, 10, 10);
}



