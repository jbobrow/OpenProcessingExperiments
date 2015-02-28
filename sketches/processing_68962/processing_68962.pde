
void setup() {
  size(1200, 700);
  smooth();
  background(176);
  frameRate(20);
}

void draw() {
  background(176);
  for (float i = 20; i < 600; i +=5) {
    fill(random(200), random(200), random(200), 50+random(150));
    ellipse(i*random(.91, 1)*mouseX*.002, i*mouseY*.002, i / 3, i / 3);
  }
}
