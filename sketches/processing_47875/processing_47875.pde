
/**
 * Reach 3. 
 * Based on code from Keith Peters (www.bit-101.com)
 * 
 * The arm follows the position of the ball by
 * calculating the angles with atan2().
 */
 
// Simulated Arm paths for ICM final

int numSegments = 2;
float segLength = 45;

//float xPositionFig = width/2;
//float yPositionFig = height/2;

//Left Arm
float[] x = new float[numSegments];
float[] y = new float[numSegments];
float[] angle = new float[numSegments];
float targetX, targetY;
//float ballX =50;
float ballX = 200-10;
float ballY = 50;
int ballXDirection = 1;
int ballYDirection = -1;

//Right Arm
float[] xArmR = new float[numSegments];
float[] yArmR = new float[numSegments];
float[] angleArmR = new float[numSegments];
float targetXArmR, targetYArmR;
float ballXArmR = 200+10;
float ballYArmR = 50;
int ballXDirectionArmR = 1;
int ballYDirectionArmR = -1;


void setup() {
  size(400, 300);
  smooth(); 
  strokeWeight(20.0);
  stroke(0, 100);
  noFill();
 
}

void draw() {
  background(226);
  float xPositionFig = width/2;
  float yPositionFig = height/2;
  float xShoulderL = (width/2-20)+(mouseX/20);
  float yShoulderL = (height/3)+(mouseY/15);

  //Left Arm
  x[x.length-1] = xShoulderL;     // Set base x-coordinate
  y[x.length-1] = yShoulderL;  // Set base y-coordinate
  
  strokeWeight(20);
  ballX = ballX + 1.0 * ballXDirection;
  ballY = ballY + 0.8 * ballYDirection;
  
  //if(ballX > width-25 || ballX < 25) {
  if(ballX > xShoulderL+(segLength*2)+15 || ballX < xShoulderL-segLength*2) {
    ballXDirection *= -1; 
  }
  //if(ballY > height-25 || ballY < 25) {
  if(ballY > yShoulderL+(segLength*2)+15 || ballY < yShoulderL-segLength*2) {
    ballYDirection *= -1; 
  }
  ellipse(ballX, ballY, 30, 30);
  
  reachSegment(0, ballX, ballY, x, y, angle);
  for(int i=1; i<numSegments; i++) {
    //reachSegment(i, targetX, targetY, angle);
    reachSegment(i, targetX, targetY, x, y, angle);
  }
  for(int i=x.length-1; i>=1; i--) {
    //positionSegment(i, i-1);  
     positionSegment(i, i-1, x, y, angle);
  } 
  for(int i=0; i<x.length; i++) {
    segment(x[i], y[i], angle[i], (i+1)*2); 
  }
  
  
  float xShoulderR = (width/2+20)+(mouseX/20);
  float yShoulderR = (height/3)+(mouseY/15);
  
  //Right Arm
  xArmR[xArmR.length-1] = xShoulderR;     // Set base x-coordinate
  yArmR[xArmR.length-1] = yShoulderR;  // Set base y-coordinate
  
  strokeWeight(20);
  ballXArmR = ballXArmR + 1.0 * ballXDirectionArmR;
  ballYArmR = ballYArmR + 0.8 * ballYDirectionArmR;
  
  //if(ballXArmR > width-25 || ballXArmR < 25) {
  if(ballXArmR > xShoulderR+(segLength*2)+15 || ballXArmR < xShoulderR-segLength*2) {
    ballXDirectionArmR *= -1; 
  }
  //if(ballYArmR > height-25 || ballYArmR < 25) {
  if(ballYArmR > yShoulderR+(segLength*2)+15 || ballYArmR < yShoulderR-segLength*2) {
    ballYDirectionArmR *= -1; 
  }
  ellipse(ballXArmR, ballYArmR, 30, 30);
  
  reachSegment2(0, ballXArmR, ballYArmR, xArmR, yArmR, angleArmR);
  for(int i=1; i<numSegments; i++) {
//    reachSegment(i, targetX, targetY, x, y, angle);
    //reachSegment(i, targetXArmR, targetYArmR, angleArmR);
    reachSegment2(i, targetXArmR, targetYArmR, xArmR, yArmR, angleArmR);
  }
  for(int i=xArmR.length-1; i>=1; i--) {
    // positionSegment(i, i-1);
    positionSegment(i, i-1, xArmR, yArmR, angleArmR);  
  } 
  for(int i=0; i<xArmR.length; i++) {
    segment(xArmR[i], yArmR[i], angleArmR[i], (i+1)*2); 
  }
}


void positionSegment(int a, int b, float [] xin, float [] yin, float[] thisSeg) {
  xin[b] = xin[a] + cos(thisSeg[a]) * segLength;
  yin[b] = yin[a] + sin(thisSeg[a]) * segLength; 
}

void reachSegment(int i, float xin, float yin, float[] xthen, float[] ythen, float[] thisSeg) {
  float dx = xin - xthen[i];
  float dy = yin - ythen[i];
  thisSeg[i] = atan2(dy, dx);  
  targetX = xin - cos(thisSeg[i]) * segLength;
  targetY = yin - sin(thisSeg[i]) * segLength;
}

void reachSegment2(int i, float xin, float yin, float[] xthen, float[] ythen, float[] thisSeg) {
  float dx = xin - xthen[i];
  float dy = yin - ythen[i];
  thisSeg[i] = atan2(dy, dx);  
  targetXArmR = xin - cos(thisSeg[i]) * segLength;
  targetYArmR = yin - sin(thisSeg[i]) * segLength;
}

void segment(float x, float y, float a, float sw) {
  strokeWeight(sw);
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

