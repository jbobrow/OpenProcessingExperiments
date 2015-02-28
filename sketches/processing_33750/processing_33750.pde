
/* Random Gravity Balls */

int numBalls = 50;
float[] centerX = new float[numBalls];
float[] centerY = new float[numBalls];
float[] moveX = new float[numBalls];
float[] moveY = new float[numBalls];
float[] r = new float[numBalls];
PImage[] ballImage = new PImage[numBalls];
int[] time = new int[numBalls];

float gravity = .001;

PImage bGround;
PImage ball1;
PImage ball2;
PImage ball3;
PImage ball4;
PImage ball5;

void setup() {
  size(800, 400);
  background(255);
  smooth();
  frameRate(100);
  
  bGround = loadImage("bGround.jpg");
  ball1 = loadImage("golfball.png");
  ball2 = loadImage("baseball.png");
  ball3 = loadImage("volleyball.png");
  ball4 = loadImage("soccerball.png");
  ball5 = loadImage("basketball.png");
  
  //randomize the initial positions, velocities, and radii of the 50 different balls
  for (int i = 0; i < numBalls ; i++){
  centerX[i] = random(51, width-51);
  centerY[i] = random(51, height-51);
  moveX[i] = random(-10,10);
  moveY[i] = random(-10,10);
  
  //find random int between (1,5) to assign the 5 different radius images
  r[i] = random(1,5.999);
  r[i] = int(r[i]);
  
  time[i]=0;
  
  }
}

void draw() {
  background(0);
  //image(bGround, 0, 0);
  fill(0);
  
  //make 50 balls go crazy!
  for(int i = 0; i < numBalls; i++){

  if(centerX[i]<=r[i]*10){  //test to see if ball is on left boundary
    centerX[i] = r[i]*10+0.1; //move ball just right of left boundary to avoid being trapped beyond boundary
    moveX[i] = moveX[i]*(-1); //change x-direction of ball 
  }
    
  if(centerX[i]>=width-(r[i]*10)){ //same as above but right boundary
    centerX[i] = width-r[i]*10-.01;
    moveX[i] = moveX[i]*(-1);
  }
   
  if((centerY[i]<=r[i]*10)){ //test to see if ball is on top boundary
    centerY[i]=r[i]*10+0.1;
    moveY[i]=moveY[i]*(-1);
    
  }
  if(centerY[i]>=height-r[i]*10){ //when ball passes the bottom boundary
    centerY[i]=height-r[i]*10-0.1;
    moveY[i] = moveY[i]*(-.3); //simulate dampening of vertical rebound on impact
    moveX[i] = moveX[i]*(.7); //simulate friction in the horizontal direction
    time[i]=0;
  }
  
  if(centerY[i]<r[i]+1&&(moveX[i]<.015&&moveX[i]>(-.015))){ //end vertical vibration of ball once its magnitude gets small enough
    moveY[i] = 0.001;
  }
  
  if(centerY[i]<r[i]+1&&(moveX[i]<(.011)&&moveX[i]>(-.011))){ //end horizontal movement of ball once its magnitude gets small enough
  moveX[i] = 0;
  }

//set images to different ball sizes
  if(r[i] == 1){
    ballImage[i] = ball1;
  }
  if(r[i] == 2){
    ballImage[i] = ball2;
  }
  if(r[i] == 3){
    ballImage[i] = ball3;
  }
  if(r[i] == 4){
    ballImage[i] = ball4;
  }
  if(r[i] == 5){
    ballImage[i] = ball5;
  }  
  
  image(ballImage[i], centerX[i]-r[i]*10, centerY[i]-r[i]*10); 
  centerX[i] = centerX[i] + moveX[i];
  centerY[i] = centerY[i] + moveY[i];
  
  moveY[i] = moveY[i] + 10*gravity*time[i];
  time[i]++;
  }

}



