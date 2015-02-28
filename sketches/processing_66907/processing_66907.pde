
int ballNum = 50;
//balls position
float ballY[]= new float[ballNum];
float ballX[]= new float[ballNum];
float ballsize[] = new float[ballNum];
//balls direction
float dx[] = new float[ballNum];
float dy[] = new float[ballNum];

void setup() {
  size(500, 400);
  for (int i = 0; i < ballNum; i++) {
    ballsize[i] = random(30, 80);

    ballX[i] = random(ballsize[i], width-ballsize[i]);
    ballY[i] = random(ballsize[i], height-ballsize[i]);

    dx[i] = random(10);
    dy[i] = random(10);
  }
}

void draw()
{
  background(0);
  for (int i = 0; i <  ballNum; i++) {
    //start position      
    ballX[i] = ballX[i] + dx[i];
    ballY[i] = ballY[i] + dy[i];
    if (ballX[i]>width-ballsize[i]/2 || ballX[i]<ballsize[i]/2) {
      dx[i] = dx[i]*-1;
    }
    if (ballY[i]>height - ballsize[i]/2 || ballY[i]<ballsize[i]/2) {
      dy[i] = dy[i]*-1;
    }
    noStroke();
    fill(255,mouseX, mouseY);
    ellipse(ballX[i], ballY[i], ballsize[i], ballsize[i]);
  }
}


