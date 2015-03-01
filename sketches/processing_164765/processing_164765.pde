
float[] xCoord = new float[1000];
float[] yCoord = new float[1000];

void setup() {
  size(400, 400);
  for (int i = 0; i < 100; i++) {
    xCoord[i] = random(width);
    yCoord[i] = random(height);
  }
}

void draw() {
  background(15,15,60);
  stroke(255);
  smooth();
  for (int i = 0; i < 100; i++) {
    line(xCoord[i], yCoord[i], xCoord[i], yCoord[i]+10);
    yCoord[i] += random(2,7);
    if (yCoord[i] >= height) {
      yCoord[i] = 0;
    }
  }
}
