
int N = 2000;
int numCharges = 2;
float[] radius, xCenter, yCenter, xVel, yVel, xAccel, yAccel;
//float chargeX, chargeY;
//float charge2X, charge2Y;
float mu;
float crit;
float[] chargesX, chargesY ;
int[] chargesSign;


void setup(){
  size(600 , 600);
  background(255);
  radius = new float[N];
  xCenter = new float[N];
  yCenter = new float[N];
  xVel = new float[N];
  yVel = new float[N];
  xAccel = new float[N];
  yAccel = new float[N];
  chargesX = new float[numCharges];
  chargesY = new float[numCharges];
  chargesSign = new int[numCharges];
 
  for(int j = 0; j < numCharges; j++){
    chargesX[j] = random(0, width);
    chargesY[j] = random(0, height);
    chargesSign[j] = random(-1,1) > 0 ? 1 : -1;
  }
  
  //chargeX = new float[numCharges];
  //chargeX = width/4;
  //chargeY = height/2; 
  //charge2X = 0.75 * width;
  //charge2Y =  height/2;
  
  
  for(int i = 0; i < N; i++){
    radius[i] = 1;
    //xCenter[i] = random(-width, 2*width);
    //yCenter[i] = random(-height, 2*height);
    xCenter[i] = random(0, width);
    yCenter[i] = random(0, height);
  }
  mu = .5;
  crit = sq(30 * radius[0]);
}

void draw(){
  //background(255);
  //chargesX[1] = mouseX;
  
  //chargesY[1] = mouseY;
  for(int i = 0; i < N; i++){
    ballUpdate(i);
    ballDisplay(i);
  }
  //println(xCenter);
}

float addForcesX(int i){
  float temp = 0;
  for(int j = 0; j < numCharges; j++){
    temp += chargesSign[j] * forceX(xCenter[i], yCenter[i], chargesX[j], chargesY[j]);
  }
  return temp;
}

float addForcesY(int i){
  float temp = 0;
  for(int j = 0; j < numCharges; j++){
    temp +=  chargesSign[j] * forceY(xCenter[i], yCenter[i], chargesX[j], chargesY[j]);
  }
  return temp;
}

void ballUpdate(int i){
   //xAccel[i] = forceX(xCenter[i], yCenter[i], chargesX[0], chargesY[0]) - forceX(xCenter[i], yCenter[i], chargesX[1], chargesY[1]);
   //xAccel[i] =( sq(xCenter[i]) + sq(yCenter[i]) < crit )? 0 : xAccel[i];
   xAccel[i] = addForcesX(i);
   //yAccel[i] = forceY(xCenter[i], yCenter[i], chargeX, chargeY) - forceY(xCenter[i], yCenter[i], charge2X, charge2Y);
   yAccel[i] = addForcesY(i);
   //yAccel[i] =( sq(xCenter[i]) + sq(yCenter[i]) < crit )? 0 : yAccel[i];
    xAccel[i] = sq(xAccel[i]) + sq(yAccel[i])> .005 ? xAccel[i] : 0;
    yAccel[i] = sq(xAccel[i]) + sq(yAccel[i])> .005 ? yAccel[i] : 0;
   //xAccel[i] = sq(xCenter[i]) + sq(yCenter[i]) > .1 ? xAccel[i] : 0;
   //yAccel[i] = sq(xCenter[i]) + sq(yCenter[i]) > .1 ? yAccel[i] : 0;
   xVel[i] = (1 - mu) * xVel[i] + xAccel[i];
   yVel[i] = (1 - mu) * yVel[i] + yAccel[i]; 
   xCenter[i] += xVel[i];
   yCenter[i] += yVel[i];
  
}

void ballDisplay(int i){
  fill(#2E8E32, 220);
  //pushMatrix();
  //translate(width/2, height/2);
  //ellipse(xCenter[i], yCenter[i], 2 * radius[i], 2 * radius[i]);
  stroke(#3297AF);
  point(xCenter[i], yCenter[i]);
  //popMatrix();
}

float forceX(float x_, float y_, float chargeX_, float chargeY_){
  return -(x_ - chargeX_)/width/pow((sq((x_ - chargeX_)/width) + sq((y_ - chargeY_ )/height)), 1.5)/20;
}

float forceY(float x_, float y_, float chargeX_, float chargeY_){
  return -(y_ - chargeY_)/width/pow((sq((x_ - chargeX_)/width) + sq((y_ - chargeY_ )/height)), 1.5)/20;
}

void keyPressed(){
  setup();
}


