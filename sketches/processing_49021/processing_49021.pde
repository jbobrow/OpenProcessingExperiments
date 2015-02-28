
float x = 0;
float y = 4;

void setup() {
  size(400, 400);
  background(255, 204, 0);
  noStroke();
  smooth();
  frameRate(10);
}

void draw() {

  if (x < width) {

    background(255, 204, 0);
    fill(0, 0, 255);
    ellipse(10+x, 10 +x, random(99), random(99));
    fill(255, 0, 0);
    ellipse(10+x, 10 +x, random(99), random(99));
    text("sst... a kiss",20+x,30+x,100,100);

    x = x + 1;
  }
}

