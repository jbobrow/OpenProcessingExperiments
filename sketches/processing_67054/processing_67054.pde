
int ballCount= 15;
float[] ballPosX = new float[ballCount];
float[] ballPosY = new float[ballCount];
float[] ballSpeedX = new float[ballCount];
float[] ballSpeedY = new float [ballCount];
float[] gravity = new float[ballCount];

void setup(){
  size(400,400);
  stroke(0);
  smooth();
  for(int i=0;i<ballCount;i++){
    ballSpeedX[i]=10;
    ballSpeedY[i]=10;
    ballPosX[i]=(random(40, width-40));
    ballPosY[i]=(random(40, height-40));
    gravity[i]=(.428);
  }
}

void draw(){
    background(255);
  for(int i=0;i<ballCount;i++){
   
    ballSpeedY[i] += gravity[i];
      ballPosX[i] += ballSpeedX[i];
      ballPosY[i] += ballSpeedY[i];
  
    ellipse(ballPosX[i], ballPosY[i], 20, 20);
      
 
  //Collision
  
   if(ballPosY[i] >= height-30 ) { //|| ballPosY[i] <= 30
    ballPosY[i]=height-30;
    ballSpeedY[i] *= -.95;
}
  
  if(ballPosX[i] >= width-30 || ballPosX[i] <= 30) {

    ballSpeedX[i] *=-.95;
  }
  }
}
  
  //All Stop
//   if (ballPosY[i] == 370 && ballSpeedY[i] < .5) {
//    ballSpeedY[i] = 0;
//    gravity[i]=0;
//  }
//    if (ballPosX[i] < 10 && ballSpeedX[i] > -1) {
//    ballSpeedX[i]=0;
//    gravity[i]=0;
//    
//  }
//  
//}
//}

