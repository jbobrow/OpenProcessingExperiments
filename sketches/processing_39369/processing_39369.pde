
//ball bouncing accross the screen

float x;
float y;
float incY;
float incX;
float ballD;

float c;
float d;
float inc1Y;
float inc1X;
float ballD1; 

void setup(){
  size(600, 600);
  //background(255);
  smooth();
  
  //ballOzero start and diameter 
  x=250;
  y=200;
  ballD=30;
  incY=1;
  incX=-1;
  
  //ballOne start, diameter and speed 
  c=350;
  d=400;
  ballD1=20;
  inc1Y=1;
  inc1X=1;
  
   
}

void draw(){
  background(255);
  
  //ballZero
  x=x+incX; y=y+incY;
  fill(0);
  ellipse(x, y, ballD, ballD);
  
  //interaction of BALL 0
  if(x+ballD/2>=width){
    incX=incX-1;
  }
  if(x-ballD/2<=0){
    incX=incX+1;
  }
  if(y+ballD/2>=height){
    incY=incY-1;
  }
  if(y-ballD/2<=0){
    incY=incY+1;
  }
  
  
  //ballOne
  c=c+inc1X; d=d+inc1Y;
  fill(125);
  ellipse(c, d, ballD1, ballD1);
  
  //interaction  of Ball 1
  if(c+ballD1/2==width){
    inc1X=inc1X-1;
  }
  if(c-ballD1/2==0){
    inc1X=inc1X+1;
  }
  if(d+ballD1/2==height){
    inc1Y=inc1Y-1;
  }
  if(d-ballD1/2==0){
    inc1Y=inc1Y+1;
  }

  //collisions 
  if(c+ballD1/2==x+ballD/2 && d+ballD1/2==y+ballD/2){
    //the if simply put c==x && d==y
    inc1X=-1.1*inc1X;
    inc1Y=-1.1*inc1Y;
    incX=-1.1*incX;
    incX=-1.1*incX;
    
  }
  
/*
Known problems:
1) if balls are same size, they do not rickashay off of each other
2) if balls are different sizes they will rickashay somewhat but there lies
the issue that the balls must meet at an EXACT point thus the difference
between iteration k and k+1 could mean the centre points never cross and thus
the condition is not met.
3) the 4 corners are not resolved
4) all interactions ignore the idea of actual physics.
*/



//following are a couple of attempts to allow for alternate speeds and to keep the balls from crossing outside the boundaries 
    
//attempt at using "for" loops to allow the ball to remine within the boundaries
/*
  //interaction of BALL 0
  for (float i=500; i<height; i=i+incY) {
    //println(i);
    y=y+incY;
  }
  //println(y);
  if(y>=height){
    y=height;
    for(float k=1; y>=0; k++) {
      incY=incY-1;
    }
  }  
*/


//first attempt
/*
  if(y+incY+ballD/2>height){
    y=height;
    incY=incY-1;
  }
  if(y+ballD/2>=height) {
        incY=incY-1;
      }
*/

}

