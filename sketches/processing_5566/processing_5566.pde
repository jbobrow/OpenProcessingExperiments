
int centerX = 200;
int centerY = 200;
float ballX;
float ballY;
int ballRadius = 20;
int radius = 100;

// For the orbital period of the "Earth"
float angle = 0;
float speed = 0.01;

// For the orbital period of the "moon"
float passedAngle = 0;
float passedSpeed = 0.3;

void setup() {
  size(400,400);
  background(0);
  fill(255);
  stroke(255);
  smooth();
  frameRate(60);
}

void draw(){
  
  // Determines the orbiting position of the "Earth"
  ballX = centerX + sin(angle) * radius;
  ballY = centerY + cos(angle) * radius;
  
  // Calls the function to create the "Earth" and "Moon"
  drawAtom(ballX,ballY,ballRadius,passedAngle);
  // drawAtom(ballY,ballX + 50,ballRadius);
  
  angle += speed;
  passedAngle += passedSpeed;
  
}

void drawAtom(float ballX, float ballY, int radius, float angle) {
  float newBallX;
  float newBallY;
  
  newBallX = ballX + sin(angle) * radius;
  newBallY = ballY + cos(angle) * radius;
  
  // Creates the invisible "Earth"
  noStroke();
  noFill();
  ellipse(ballX,ballY,1,1);
  
  // Creates the "moon"
  fill(random(255),random(255),random(255),random(255));
  ellipse(newBallX, newBallY,10,10);
  
  // Try adding another "moon"!
  
}



