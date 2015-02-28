
float b = 0;
float offset = 0;

void setup() {
  size (600, 600);
  smooth();
  noStroke();
  background(16, 153, 175);
}

void draw() {
  fill(16, 153, 175, 10);
  rect(0, 0, width, height);
  for (float a = 100; a <= 360; a += 10) {
    noStroke();
    float f = radians (a+offset);
    float x = width/2 + sin (f) * (250 + cos (b)*200);
    float y = height/2 + cos (f) * (250 + cos (b)*200);

    fill(random(13, 16), random(9, 151), random(134, 198));
    ellipse (x, y, 70, 70);
  }

  b += 0.2;
  offset += 10;
}




