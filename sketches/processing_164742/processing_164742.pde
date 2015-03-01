
float[] xCoord = new float[100];
float[] yCoord = new float[100];
float[] speed = new float[100];


void setup() {
  size(400, 400);
  for (int i = 0; i < 100; i++) {
    xCoord[i] = random(width);
    yCoord[i] = random(height);
    speed[i] = random(2,5);
  }
}

void draw() {
  background(0);
  strokeWeight(5);
  stroke(255);
  smooth();
  for (int i = 0; i < 100; i++) {
    point(xCoord[i], yCoord[i]);
    yCoord[i] += speed[i];
    yCoord[i] += 1;
      if(yCoord[i]>height){
        yCoord[i] = 1;
      }
    
  }
}
