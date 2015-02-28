
int[] xCor;
int[] yCor;
int lengthCor;

void setup() {
  smooth();
  noStroke();
  size(500, 500);
  background(200, 200, 210);
  lengthCor = 0;
  xCor = new int[100];
  yCor = new int[100];
  background(220, 220, 230);
  for (int i = 0; i < xCor.length; i++) {
    fill(0, 100, 255, 50);
    xCor[i] = (int) random(0, 500);
    yCor[i] = (int) random(0, 500);
    lengthCor = (int) random(6, 20);
    rect(xCor[i], yCor[i], lengthCor, lengthCor);
  }
}

void draw() {
}


