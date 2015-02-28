
float s = 1.01;
float n = 0.0;
float spin = 10;
void setup() {
  size(800, 800);
}

void draw() {
  colorMode(RGB);
  fill(0, 30);
  rect(0, 0, width, height);
  colorMode(HSB, 100, 100, 100);
  spin = spin + HALF_PI/5000;
  translate(width/2, height/2);
  for (int i = 0; i < 50; i++) {
    for (int q = 0; q < 70; q+= 20) {
      fill(30+i, 100, 100, 30);
      q = q + 20;
      ellipse(q, 0, 30, 30);
      fill(10+i, 100, 100, 100);
      ellipse(q*2, 0, 30+q, 10);
      rotate(spin);
      scale(s);
      stroke(noise(n));
      noStroke();
    }
  }
}
