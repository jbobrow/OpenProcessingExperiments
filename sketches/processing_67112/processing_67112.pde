
int ballNum = 4;

float ballY[]= new float[ballNum];
float ballX[]= new float[ballNum];
float ballR[] = new float[ballNum];

float dx[] = new float[ballNum];
float dy[] = new float[ballNum];

float gravity[]  = new float[ballNum];

void setup() {

  size(500, 300);
  for (int i = 0; i < ballNum; i++) {
    ballR[0] = 20;
    ballR[1] = 40;
    ballR[2] = 30;
    ballR[3] = 20;

    ballX[i] = random(ballR[i], width-ballR[i]);
    ballY[i] = random(ballR[i], height-ballR[i]);

    dx[i] = random(10);
    dy[i] = random(8);

    ellipseMode(RADIUS);
    gravity[0] = .4;
    gravity[1] = .2;
    gravity[2] = .3;
    gravity[3] = .5;
  }
}

void draw()
{
  background(255);
  fill(mouseX, 100, mouseX, 60);
  rect(0, 0, width, height);
  drawBall();
}
void drawBall() {
  fill(255, 0, mouseX);

  for (int i = 0; i < ballNum; i++) {
    //start position      
    ballX[i] = ballX[i] + dx[i];
    ballY[i] = ballY[i] + dy[i];
    dy[i] = dy[i] + gravity[i];

    if (ballX[i]>width-ballR[i]|| ballX[i]< ballR[i]) {
      dx[i] = dx[i]*-0.95;
    }
    if (ballY[i]>height - ballR[i] || ballY[i]< ballR[i]) {
      dy[i] = dy[i]*-0.95;
    }
    for (int j = 0; j< ballNum; j++) {

      if (dist(ballX[i], ballY[i], ballX[j], ballY[j]) <= (ballR[i]+ballR[j])) {
        dx[i] *= -1;
        dy[i] *= -1;
        dx[j] *= -1;
        dy[j] *= -1;
      }
    }
    fill(0, 244, 100);
    ellipse(ballX[i], ballY[i], ballR[i], ballR[i]);
  }
}


