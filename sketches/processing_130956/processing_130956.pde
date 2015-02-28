
float x = -5;
float y = 5;
float r = 1;
float e = 1;

void setup() {
  size(700, 700);
  background(255);
  frameRate(120);
}

void draw() {
  x = x+10;
  translate(x, y);
  rotate((TWO_PI)/random(2));
  rectMode(CENTER);
  fill(255, 255, 0);
  if (x >= 700) {
    y = y+10;
    x = -5;
  }
  if (y >= 700) {
    y = 5;
  }
  fill(x/random(3), random(255), y/3);
  strokeWeight(0.2);
  stroke(255);
  r = sin(1);
  e = cos(1);
  rect(0, 0, ((350-x)*r)/16, ((350-y)*e)/16);
  println(x-250);
  println(r);
}

