
int numCircle = 50;
float[] circleX = new float [numCircle];
float[] circleY = new float [numCircle];
float[] velX = new float [numCircle];
float[] velY = new float [numCircle];

void setup() {
  size(500, 500);
  noStroke();
  smooth();
  frameRate(10);
}

void mouseReleased() {
     for (int i = 0; i < numCircle; i++) {
     circleX[i] = mouseX;
     circleY[i] = mouseY;  
     velX[i] = random(-180,180);
     velY[i] = random(-180,180);
  }
}
  
void draw() {
  background(0);
  for (int i = 0; i < numCircle; i++) {
  fill(random(255), random(255), random(255));
  ellipse(circleX[i], circleY[i], 10, 10);
  circleY[i] += velY[i];
  circleX[i] += velX[i];
  }
}


