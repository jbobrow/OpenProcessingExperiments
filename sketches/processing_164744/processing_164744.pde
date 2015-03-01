
float[] xCoord = new float[100];
float[] yCoord = new float[100];
float[] rate=new float[100];

void setup() {
  size(400, 400);
  for (int i = 0; i < 100; i++) {
    xCoord[i] = random(width);
    yCoord[i] = random(height);
    rate[i]=random(1, 3);
  }
}

void draw() {
  background(0);
  stroke(50, 100, 150);
  for (int i = 0; i < 100; i++) {
    line(xCoord[i], yCoord[i], xCoord[i], yCoord[i] - 9);
    yCoord[i] +=rate[i];
    if (yCoord[i] >height) {
      yCoord[i] = 0;
    }
  }
}

