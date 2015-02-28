
int numBalls = 70; 

float[] ballX = new float [numBalls]; 
float[] velX = new float [numBalls]; 

float[] ballY = new float [numBalls]; 
float[] velY = new float [numBalls]; 


void setup() {
  size(600, 300);
  smooth();
  noStroke(); 

  for (int i = 0; i < numBalls; i++) {
    fill(255,250,103);

    velX [i] = random(5);
    velY [i] = random(10); 
  }
}


void draw() {
  background(74,216,187);

  for (int i=0; i<numBalls; i++) { 
    ballX[i]+=velX[i]; 
    ballY[i]+=velY[i]; 

    if ((ballX[i]<0)||(ballX[i]>width)) { 
                                             
      velX[i]=velX[i]*-1; 
    }

    if ((ballY[i]<0)||(ballY[i]>height)) { 
      velY[i]=velY[i]*-1; 
    }

    if ((ballY[i]>height || ballY[i] < 0)) { 

    }
    ellipse(ballX[i], ballY[i], 30, 30);
  }
}  


