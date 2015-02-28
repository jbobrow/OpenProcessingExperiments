
class Crab {
  
  // instance properties
  PVector sze;
  PVector loc;
  float speedX, speedY;
  
  //constructors
  Crab(){
  }
  
  Crab(float w, float h){
    sze = new PVector(w, h);
    initial();
  }
  
  //initialization
  void initial(){
    loc = new PVector(width/2, height/2);
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
  }
  
  void claws(){
    //right claw
    fill(255,0,0);
    pushMatrix();
    translate(loc.x + 100, loc.y - 100);
    rotate(radians(-50));
    ellipse(0, 0, 150, 50);
    popMatrix();
    pushMatrix();
    translate(loc.x + 140, loc.y - 200);
    rotate(PI/2);
    ellipse(0, 0, 120, 50);
    popMatrix();
    //left claw
    fill(255,0,0);
    pushMatrix();
    translate(loc.x - 100, loc.y - 100);
    rotate(radians(50));
    ellipse(0, 0, 150, 50);
    popMatrix();
    pushMatrix();
    translate(loc.x - 140, loc.y - 200);
    rotate(PI/2);
    ellipse(0, 0, 120, 50);
    popMatrix();
    //right pincher
    triangle(loc.x + 30, loc.y - 200 , loc.x + 145, loc.y - 260, loc.x + 160, loc.y - 170);
    stroke(0);
    strokeWeight(2);
    line(loc.x + 30, loc.y - 200, loc.x + 120, loc.y - 200);
    //left Pincher
    noStroke();
    triangle(loc.x - 30, loc.y - 200 , loc.x - 145, loc.y - 260, loc.x - 160, loc.y - 170);
    stroke(0);
    strokeWeight(2);
    line(loc.x - 30, loc.y - 200, loc.x - 120, loc.y - 200);
    
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
    
  

