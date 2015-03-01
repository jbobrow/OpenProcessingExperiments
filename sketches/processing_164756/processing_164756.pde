
float[] xCoord = new float[500];
float[] yCoord = new float[500];
float[] speed= new float [500];

void setup() {
  size(400, 400);
  for (int i = 0; i < 500; i++) {
    xCoord[i] = random(width);
    yCoord[i] = random(height);
    speed [i] = random(0,100);
  }
}

void draw() {
  background(0);
  stroke(255);
  for (int i = 0; i < 500; i++) {
    point(xCoord[i], yCoord[i]);
     yCoord[i]+= speed[i];
    if (yCoord[i]>height) {
      yCoord[i]= 0;
    }
  }
}

