
//I give credit to the other people in the class who figured this out, I could not do it without them
int ball = 50;

boolean canSee;

float[] ballX = new float [ball];
float[] ballY = new float [ball];
float[] velX = new float [ball];
float[] velY = new float [ball];

void setup() {
  size(600, 600);
  stroke(0, 0, 255);
  strokeWeight(10);

  for (int i=0; i < ball; i++) {
    ballX[i] = 10;
    ballY[i] = 10;

    velX[i] = i;
    velY[i] = i+2;
  }

  canSee = false;
}

void draw() {
  background(255);
  if (canSee == true) {
    for (int i = 0; i < ball; i++) {
      fill(0, 255, 0);
      ellipse(ballX[i], ballY[i], 40, 40);

      ballY[i] += velY[i];
      ballX[i] += velX[i];

      if ((ballY[i] < 0) || (ballY[i] > 600)) {
        velY[i]*=-1;
      } 

      if ((ballX[i] < 0) || (ballX [i] > 600)) {
        velX[i]*=-1;
      }
    }
  }
}





void mouseReleased() {
  canSee = true;
  for (int i=0; i<ball; i++) {
    ballX[i] = mouseX;
    ballY[i] = mouseY;
  }
}


