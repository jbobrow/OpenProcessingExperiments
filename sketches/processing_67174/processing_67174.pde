
int ball = 50;
 
boolean canSee;
 
float[] ballX = new float [ball];
float[] ballY = new float [ball];
float[] velX = new float [ball];
float[] velY = new float [ball];
 
void setup() {
  size(400, 400);
  smooth();
  noStroke();
 
  for (int i=0; i < ball; i++) {
    ballX[i] = 5;
    ballY[i] = 5;
 
    velX[i] = i;
    velY[i] = i+2;
  }
 
  canSee = false;
}
 
void draw() {
  background(255);
  if (canSee == true) {
    for (int i = 0; i < ball; i++) {
      fill(120, 115, 120);
      ellipse(ballX[i], ballY[i], 20, 20);
 
      ballY[i] += velY[i];
      ballX[i] += velX[i];
 
     if ((ballY[i] < 0) || (ballY[i] > 400)) {
        velY[i]*=-1;
      }
    }
  }
}
 
 
void mouseReleased() {
  canSee = true;
  for (int i=0; i<ball; i++) {
    ballX[i] = mouseX;
  }
}


