
float x;
float y;

float t1 = 0;
float t2 = 0;
float r = 10;

void setup() {
  size(420, 420);
  background(255);
  smooth();
  noStroke();

  frameRate(100);
}

void draw() {
  r = random(10);
  t1 = random(TWO_PI);

  pushMatrix();
  translate(width/2, height/2);

  calc(t1);

  noStroke();
  fill(random(255), random(255), 255);
  ellipse(x, y, 10, 10);


  r = 10;
  calc(t2);

  fill(random(255));
  ellipse(x, y, 10, 10);

  popMatrix();

  t2 += 0.01;
}

void calc(float t) {
  // t = 0 -> x = 210 , y = 160
  x = r *(16 * sin(t) * sin(t) * sin(t)) + random(-5, 5);
  y = -1 * r * (13 * cos(t) - 5 * cos(2*t) - 2 * cos(3 * t) - cos(4 * t) ) +  random(-5, 5);
}

