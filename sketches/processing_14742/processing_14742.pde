
class Crab {
  
  // instance properties
  PVector sze;
  PVector loc;
  PVector locR;
  PVector locL;
  float speedX, speedY;
  int armAngle = 145;
  float angleChange = 1;
  int angleLimit = 150;
  int armAngle2 = 75;
  float angleChange2 = 1;
  int angleLimit2 = 30;

  
  //constructors
  Crab(){
  }
  
  Crab(float w, float h){
    sze = new PVector(w, h);
    initial();
    initialRight();
    initialLeft();
  }
  
  //initialization
  void initial(){
    loc = new PVector(width/2, height/2);
    speedX = 1;
    speedY = 0.5;
  }
  
  void initialRight(){
    locR = new PVector(loc.x + 75, loc.y - 70);
    speedX = 1;
    speedY = 0.5;
  }
  
  void initialLeft(){
    locL = new PVector(loc.x - 75, loc.y - 70);
    speedX = 1;
    speedY = 0.5;
  }
  
  //methods
  void display(){
    noStroke();
    fill(255,0,0);
    ellipse(loc.x, loc.y, sze.x, sze.y);
    //eyes
    fill(0);
    ellipse(loc.x - 30, loc.y - 60, 13, 13);
    ellipse(loc.x + 30, loc.y - 60, 13, 13);
    //smile
    stroke(0);
    arc(loc.x, loc.y - 20, 40, 40, 0, PI);
    //left legs
    noStroke();
    fill(255,0,0);
    pushMatrix();
    translate(loc.x -100, loc.y + 50);
    rotate(radians(310));
    ellipse(0, 0, 100, 25);
    popMatrix();
    ellipse(loc.x - 120, loc.y, 100, 25);
    pushMatrix();
    translate(loc.x - 110, loc.y - 50);
    rotate(radians(30));
    ellipse(0, 0, 100, 25);
    popMatrix();
    //right legs
    fill(255,0,0);
    pushMatrix();
    translate(loc.x +100, loc.y - 50);
    rotate(radians(330));
    ellipse(0, 0, 120, 25);
    popMatrix();
    ellipse(loc.x + 120, loc.y, 100, 25);
    pushMatrix();
    translate(loc.x + 110, loc.y + 50);
    rotate(radians(30));
    ellipse(0, 0, 100, 25);
    popMatrix();
    //top hat

  }
  
  void animate(){
    loc.x += speedX;
    loc.y += speedY;
    if(loc.y - 275 < 0){
      speedY *= -1;
    }
    if(loc.y+100 >height){
      speedY *= -1;
    }
    if(loc.x+175 > width){
      speedX *= -1;
    }
    if(loc.x-175<0){
      speedX *= -1;
    }
    
    //moving claws
    locR.x += speedX;
    locR.y += speedY;
    armAngle += angleChange;
    if(armAngle > angleLimit || armAngle<110){
      angleChange = -angleChange;
      armAngle += angleChange;
    }
    
    locL.x += speedX;
    locL.y += speedY;
    armAngle2 += angleChange2;
    if(armAngle2 < angleLimit2 || armAngle2>90){
      angleChange2 = -angleChange2;
      armAngle2 += angleChange2;
    }
  }
    
  void rightClaw(){
    //right claw
    fill(255,0,0);
    pushMatrix();
    translate(locR.x, locR.y);
    rotate(radians(armAngle));
    ellipse(-40, 10, 150, 50);
    popMatrix();
    pushMatrix();
    translate(locR.x, locR.y);
    rotate(radians(armAngle-40));
    ellipse(-120, -45, 120, 50);
    popMatrix();
    //right pincher
    pushMatrix();
    translate(locR.x, locR.y);
    rotate(radians(armAngle));
    triangle(-160, 80 , -60, 130, -90, 30);
    popMatrix();
  }
    
  void leftClaw(){
    //left claw
    noStroke();
    fill(255,0,0);
    pushMatrix();
    translate(locL.x, locL.y);
    rotate(radians(armAngle2));
    ellipse(-40, -10, 150, 50);
    popMatrix();
    pushMatrix();
    translate(locL.x, locL.y);
    rotate(radians(armAngle2+30));
    ellipse(-130, 40, 120, 50);
    popMatrix();
    //left Pincher
    pushMatrix();
    translate(locL.x, locL.y);
    rotate(radians(armAngle2));
    noStroke();
    triangle(-100, -100 , -180, -50, -100, -20);
    popMatrix();
  }
  

    
  //getters/setters
  
  void setSze(PVector sze){
    this.sze = sze;
  }
  
  PVector getSze(){
    return sze;
  }

  void setLoc(PVector loc){
    this.loc = loc;
  }
  
  PVector getLoc(){
    return loc;
  }
  
  void setSpeedX(float speedX){
    this.speedX = speedX;
  }
  
  float getSpeedX(){
    return speedX;
  }
  
  void setSpeedY(float speedY){
    this.speedY = speedY;
  }
  float getSpeedY(){
    return speedY;
  }
}
    
  

