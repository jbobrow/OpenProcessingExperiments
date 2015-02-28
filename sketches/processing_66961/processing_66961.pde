
int numBalls = 101;
int rad[] = new int[numBalls];
int vel[] = new int[numBalls];
int ballX[] = new int[numBalls];
int ballY[] = new int[numBalls];
 
 
void setup(){
  size(600, 600);
  smooth();
  noStroke();
  for(int i = 0; i < numBalls; i++){ 
    rad[i] = int(random(5, 40));
    vel[i] = int(random(1, 5));
    ballX[i] = int(random(rad[i], width-rad[i]));
    ballY[i] = int(random(rad[i], height-rad[i]));
  }
}
 
void draw(){
  frameRate(200);
  background(255);
  for(int i = 0; i < numBalls; i++){
    fill(255, random(255), random(250));
    ellipseMode(CENTER);
    ellipse(ballX[i], ballY[i], rad[i], rad[i]);
      ballX[i] += vel[i];
      ballY[i] += vel[i];
      
    if(ballX[i] > width-rad[i] || ballX[i] < width-rad[i]){
      vel[i] = vel[i] *-1;
    }
    if(ballY[i] > height-rad[i] || ballY[i] < height-rad[i]){
      vel[i] = vel[i] * -1;
    }
  }
}


