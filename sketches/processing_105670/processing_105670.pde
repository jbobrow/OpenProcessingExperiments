
float[] xPos;
float[] yPos;

float gravity;
float[] ySpeed;
float[] xSpeed;
float ballSize;
int numBalls;
boolean fall= false;


void setup(){
size(600,600);
numBalls = 50;  //number of balls
ballSize= 10;
gravity= .5;
fill(255,255,0);

ySpeed = new float[numBalls];
xSpeed = new float[numBalls];
xPos = new float[numBalls];
yPos = new float[numBalls];

for(int i=0; i<numBalls; i++){
  xPos[i] = i*(width/2);
  yPos[i] = random(height);
  ySpeed[i]= 0;
  xSpeed[i]= 0;
  
}
}

  
void draw(){
  background(255);
  
  
  for(int i=0; i <numBalls; i++){
    ellipse(xPos[i],yPos[i],ballSize,ballSize);
    
    if(fall==true){
      
      yPos[i]+= ySpeed[i];
      xPos[i]+= xSpeed[i];
      ySpeed[i]+= gravity;
      
    }
    
    if(yPos[i]>=height-ballSize){
      xPos= yPos;
      fill(random(0,255),random(0,255),random(0,255));
      ballSize=random(10,50);
    }
  }
}
void mousePressed(){
  fall= true;
}



