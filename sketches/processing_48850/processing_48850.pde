
void setup() {
  size(400, 400);
  background(0);
  smooth();
  noLoop();
}

void draw() {
  strokeWeight(10);
  noFill();
  for (int i = 0; i < 4;i++) {
    for (int j = 0; j < 15;j++) {
      stroke(255, 0, 240);
      arc(j*30, i*140, 50, 70, PI/2, PI*3/2);
      stroke(0, 255, 0);
      arc(j*30, i*140+70, 50, 70, -PI/2, PI/2);
    }
  }
  filter(BLUR, 3);
}

