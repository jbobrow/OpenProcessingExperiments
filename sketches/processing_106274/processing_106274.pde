
int PATHLEN = 12;

float pathX[] = new float[PATHLEN];
float pathY[] = new float[PATHLEN];

void polarVertex(float r, float theta) {
  vertex(r * cos(theta), r * sin(theta));
}

void starburst(float x, float y, float r1, float r2, float theta, int n) {
  pushMatrix();
  translate(x, y);
  beginShape();
  for (int i = 0; i < n; i++) {
    polarVertex(r1, i * TWO_PI / n - theta);
    polarVertex(r2, (i + 0.5) * TWO_PI / n - theta);
  }
  endShape(CLOSE);
  popMatrix();
}

boolean paused;
void mouseClicked() {
    paused = !paused;
    if (paused)
        noLoop();
    else
        loop();
}

void setup() {
  size(400, 400);
  frameRate(30);
}

void draw() {
  float t = millis() * 1e-3;
  int k = frameCount % PATHLEN;
  pathX[k] = mouseX;
  pathY[k] = mouseY;
  background(0x66, 0x33, 0x99);
  noStroke();
  for (int i = 0; i < PATHLEN; i++) {
    float p = float(i) / PATHLEN;
    fill(0xff, 0x33 + p * 0x99, 0x00);
    int j = (i + k + 1) % PATHLEN;
    float theta = sin(4 * (t - j) / TWO_PI) * PI;
    starburst(pathX[j], pathY[j], 50, 80, theta, 12);
  }
}
