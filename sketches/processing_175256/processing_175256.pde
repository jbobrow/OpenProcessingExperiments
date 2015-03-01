
float [] ballX;
float [] ballY;
float [] speedX;
float [] speedY;
float [] diameter;
int nBalls = 100;
int bounce =0;

void setup () {
  size(400,400);
  ballX = new float[nBalls];
  ballY = new float[nBalls];
  speedX = new float[nBalls];
  speedY = new float[nBalls];
  diameter = new float[nBalls];
  
  for(int i = 0; i < nBalls; i++) {
    
  ballX[i] = random(width);
  ballY[i] = random(height);
  speedX[i] = random(5);
  speedY[i] = random(5);
  diameter[i] = random(25,50);
  };
}

void draw () { 
  frameRate(100);
  noStroke();
  background(255,255,255); 
  fill(255,115,0);
  for(int i = 0; i < nBalls; i++) {
    ellipse(ballX[i], ballY[i], diameter[i], diameter[i]);
  }
  update();
}

void update () {
  for(int i = 0; i < nBalls; i++) {
    ballX[i] += speedX[i];
    ballY[i] += speedY[i];
  
  if (ballX[i] + diameter[i]/2> width) {
    speedX[i] += -1;
    bounce ++;
    println(bounce);
  } else if (ballX[i] - diameter[i]/2 < 0) {
    speedX[i] *= -1;
    bounce ++;
    println(bounce);
  }
  
  if (ballY[i] + diameter[i]/2> height) {
    speedY[i] *= -1;
    bounce ++;
     println(bounce);
  } else if (ballY[i] - diameter[i]/2< 0) {
  speedY[i] *= -1;
    bounce ++;
     println(bounce);
    }
  }
}
