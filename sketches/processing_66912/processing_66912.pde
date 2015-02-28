
int ballNum = 50;
//balls position
float ballY[]= new float[ballNum];
float ballX[]= new float[ballNum];
float ballsize[] = new float[ballNum];
//balls direction
float dx[] = new float[ballNum];
float dy[] = new float[ballNum];

float r[] = new float[ballNum];
float g[] = new float[ballNum];
float b[] = new float[ballNum];

void setup() {

  size(800, 300);
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
  background(255);
  fill(mouseX, 100, mouseX, 60);
  rect(0, 0, width, height);
  drawBall();
}
void drawBall() {
  for (int i = 0; i < ballNum; i++) {
    //start position      
    ballX[i] = ballX[i] + dx[i];
    ballY[i] = ballY[i] + dy[i];
    
    if (ballX[i]>width-ballsize[i]/2 || ballX[i]<ballsize[i]/2) {
      dx[i] = dx[i]*-1;
      r[i] = random(100, 255);
      g[i] = random(100, 255);
      b[i] = random(100, 255);
    }
    if (ballY[i]>height - ballsize[i]/2 || ballY[i]<ballsize[i]/2) {
      dy[i] = dy[i]*-1;
      r[i] = random(100, 255);
      g[i] = random(50);
      b[i] = random(100, 255);
    }
    noStroke();
    fill(r[i], g[i], b[i]);
    ellipse(ballX[i], ballY[i], ballsize[i], ballsize[i]);
  }
}


