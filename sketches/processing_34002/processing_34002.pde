
int numBalls=100;
float[]xBall=new float[numBalls];
float[]yBall=new float[numBalls];
float[]xBallSpeed= new float[numBalls];
float[]yBallSpeed= new float[numBalls];
float ballSize=random(20);


void setup(){
  size(500,500);
  for (int i=0; i<numBalls;i++){
  xBall[i]= random(width);
  yBall[i] = random(height);
  xBallSpeed[i] = random(6);
  yBallSpeed[i] = random(6);
}
}
void draw(){
    background(100,200,255); 
     moveBall();
    checkEdgeOfScreen();
    drawBall();  
  
}
void moveBall(){
  for(int i=0; i<numBalls; i++){
  xBall[i]+=xBallSpeed[i];
  yBall[i]+=yBallSpeed[i];
}
}

void checkEdgeOfScreen(){
   for(int i=0; i<numBalls; i++){
  if ((xBall[i]+ballSize*.5>width)||(xBall[i]<0+ballSize*.5))
  {xBallSpeed[i]=xBallSpeed[i]*-1;}
  if ((yBall[i]+ballSize*.5>height)||(yBall[i]<0+ballSize*.5))
  {yBallSpeed[i]=yBallSpeed[1]*-1;}
}
}

void drawBall(){
   
    noStroke();
    fill(240,40,20);
     for(int i=0; i<numBalls; i++){
  ellipse(xBall[i],yBall[i],ballSize,ballSize);
}
}


