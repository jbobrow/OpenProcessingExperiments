
class Fish {
  PVector sz;
  PVector loc;
  float speedX;
  float speedY;
  float x;
  float y;
  int w = 150;
  int h = 70;
  float tailRot;
  float tailSpeed;
  float fin1Rot;
  float fin2Rot;
  float finSpeed;

  //constructors
  Fish() {
    init();
  }

  Fish(float w, float h) {
    sz = new PVector(w,h);
    init();
  }

  Fish(PVector sz) {
    this.sz = sz;
    init();
  }

  void init() {
    loc = new PVector();
    speedX = (float) random(.6, .8);
    speedY = (float) random(.2, .3);
    tailSpeed = speedY;
    finSpeed = speedX;
  }

  void move() {
    loc.x += speedX;
    loc.y += speedY;
  }

  void display() {

    tail(loc.x, loc.y);
     
    fin1(loc.x, loc.y);
     
    fin2(loc.x, loc.y);

    fill(127, 242, 182);
    noStroke();
    ellipse(loc.x, loc.y, w, h);//body
    
    fill(255);
    stroke(0);
    ellipse(loc.x+35, loc.y+20, 15, 10);//right eye
    ellipse(loc.x+35, loc.y-20, 15, 10);//left eye
  
    fill(0);
    stroke(0);
    ellipse(loc.x+37, loc.y+22, 6, 6);//right pupil
    ellipse(loc.x+37, loc.y-18, 6, 6);//left pupil
  }

  //setters/getters
  void setSz(PVector sz) {
    //this.speedX = speedX;
  }

  PVector getSz() {
    return sz;
  }

  float getSpeedX() {
    return speedX;
  }

  PVector getLoc() {
    return loc;
  }

  void setLoc(PVector inLoc) {
    loc = inLoc;
  }
  
    void tail(float x, float y){
    tailRot += tailSpeed;
      if (tailRot>5) {
        tailRot = 5;
        tailSpeed *=-1;
      } 
      if (tailRot < -5) {
        tailRot = -5;
        tailSpeed *=-1;
      }
      pushMatrix();
      translate(x,y);
      rotate(radians(tailRot));
      
      fill(127, 242, 182);
      noStroke();
      arc(-60, 0, 100, 60, 3*PI/4, 5*PI/4);//fin
      
      fill(7, 89, 142);
      ellipse(-110, 0, 30, 73);//makesfincurved
      popMatrix();
    }
    
    void fin1(float x, float y){
    fin1Rot -= finSpeed;
      if (fin1Rot > 5) {
        fin1Rot = 5;
        finSpeed *=-1;
      } 
      if (fin1Rot < -5) {
        fin1Rot = -5;
        finSpeed *=-1;
      }
    pushMatrix();
    translate(x, y);
    rotate(radians(fin1Rot));
    
    fill(127, 242, 182);
    noStroke();
    arc(0, -32, 50, 50, 5*PI/4, 7*PI/4);//leftwing
  
    stroke(0);
    line(0, -34, 0, -57);//leftwinglines
    line(0, -34, 11, -55);
    line(0, -34, -11, -55);
  
    popMatrix();
    }
    
    void fin2(float x, float y){
    fin2Rot += finSpeed;
      if (fin2Rot > 5) {
        fin2Rot = 5;
        finSpeed *=-1;
      } 
      if (fin2Rot < -5) {
        fin2Rot = -5;
        finSpeed *=-1;
      }
    pushMatrix();
    translate(x, y);
    rotate(radians(fin2Rot));
    
    fill(127, 242, 182);
    noStroke();
     arc(0, 32, 50, 50, PI/4, 3*PI/4);//rightwing
  
  stroke(0);
    line(0, 34, 0, 57);//rightwinglines
    line(0, 34, 11, 55);
    line(0, 34, -11, 55);
  
  popMatrix();
  
  smooth();
    }


}


