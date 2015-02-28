
class Ball{
  
  float x,y;
  float xVel,yVel;
  
  float startSpeed=4;
  float speed;
  float speedUp=1.00025;  //how much the ball speeds up over time
  
  
  float ballSize=20;
  
  //setting the starting angle
  float angleRange=PI/6;
  float minAngle=PI/6;
  
  
  Ball(){
    //start in the center
    x=width/2;
    y=width/2;
    
    //set the start speed
    speed=startSpeed;
    
    //start moing at a random angle
    float angle=random(angleRange)+minAngle;
    xVel=cos(angle);
    yVel=sin(angle);
    
    //allow the xVel, yVel or both to be flipped to ensure that the ball cna move in any direction
    //but still in the range we want
    if (random(100)<50)  xVel*=-1;
    if (random(100)<50)  yVel*=-1;
  }
  
  //move the ball
  void update(){
    x+=xVel*speed;
    y+=yVel*speed;
    
    //check if we hit the top
    if (y<0 || y>height)  yVel*=-1;
   
     //speed it up
    speed*=speedUp;
  }
  
  void draw(){
    fill(255);
    rectMode(CENTER);
    rect(x,y,ballSize,ballSize);
    //ellipse(x,y,ballSize,ballSize); 
  }
  
  void paddleBounce(float angle){
    xVel=cos(angle);
    yVel=sin(angle);
   //xVel*=-1; 
  }
  
}

