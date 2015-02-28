
//Avery Meehan                              Professor Williams
//                                          Final Project                              

void setup() {
  size(400, 400);
  stroke(0);
  strokeWeight(10);
  strokeCap(PROJECT);
  ellipseMode(CENTER);
}
//*********************Power Bar**********************************
float power = 0;
float power_step = 2.0;
boolean powerup = true;
float powerMax = 200;
float powerFactor = 1.5;
float originX = 300;
float originY = 300;
float ballPowerX = 0;
float ballPowerY = 0;
float sliderX = 0;
float sliderY = 0;
float ballX = 0;
float ballY = 0;
boolean startBall = false;
float gravity = 0.7;
float resistance = 0.01;

//*************Power Bar Strength********************************
void draw(){
  background(455);
  fill(220);
  drawPowerGage();
  drawDirection();
  drawBall();
}
 
void drawPowerGage(){
  fill(255, 0, 0);
  stroke(255, 0, 0);
  rect(350 ,300 - powerMax , 25, powerMax);
  fill(0);
  stroke(0);
  rect(350 ,300 - power , 25, power);
    
  if(powerup) {
    power += power_step ;
    if(power >= powerMax) {
      powerup = false;
    }
  } else {
    power -= power_step ;
    if(power <= 0) {
      powerup = true;
    }
  }
}

void drawDirection(){
  fill(0);
  stroke(0);
  sliderX = directionX( originX, originY, 50);
  sliderY = directionY( originX, originY, 50);
  line(originX - sliderX, originY - sliderY, originX, originY);
}

void  drawBall(){
    
  if(startBall) {
    ellipse(ballX, ballY, 10, 10);
    ballPowerY -= gravity;
    ballPowerX *= (1 - resistance);
    ballX -= ballPowerX * 0.1;
    ballY -= ballPowerY * 0.1;
  }
}
  
float directionX(float x, float y, float r) {
  float xDistance = abs(x - min(mouseX, x));
  float yDistance = abs(y - min(mouseY, y));
  float distance = sqrt(pow(xDistance, 2) + pow(yDistance, 2));
  return xDistance * r / distance;
}

float directionY(float x, float y, float r) {
  float xDistance = abs(x - min(mouseX, x));
  float yDistance = abs(y - min(mouseY, y));
  float distance = sqrt(pow(xDistance, 2) + pow(yDistance, 2));
  return yDistance * r / distance;
}
 
void mousePressed() {
  ballX = originX;
  ballY = originY;
  float p = power / powerMax;
  println("power = " + p);
  ballPowerX = (sliderX * p + 2) * powerFactor;
  ballPowerY = (sliderY * p + 2) * powerFactor;
  startBall = true;
}                               
