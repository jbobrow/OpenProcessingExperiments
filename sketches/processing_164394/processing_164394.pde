
int ballCount = 50;

float[] x = new float[ballCount];
float[] y = new float[ballCount];

float[] speedX = new float[ballCount];
float[] speedY = new float[ballCount];

float[] speedStartX = new float[ballCount];
float[] speedStartY = new float[ballCount];

float[] smallAngle = new float[ballCount];


float[] scalar=new float[ballCount];
float newAngle;
float angleColor=0;
int blueColor=30;
float k=0;





void setup() {
  size(1000, 600);
  frameRate(10);
  background(0, 25, 30);
  //angleColor+=0.01;

  for (int i = 0; i<ballCount; i++) {
    x[i] = random(10, width);
    y[i] = random(10, height);
    smallAngle[i]=random(0,TWO_PI);
    speedStartX[i] = random(-5, 5);
    speedStartY[i] = random(-5, 5);
    //scalar[i]=random(0,20);
    
    
  }
}

void draw() {
  //background(0, 25, 30+sin(angleColor)*blueColor);
  angleColor+=0.01;
  
  fill(0, 25, 30+sin(angleColor)*blueColor,k);
  rect(0,0,width,height);
  k+=0.1;
  if(k==40){
    k=0;
  }
  
  
  for (int i=0; i<ballCount; i++) {
    if (abs(mouseX - x[i]) < 20 &&
      abs(mouseY - y[i]) < 20) {
    x[i] += random(-5, 5);
    y[i] += random(-5, 5);
      }
    speedX[i]=speedStartX[i]+2*cos(2*smallAngle[i]);
    speedY[i]=speedStartY[i]+2*sin(2*smallAngle[i]);
    
    scalar[i]=random(20)*sin(angleColor);
    
    for(int j = 0; j<ballCount; j++){
      stroke(255);
      strokeWeight(0.05);
      if(abs(x[i]-x[j])<150 && abs(y[i]-y[j])<150){
      line(x[i],y[i],x[j],y[j]);
      }
   }
    //ball display
    ball(x[i], y[i]);
    x[i] = x[i]+speedX[i];
    y[i] = y[i]+speedY[i];
    
    //border
    if (x[i]>width)speedStartX[i] = speedStartX[i]*-1;
    if (x[i]<0)speedStartX[i] = speedStartX[i]*-1;
    if (y[i]>height)speedStartY[i] = speedStartY[i]*-1;
    if (y[i]<0)speedStartY[i] = speedStartY[i]*-1;
  }
  
}

void ball(float ballX, float ballY){
  fill(0,204,204,50);
  ellipse(ballX,ballY,10,10);
  for(int i=0;i<1;i++){
  smallBall(ballX,ballY);
  }
  
}


void smallBall(float ballX,float ballY){
  for(int i=0;i<ballCount;i++){
  ellipse(ballX+scalar[i]*3*sin(smallAngle[i]),ballY+scalar[i]*3*cos(smallAngle[i]),2,2);
  line(ballX+scalar[i]*3*sin(smallAngle[i]),ballY+scalar[i]*3*cos(smallAngle[i]),ballX,ballY);
  smallAngle[i]+=0.01;
  }
}
  
  
