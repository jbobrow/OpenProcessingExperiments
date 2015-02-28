
void setup() {
  size(500, 500);
  colorMode(HSB);
  noFill();
  strokeWeight(2);
}

float a = 3, t, speed = 0.02;

void draw() {
  background(0);

  for (int i=1; i<10; i++) {
    stroke(i*12 + 100, i*9 + 170, i*10 + 150);
    t = a * sin(i * a);
    ellipse(i*width/10, t+height/i, i+mouseX/10, i+mouseY/10);

    for (int j=4; j > 1; j--) {
      ellipse(i*width/10, t+height/i, i-(j*2*j)+mouseX/10, i-(j*2*j)+mouseY/10);
      line(i*width/10, t+height/i, width, height);
    }
  }
  a += speed;

  if (a > 15) speed *= -1;
  else if (a < 3) speed *= -1;
}
