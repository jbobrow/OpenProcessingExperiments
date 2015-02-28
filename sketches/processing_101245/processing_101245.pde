
float r=0;

void setup() {
  size(400,400);
  background(10);
  smooth();
  noStroke();
}

void draw() {
    fill(random(100,255),70);
    rotate(r);
    float circle_size = random(50,100);
    ellipse(100+r, 10, circle_size, circle_size);
    r += 0.5;
    if (r > 250) {
      noLoop();
    }
}
