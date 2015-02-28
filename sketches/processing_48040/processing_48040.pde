
float t;

void setup() {
  size(400, 500);
  background(0);
  smooth();
}

void draw() {
  colorMode(HSB, 360, 100, 100);

  fill(0, 100, 0, 50);
  rect(0, 0, width, height);

  noStroke();

  for (int i = 0; i < 7;i++) {
    for (int j = 1; j <= 7;j++) {
      fill(i*50, 100, 100);
      ellipse(i*50+50, j*30+20*(i+j)*sin(t), j*5, j*5);
    }
  }
  t+=0.05;
}


