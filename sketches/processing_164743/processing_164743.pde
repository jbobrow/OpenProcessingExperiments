
float[] xCoord = new float[100];
float[] yCoord = new float[100];
float[] speed = new float[100];

void setup() {
  size(400, 400);
  for (int i = 0; i < 100; i++) {
    xCoord[i] = random(width);
    yCoord[i] = random(height);
    speed[i] = random(3,8);
  }
}

void draw() {
  background(0);
  stroke(255);
  smooth();
  for (int i = 0; i < 100; i++) {
    strokeWeight(5);
  point(xCoord[i], yCoord[i]);
    //line(xCoord[i], yCoord[i],xCoord[i], yCoord[i]+10);
    yCoord[i] += speed[i];
    if(yCoord[i]>height){
      yCoord[i]=1;
    }
  }
}
