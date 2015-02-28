
int firstNumBall = 2;
int numBall = 20;

float[] ballPosX = new float[numBall];
float[] ballPosY = new float[numBall];

float[] speedX = new float[numBall];
float[] speedY = new float[numBall];

float gravity;

float[] colorBall = new float[numBall];


void setup(){
  size(400, 500);
  smooth();
  noStroke();
  colorMode(RGB);
  
  for(int i = 0; i < numBall; i++){
    ballPosX[i] = random(width);
    ballPosY[i] = random(height);
    speedX[i] = random(0, 5);
    speedY[i] = random(0, 8);
    colorBall[i] = random(150);
  }
  
  gravity = 0.3;
}


void draw(){
  background(150, 170, 200);
  
//  mousePressed();

  for(int i = 0; i < numBall; i++){
    fill(200, colorBall[i], colorBall[i]);
    ellipseMode(CENTER);
    ellipse(ballPosX[i], ballPosY[i], 30, 30);
    ballPosX[i] += speedX[i];
    ballPosY[i] += speedY[i];
    speedY[i] += gravity;
    
    if(ballPosX[i] <= 15 || ballPosX[i] >= width-15){
      speedX[i] *= -1;
      colorBall[i] -= 30;
    }
    if(ballPosY[i] <= 15 || ballPosY[i] >= height-15){
      speedY[i] *= -0.95;
      colorBall[i] += 50;
    }
//    if(ballPosX[i] <= 15){
//      speedX[i] += 0.5;
//    }    
  }


//void mousePressed(){
//  for(int i = 0; i < numBall; i++){
//    fill(200, colorBall[i], colorBall[i]);
//    ellipse(ballPosX[i], ballPosY[i], 30, 30);
//    ballPosX[i] += speedX[i];
//    ballPosY[i] += speedY[i];
//    
//    if(ballPosX[i] <= 15 || ballPosX[i] >= width-15){
//      speedX[i] *= -1;
//      colorBall[i] -= 30;
//    }
//    if(ballPosY[i] <= 15 || ballPosY[i] >= height-15){
//      speedY[i] *= -0.97;
//      colorBall[i] += 50;
//    }
//  }
}


