
class AquaticLife {
  
  PVector sze;
  PVector loc;
  PVector speed;
  PVector locR, locL;
  float w,h;
  float armAngle;
  float armAngle2;
  float angleChange;
  float angleLimit;
  float angleChange2;
  float angleLimit2;
  
  AquaticLife(){
  }
  
  AquaticLife(float w, float h, PVector speed, float armAngle, float angleChange, float angleLimit, 
  float armAngle2, float angleChange2, float angleLimit2){
    sze = new PVector(w, h);
    this.speed = speed;
    this.armAngle = armAngle;
    this.angleChange = angleChange;
    this.angleLimit = angleLimit;
    this.armAngle2 = armAngle2;
    this.angleChange2 = angleChange2;
    this.angleLimit2 = angleLimit2;
    initial();
    initialRight();
    initialLeft();
    animate();
  }
  
  //initialization
    void initial(){
    loc = new PVector(width/2, height/2);
  }

  
  void initialRight(){
    locR = new PVector(loc.x + 75, loc.y - 70);
  }
  
  void initialLeft(){
    locL = new PVector(loc.x - 75, loc.y - 70);
  }
  
    void animate(){
    loc.x += speed.x;
    loc.y += speed.y;
    if(loc.y - 275 < 0){
      speed.y *= -1;
    }
    if(loc.y+100 >height){
      speed.y *= -1;
    }
    if(loc.x+175 > width){
      speed.x *= -1;
    }
    if(loc.x-175<0){
      speed.x *= -1;
    }

    
    //moving claws
    locR.x += speed.x;
    locR.y += speed.y;
    armAngle += angleChange;
    if(armAngle > angleLimit || armAngle<110){
      angleChange = -angleChange;
      armAngle += angleChange;
    }
    

    
    locL.x += speed.x;
    locL.y += speed.y;
    armAngle2 += angleChange2;
    if(armAngle2 < angleLimit2 || armAngle2>90){
      angleChange2 = -angleChange2;
      armAngle2 += angleChange2;
    }
  }
  
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
  
}

