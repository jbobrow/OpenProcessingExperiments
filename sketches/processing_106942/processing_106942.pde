
int N = 8;

float plinthX[] = new float[N];
float plinthY[] = new float[N];
float plinthD[] = new float[N];

void plinth(float x, float y, float rX, float rY) {
  float theta = map(mouseX, 0, width, 0, TWO_PI);
  float x1 = x - rX * cos(theta);
  float x2 = x - rX * sin(theta);
  float x3 = x + rX * sin(theta);
  float x4 = x + rX * cos(theta);
  float y1 = y - rY * cos(theta);
  float y2 = y - rY * sin(theta);
  float y3 = y + rY * sin(theta);
  float y4 = y + rY * cos(theta);
  quad(x1, y3, x3, y1, x4, y2, x2, y4);
//  line(x1, 0, x1, height);
//  line(x2, 0, x2, height);
//  line(x3, 0, x3, height);
//  line(x4, 0, x4, height);
  line(x1, y3, x1, height);
  line(x2, y4, x2, height);
  line(x3, y1, x3, height);
  line(x4, y2, x4, height);
}

void resetPlinths() {
  for (int i = 0; i < N; i++) {
    plinthX[i] = random(width);
    plinthY[i] = random(height);
    plinthD[i] = random(20, 100);
  }
}

void mouseClicked() {
  resetPlinths();
}

void setup() {
  size(400, 400);
  resetPlinths();
}

void draw() {
  background(0xff);
  fill(0xff, 0xcc, 0x00);
  strokeJoin(BEVEL);
  strokeWeight(2);
  for (int i = 0; i < N; i++)
    plinth(plinthX[i], plinthY[i], plinthD[i], 0.35 * plinthD[i]);
}
