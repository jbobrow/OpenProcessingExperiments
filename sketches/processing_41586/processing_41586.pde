
public class Ball {
  float xPos;
  float yPos;
  float t; 

  float dotDiameter;

  float ySpeed;
  float xSpeed;
  float gravity;
  
  boolean isMoving = false;
  

  Ball() {
    this.xPos = random(0, width);
    this.yPos = random (0,height); 
    this.t = random (-1,1);
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

  void moveToPoint(float xIn, float yIn, float amt){
   
   float theta = atan2(yIn-yPos, xIn-xPos);
   xPos += cos(theta)*amt;
   yPos += sin(theta)*amt;
    
  }
  
  void checkMouse(){
    
   if(dist(mouseX, mouseY, xPos, yPos) <  INTERACTION_RAD){
    isMoving = true; 
   }
    
  }
  
  

  color col() {
    if((t)< -0.5) {
      return color(142,158,99,150);
    }
    else if ((t)> -0.5 && (t)< 0) {
      return color(245,238,215,150);
    }
    else if ((t)> 0 && (t)< 0.5) {
      return color(196,188,160,150);
    }
    else {
      return color(23,101,115,150);
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
}


