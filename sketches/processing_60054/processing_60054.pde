
float y =0;
float angle = 0;
float amplitude = 10;
float waveGap = 5;
float frequency = 5;

void setup() {
  size(600, 400);
  background(255);
  noFill();
  frameRate(20);
}

void draw() {
  if (y<height) {
    float py = 0;
    for (int i=0; i<width; i++) {
      py = y+sin(radians(angle))*amplitude;
      strokeWeight(2);
      stroke(255, 0, 255);
      point(i, py);
      angle+=frequency;
    }
    y+=waveGap;
  }
}

