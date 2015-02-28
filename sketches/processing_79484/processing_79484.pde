
void setup() {
  size(500, 500);
}

void draw() {
  background(25);
  circunferencia(width/2, height/2+27, 300, 255);
  circunferencia(350, height/2+27, 75, 25);
  circunferencia(150, height/2+27, 75, 25);
  circunferencia(width/2, 60+27, 75, 255);
}

void circunferencia(float x, float y, float radio, color a) {
  noStroke();
  fill(a, 50);
  ellipse(x, y, radio, radio);

  if (radio > 15) {
    circunferencia(x, y - radio/4, radio/2, a);
    circunferencia(x, y + radio/4, radio/2, a);
  }
}
