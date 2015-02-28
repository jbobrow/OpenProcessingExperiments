
int numBalls = 6;
float[] xPos = new float[numBalls];
float yPos = 250;
int yVel = 2;
int xVel = 2;

void setup(){
  size(500, 500);
  smooth();
  noStroke();
  for(int i = 0; i < numBalls; i ++){
    xPos[i] = width-65-75*i;
  }
}

void draw(){
  background(250);
  
  for(int i = 0; i < numBalls; i ++){
      drawBall(xPos[i], yPos, 50);
      drawBall2(xPos[i], yPos, 45);  
    
    if(yPos >= height-25 || yPos <= 25){
      yVel*=-1;
    }
    
//    if(xPos[i] >= width-25 || xPos[i] <= 25){
//      xVel*=-1;
//    }
    
    yPos += yVel;
//    xPos[i] += xVel;
  }
}


void drawBall(float x, float y, float diameter){
  fill(random(255));
  noStroke();  
  for(int i = 0; i < numBalls; i ++){
    ellipseMode(CENTER);
    ellipse(xPos[i], yPos, diameter, diameter);
  }
}

void drawBall2(float x, float y, float diameter){
  fill(random(255));
  noStroke();  
  for(int i = 0; i < numBalls; i ++){
    ellipseMode(CENTER);
    ellipse(xPos[i], yPos, diameter, diameter);
  }
}

