
float x, y;
float a, b;

void setup() {
  size(300, 300);
  background(255);
  x = width/8;
  y = height/8;
  a = width*7/8;
  b = height*7/8;
}

float count = 1000;
float circle;
float rndColor;

void draw() {
  noStroke();
  if (count > 0) {
    rndColor = random(50);
    if (rndColor > 100) {
      fill(0, 121, 69, 10);
    }
    else {
      fill(0, 120, 100, 10);
    }
    circle = random(10, 50);
    ellipse(random(width), random(height), circle, circle);
  }
  count--;

  stroke(1);
  fill(255);
  rectMode(CORNERS);
  rect(10, 10, 50, 60);
  x = x + random(-1, 1);
  y = y + random(-1, 1);
  point(x, y);

  rect(250, 240, 290, 290);
  a = a + random(-1, 1);
  b = b + random(-1, 1);
  point(a, b);
}


