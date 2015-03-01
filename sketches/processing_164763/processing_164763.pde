
float[] xCoord = new float[100];
float[] yCoord = new float[100];
float [] speed = new float[100];
void setup() {
  size(750, 750);
  for (int i = 0; i < 100; i++) {
    speed[i] = random(  4, 20);
    xCoord[i] = random(width);
    yCoord[i] = random(height);
  }
}

void draw() {
  background(0);
  fill(255);
  stroke(mouseX,random(255), 255);
  for (int i = 0; i < 100; i++) {
    ellipse(xCoord[i], yCoord[i],2,mouseY);
    yCoord[i] += speed[i]; 
    if (yCoord[i] > height) {
      yCoord[i] = 0;
    }
  }
}

