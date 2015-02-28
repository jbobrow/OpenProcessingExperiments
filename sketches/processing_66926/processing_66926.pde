
int ballNum=50;
int ballRadius = 30;

float[] circleX= new float[ballNum];
float[] circleY= new float[ballNum];
float[] ballSpeed = new float [ballNum];



void setup() {
  size(500, 500);
  background(0);
  smooth();
  frameRate(30); 


  for (int i = 0; i < ballNum; i++) {
    circleX[i] =random (500);
    circleY[i] = random (0,50);
    ballSpeed[i] = random(5,11);
  }
}


void draw  () {
  background(0);
  fill(random(255), mouseX, mouseY);
  ellipseMode(RADIUS);
  
  for (int i = 0; i <  ballNum; i++) {
    ellipse(circleX[i], circleY[i], ballRadius, ballRadius);
    ballRadius = constrain(ballRadius-1, 15, 22);
  }
  for (int i = 0; i < circleX.length; i++) {
    if ((circleY[i] >= width) || (circleY[i] <=0)) {
      ballSpeed[i] = ballSpeed[i] * -1; 
  }
  circleY[i] = circleY[i]+ ballSpeed[i]; 
}
}
