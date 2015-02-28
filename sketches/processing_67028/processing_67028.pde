
float tam = 30;
  float diag = sqrt(2);

void setup() {
  size (720, 250);
}

void cuad(int i, int j) {

  fill(255, 0, 255* noise(i, j));
  float x = i * tam * 1.45;
  float y = j * tam * 1.45;
  float angle = map(frameCount/1000, 0, 999, 0, TWO_PI) + PI * noise(i, j, frameCount/30.);

  beginShape();
  vertex(x , y);
  vertex(x + tam * cos(angle), y + tam * sin(angle));
  vertex(x + tam* cos(QUARTER_PI + angle) * diag, y + tam * sin(QUARTER_PI + angle) * diag);
  vertex(x + tam * cos(HALF_PI + angle), y + tam * sin(HALF_PI + angle));
  vertex(x , y);  
  endShape();
  
}

void draw() {
  background (64, 163, 215);

  for (int i = 0; i < width / (tam ); i++) {
    for (int j = 0; j < height / (tam); j++) {
      cuad(i, j);
    }
  }
}
