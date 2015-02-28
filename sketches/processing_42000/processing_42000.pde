
public class Ball {
  float xPos;
  float yPos;
  
  
    float oXPos;
  float oYPos;
  
  float t; 

  float dotDiameter;

  float ySpeed;
  float xSpeed;
  float gravity;
  
  boolean isMoving = false;
  
  boolean isTouching = false;
  
  boolean Towards = false;
  
  float randomSide;
  
  float xPt;
  float yPt;
  int state;

int b = 50;

int towardState;
int awayState;

AudioPlayer toward; //= m.loadFile("sound2.wav");
AudioPlayer away;//= m.loadFile("sound1.wav"); 

AudioPlayer b3;    
AudioPlayer b4;    
AudioPlayer b5;
AudioPlayer b10;
  Ball() {
    this.xPos = random(0, width);
    this.yPos = random (0,height); 
    this.oXPos = this.xPos;
    this.oYPos = this.yPos;
    this.t = random (-1,1);
    randomSide = random (4);
    this.state = 0;
     away = m.loadFile("sound2.wav");
   toward = m.loadFile("sound1.wav");
   b3 = m.loadFile("button-9.wav");
   b4 = m.loadFile("button-4.wav");
    b5 = m.loadFile("button-3.wav");
    b10 = m.loadFile("button-10.wav");
   towardState = 0;
   awayState = 0;
  }

//  void pos(float x, float y) {
//    float d = dist(x, y, this.xPos, this.yPos);
//
//
//
//    this.yPos = this.yPos + this.ySpeed * this.t /d;
//    this.ySpeed = this.ySpeed + this.gravity;
//
//    this.xPos = this.xPos +this.xSpeed * this.t /d;
//  }

  void moveToPoint(float xIn, float yIn, float amt, int soundType){
   
   float theta = atan2(yIn-yPos, xIn-xPos);
   xPos += cos(theta)*amt;
   yPos += sin(theta)*amt;
    
    if (xPos != xIn && yPos != yIn){
    
     if(soundType==1 && towardState != 1){
     //away.mute();
    //toward.unmute();
     awayState = 0;
    toward.play(1); 
    
     towardState = 1;
   }
    if(soundType==2 && awayState != 1){
  //toward.mute();
// away.unmute();
      towardState = 0;
     // away.play(1);
     //b3.play(1);
    // b4.play(1);
   // b5.play(1);
    b10.play(1);
      awayState = 1;
    }
    }
}
  
  void checkMouse(){
    
   if(dist(mouseX, mouseY, xPos, yPos) <  INTERACTION_RAD){
    isMoving = true; 
   }
    
  }
  
 void altDirection(){
  if (randomSide < 1){
   xPt = random(0, width);
  yPt = 0;
  }
 else if(randomSide > 1 && randomSide < 2){
  xPt = width;
 yPt = random (0,height); 
  }
  else if (randomSide >2 && randomSide<3){
   xPt = random(0,width);
  yPt = height; 
  }
  else{
   xPt = 0;
  yPt = random(0,height); 
  }
 } 

  color col() {
//    if((t)< -0.7) {
//      return color(0,100,50,150);
//    }
//    else if ((t)> -0.7 && (t)< -0.4) {
//      return color(60,100,50,150);
//    }
//    else if ((t)> -0.4 && (t)< -0.1) {
//      return color(120,100,50,150);
//    }
//    else if ((t)> -0.1 && (t)< 0.2) {
//      return color(180,100,50,150);
//    }
//    else if ((t)> 0.2 && (t)< 0.5) {
//      return color(240,100,50,150);
//    }
//    else {
//      return color(200,100,50,150);
//    }
if((t)< 0) {  
  return color(180,100,b,150);
}
else{
  return color(0,100,b,150);
}
  }

  void dotSize (float x,float y) {
    this.dotDiameter = (dist(x, y, xPos, yPos))/25;
  }

  void create() {
    ellipse(this.xPos,this.yPos, this.dotDiameter, this.dotDiameter);
  }

  void changeSpeed() {
    if (yPos < 0-100) {
      ySpeed = ySpeed * -0.95;
      yPos = random (0,height);
    }   
    if(xPos>width+100 || xPos < 0-100) {
      xSpeed = xSpeed * -1;
      xPos = random(0, width);
    }


    if (mouseX>pmouseX) {
      xSpeed += .4;
    }
    if (mouseX<pmouseX) {
      xSpeed -= .4;
    }

    if (mouseY>pmouseY) {
      ySpeed -= .4;
    }
    if (mouseY<pmouseY) {
      ySpeed += .4;
    }
  }
  
  float x(){
   return this.xPos; 
  }

void setB(int sB){
  this.b = sB;
}

int findB(){
 return this.b; 
}

boolean intersect(Ball ballTwo){
  float distance = dist(xPos, yPos, ballTwo.xPos,ballTwo.yPos);
  if (distance < (dotDiameter/2 + ballTwo.dotDiameter/2)){
   return true; 
  }
  else{
   return false; 
  }
}
}


