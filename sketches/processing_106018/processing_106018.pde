
int numBalls = 800;

float xBallPos[] = new float[numBalls];
float yBallPos[] = new float[numBalls];

float xSpeed[] = new float[numBalls];
float ySpeed[] = new float[numBalls];
float ballSize[] = new float[numBalls];

color ballColor[] = new color[numBalls];


void setup(){
  background(255);
  size(500,500);
  noStroke();
  
  
  for(int i = 0; i < numBalls; i++){
    xBallPos[i] = int(random(0, width));
    yBallPos[i] = int(random(0, height));
    
    ballSize[i] = int(random(4,10));
    xSpeed[i] = random(-5,5);
    ySpeed[i] = random(-5,5);
    
    ballColor[i] = color(0,0,random(100,255));

  }
}


void draw(){
  background(233,45,33);
  
  
 
  for(int i = 0; i < numBalls; i++){
    fill(ballColor[i]);
    ellipse(xBallPos[i], yBallPos[i], ballSize[i], ballSize[i]);


  }
  
  
  
  for(int i = 0; i < numBalls; i++){
    xBallPos[i] = xBallPos[i] + xSpeed[i];
    yBallPos[i] = yBallPos[i] + ySpeed[i];
  }
  
 for(int i= 0; i < numBalls; i++){
  if(xBallPos[i] > width - ballSize[i]/2 || xBallPos[i] < ballSize[i]/2)
  {xSpeed[i] = xSpeed[i] * -1;}
  
  if(yBallPos[i] > width - ballSize[i]/2 || yBallPos[i] < ballSize[i]/2)
  {ySpeed[i] = ySpeed[i] * -1;}
  
  
}
}
