
int numBalls = 5;
 
float [] BallX = new float [numBalls];
float [] BallY = new float [numBalls];
float [] speedX = new float [numBalls];
float [] speedY = new float [numBalls];
 
void setup(){
  size(500,500);
  smooth();
  noStroke();
   
  for(int i=0; i<numBalls; i++) {
   BallX[i]  = random(width);
   BallY[i] = random(height);
   speedX[i] = (5);
   speedY[i] = (5);
  }
}
 
void draw(){
 background(255);
 fill(255,105,180,70);
 
 for (int i=0; i < numBalls; i++){
  fill(244,219,39);
  ellipse(BallX[i], BallY[i], 60,60);
  fill(68,201,242);
   
  BallX[i] += speedX[i]; //movement X
  BallY[i] += speedY[i]; //movement Y
   
  if((BallX[i] < 0) || (BallX [i] > width)) {
    speedX[i]*=-1;
  }
    
   if((BallY[i] < 0) || (BallY[i] > height)){
    speedY[i]*=-1;
  }  
     
       
 }
}


