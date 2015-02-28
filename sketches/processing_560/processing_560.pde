
class Being {
  float redVal;
  float greenVal;
  float blueVal;
  float alphaVal;
  float xloc;
  float yloc;
  int age;
  boolean isPregnant;
  boolean isAlive;
  int progeny;
  int gestation;
  float speed = 2;
  //boolean isIncest;
  //int inbreeding;

  Being() {
    alphaVal = 255;
    redVal = 255;
    greenVal = 40;
    blueVal = 100;
    xloc = random(width);
    yloc = random(height);
    gestation = 0;
    isPregnant = false;
    isAlive = true;
    progeny = 0;
    age = 200;
  }

  Being(float xloc_, float yloc_/*, color b1Color, color b2Color*/) {
    //initcolor;
    redVal = 255;
    greenVal = 40;
    blueVal = 100;
    alphaVal = 255;
    gestation = 0;
    isPregnant = false;
    isAlive = true;
    progeny = 0;
    xloc = xloc_;
    yloc = yloc_;
    age = 0;
  }

  void wander(float speed_) {
    xloc += random(-speed_,speed_);
    yloc += random(-speed_,speed_);
  }

  void rest() {
    isPregnant = true;
  }

  void incrementValues() {
    age++;
    redVal -= 20;
    if(alphaVal > 30) {
      alphaVal--;
    }
  }

  void checkAge() {
    if(age > maxAge * 5) {
      isAlive = false;
    }
  }

  void drawMe() {
    noStroke();
    fill(redVal, greenVal, blueVal, alphaVal);
    ellipse(xloc, yloc, 5, 5);
    wander(speed);
  }
  
  //upon birth, leave home
  void migrate() {
    xloc += random(-10, 10);
    yloc += random(-10, 10);
    }
}


