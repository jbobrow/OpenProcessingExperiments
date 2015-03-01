

//declare dispaly counts
int ballCount=60;



float[] centerX=new float[ballCount];
float[] centerY=new float[ballCount];
float[] speedX=new float[ballCount];
float[] speedY=new float[ballCount];
float[] scalar=new float[ballCount];  
float[] angle=new float[ballCount];


//background setup
float k=0;
float exponentX=1;
float exponentY=1;



void setup() {
  size(1250, 700);
  frameRate(50);
  background(0);

  // original data
  for (int i=0; i<ballCount; i++) {
    centerX[i]=random(0, width);
    centerY[i]=random(0, height);

    speedX[i]=random(-1.5, 1.5);
    speedY[i]=random(-1.5, 1.5);

    scalar[i]=random(50, 100);
    angle[i]=random(TWO_PI);
  }
}



void draw() {
  //renew background and delay effect
  noStroke();
  fill(0, 5);
  rect(0, 0, width, height);
  k+=0.1;
  //back to start situation
  if (k==1) {
    k=0;
    background(0, 25, 30);
  }


  // big ball move
  for (int i=0; i<ballCount; i++) {

    centerX[i]+=pow(speedX[i], exponentX);
    centerY[i]+=pow(speedY[i], exponentY);


    // combine big ball rule
    for (int j = 0; j<ballCount; j++) {
      stroke(255);
      strokeWeight(0.01);
      if (abs(centerX[i]-centerX[j])<150 && abs(centerY[i]-centerY[j])<150) {
        line(centerX[i], centerY[i], centerX[j], centerY[j]);
      }
    }

    //display big ball


    ball(centerX[i], centerY[i], scalar[i], angle[i]);

    // define the edge
    if (centerX[i]>width)speedX[i] = speedX[i]*-1;
    if (centerX[i]<0)speedX[i] = speedX[i]*-1;
    if (centerY[i]>height)speedY[i] = speedY[i]*-1;
    if (centerY[i]<0)speedY[i] = speedY[i]*-1;

    //small ball circle moving
    angle[i]+=0.01;
  }
}

void ball(float ballX, float ballY, float ballScalar, float ballAngle) {

  //big ball
  fill(0, 204, 204);
  ellipse(ballX, ballY, 5, 5);

  //small ball
  ellipse(ballX+ballScalar*cos(ballAngle), ballY+ballScalar*sin(ballAngle), 2, 2);
  ellipse(ballX+ballScalar*cos(ballAngle+PI), ballY+ballScalar*sin(ballAngle+PI), 2, 2);

  //balls group connect line
  stroke(255);
  strokeWeight(0.5);
  line(ballX, ballY, ballX+ballScalar*cos(ballAngle), ballY+ballScalar*sin(ballAngle));
  line(ballX, ballY, ballX+ballScalar*cos(ballAngle+PI), ballY+ballScalar*sin(ballAngle+PI));
}
