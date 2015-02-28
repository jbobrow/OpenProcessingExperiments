
// Get points on a circle
// make the rotate


float angle;
float myRadius = 200;

int resolution = 200; // number of balls
int minBallSize = 4;
int maxBallSize = 40;

float[] x = new float[resolution];
float[] y = new float[resolution];

float rotationSpeed=1;
float rotationRadians = radians(rotationSpeed);
float rotationAccelerationFactor = 3;
float rotationAcceleration;

float ballDiameter = 10;


void setup() {
  size(600, 600);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
}


void draw() {
  background(0, 0, 100, 50);
  noFill();
  stroke(0);
  //ellipse(width/2, height/2, myRadius*2, myRadius*2);
  
  rotationAcceleration = map(mouseX, 0,width, 0, rotationSpeed*rotationAccelerationFactor);
  
  ballDiameter = map(mouseY, 0, height, minBallSize, maxBallSize);
  
  float angle = radians(360/resolution);
  
  for (int i=0; i < resolution; i++) {
      x[i] = (cos((angle*i) + rotationRadians) * myRadius) + width/2;
      y[i] = (sin((angle*i) + rotationRadians) * myRadius) + height/2; 
      fill(degrees(angle*i),100,100);
      noStroke();
      ellipse(x[i], y[i], ballDiameter, ballDiameter);
  }
  
  rotationRadians += radians(rotationSpeed) + radians(rotationAcceleration);
  
}
