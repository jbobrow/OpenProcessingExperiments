
float[] xCoords = new float[500];
float[] yCoords = new float[500];
float[] xMove = new float[500];
float[] yMove = new float[500];

void setup() {
  size (1280, 800);
  smooth();
  for (int i = 0; i < 500; i++) {
    xCoords[i] = random(width);
    yCoords[i] = random(height);
    yMove[i] = random(2, 5);
  }
}

void draw() {
  fill(0);
  rect(-1, -1, width + 1, height + 1);
  fill(255);
  for (int i = 0; i < 500; i++) {
    ellipse(xCoords[i], yCoords[i], 5, 5);
    xCoords[i] +=xMove[i];
    yCoords[i] +=yMove[i];

    //make it wiggle!!
    xCoords[i] += random(-5, 1);

    if (yCoords[i] > height) {
      yCoords[i] = 0;
    }
    if (xCoords[i] < 0) {
      xCoords[i] = width;
    }
  }
}


