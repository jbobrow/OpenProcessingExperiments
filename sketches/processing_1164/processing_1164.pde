
int n = 300;
int minLines = 100;
int maxLines = 200;

boolean[] choice;
float[] x, y;

void setup() {
  size(1280 / 2, 720 / 2);
  smooth();
}

void draw() {
  x = new float[n];
  y = new float[n];
  choice = new boolean[n];
  for(int i = 0; i < n; i++) {
    choice[i] = random(1) > .5;
    x[i] = random(0, width);
    y[i] = random(0, height);
  }
  background(0);
  noFill();
  stroke(255, 25);
  int iter = 1;
  for(int i = 0; i < iter; i++) {
    float step = height / iter;
    iteratedConsonance(step * i, step * (i + 1));
  }
}

void iteratedConsonance(float lower, float upper) {
  for(float i = minLines; i < maxLines; i ++)
    consonance(i, lower, upper);
}

float extension = 200;

void consonance(float window, float yBottom, float yTop) {
  beginShape();
  float realBottom = yBottom - extension;
  float realTop = yTop + extension;
  for(int i = 0; i < width; i++) {
    float curSum = 0;
    float curCount = 0;
    for(int j = 0; j < n; j++) {
      float distance = abs(i - x[j]);
      if(distance < window && y[j] > realBottom && y[j] < realTop) {
        float weight = pow(distance / window, 3);
        curSum += choice[j] ? weight : 0;
        curCount += weight;
      }
    }
    float cur = curSum / curCount;
    vertex(i, map(cur, 0, 1, yTop, yBottom));
  }
  endShape();
}


