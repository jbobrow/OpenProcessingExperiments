
int waveSize = 100;
int strokeNum = 6;

void setup() {
  size(500, 500);
  colorMode(HSB);
  background(255);
  smooth();
  noLoop();
}

void draw() {
  int offset = -1;
  for (float j = 0; j < height + waveSize; j += waveSize/sqrt(3)/2) {
    for (float i = 0; i < width + waveSize; i += waveSize) {
      drawWave(i + offset*waveSize/2/2, j, map(height-j, 0, height, 51.0, 255.0));
    }
    offset *= -1;
  }
}

void drawWave(float x, float y, float s) {
  fill(255);
  stroke(180, s, 255);
  strokeWeight(waveSize/strokeNum/4);
  for (int i = 0; i < strokeNum; i++) {
      ellipse(x, y, waveSize - waveSize/strokeNum*i, waveSize - waveSize/strokeNum*i);
  }
}

