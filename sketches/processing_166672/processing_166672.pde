
float[] xCoord = new float[100];
float[] yCoord = new float[100];
float[] rate=new float[100];

void setup() {
  size(600, 400);
  smooth();
  for (int i = 0; i <100; i++) {
    xCoord[i] = random(width);
    yCoord[i] = random(height);
    rate[i]=random(1, 3);
  }
}

void draw() {
  background(0, 0, 150);
  stroke(255);
  strokeWeight(30);
  ellipse(mouseX, mouseY, 400, 400);
  noFill();
  for (int i = 0; i < 100; i++ ) {
    yCoord[i] +=rate[i];
    yCoord[i] -= 5;
    xCoord[i] += random (-3, 3);
    if (yCoord[i] <0) {
      yCoord[i] += height;
    }
    if (dist(mouseX, mouseY, xCoord[i], yCoord[i]) < 200) {
      noFill();
      strokeWeight(1);
      ellipse(xCoord[i], yCoord[i], 2, 2);
    }
  }
}

