
int numBalls = 17;
int ballX[] = new int[numBalls];
int ballY[] = new int[numBalls];
float speedX[] = new float[numBalls];
float speedY[] = new float[numBalls];
color colorBalls = color(0, 0, 0);
int vel = 2;


void setup(){
  size(400, 400);
  smooth();
  for(int i = 0; i < numBalls; i++){ // initializing all the variables for the balls
    ballX[i] = int(random(50, width-50));
    ballY[i] = int(random(50, width-50));
    speedX[i] = int(random(1, 4));
    speedY[i] = int(random(1, 4));
  }
}

void draw(){
  background(255);
  fill(0);
  text("Press Y, P, or B to change the ball color", 30, 30);
  for(int i = 0; i<numBalls; i++){
    fill(colorBalls);
    ellipse(ballX[i], ballY[i], 20, 20);
    if(ballX[i] > width-10 || ballX[i] < 10){
      speedX[i] = speedX[i] * (-1);
    }
    if(ballY[i] > height-10 || ballY[i] < 10){
      speedY[i] = speedY[i] * (-1);
    }
    ballX[i] += speedX[i];
    ballY[i] += speedY[i];
  }
}

void keyPressed(){
  if (key == 'p' || key == 'P') {
    colorBalls = color(182, 21, 191);
    }
   if (key == 'y' || key == 'Y') {
    colorBalls = color(241, 255, 59);
    }
   if (key == 'b' || key == 'B') {
    colorBalls = color(59, 168, 255);
    }
}

