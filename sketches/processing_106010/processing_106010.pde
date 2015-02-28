
//Colliding Balls by Xiaofeng Lin

int numBalls = 15;
float ballX[] = new float[numBalls];
float ballY[] = new float[numBalls];
float speedX[] = new float[numBalls];
float speedY[] = new float[numBalls];

float gravity = 0.1;
 
 
void setup(){
  size(400, 400);

  for(int i = 0; i < numBalls; i++){ 
    ballX[i] = int(random(50, width-50));
    ballY[i] = int(random(50, width-50));
    speedX[i] = int(random(1, 4));
    speedY[i] = int(random(1, 4));
  }
}
 
void draw(){
  background(255);

  for(int i = 0; i < numBalls; i++){

    ellipse(ballX[i], ballY[i], 20, 20);
    
    ballX[i] += speedX[i];
    ballY[i] += speedY[i];
  
    speedY[i] = speedY[i] + gravity; //Gravity impact
    
    if(ballX[i] > width-10 || ballX[i] < 10){ //Bouncing off walls
      speedX[i] = speedX[i] * (-0.9);
    }
    if(ballY[i] > height-10 || ballY[i] < 10){
      speedY[i] = speedY[i] * (-0.9);
    }  
  }
  
  for(int i = 0; i < numBalls; i++){
    for (int j = 0; j < numBalls; j++){
      if(i > j){
        if(dist(ballX[i], ballY[i],ballX[j], ballY[j]) <= 20){ //Collision
          
        if ((speedX[i] > 0 && speedX[j] < 0) || (speedX[i] < 0 && speedX[j] > 0)) { //Speed differences
          speedX[i] *= -1;
          speedX[j] *= -1;
        }
        if ((speedY[i] > 0 && speedY[j] < 0) || (speedY[i] < 0 && speedY[j] > 0)) {
          speedY[i] *= -1;
          speedY[j] *= -1;
        }

        }
        speedX[i] = abs(speedX[i]) * (0.4);  // Lost of energy after collision
        speedX[j] = abs(speedX[j]) * (-0.4);
      }

    }
  }  
}
