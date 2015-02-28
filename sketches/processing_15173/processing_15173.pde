
class Fish {
  PVector sz;
  PVector loc;
  float speedX;
  float speedY;
  float tailRot;
  float tailSpeed;
  float fin1Rot;
  float fin1Speed;
  float fin2Rot;
  float fin2Speed;
  color c;

  Fish() {
    init();
  }

  Fish(float px, float py) {
    sz = new PVector(px, py);
    init();
  }

  Fish(PVector sz) {
    this.sz = sz;
    init();
  }

  void init() {
    loc = new PVector();
    speedX = (float) random(1, 3.5);
    speedY = 0;//(float) random(0.75, 2.45);
    tailSpeed = speedX * 2;
  }

  void move() {
    loc.x += speedX;
    loc.y += speedY;
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    fill(c);
    c = color (255, 175, 100);
    //(int) random(0, 255), (int) random(0, 255), (int) random(0, 255));
    tail(loc.x, loc.y);
    fin1(loc.x, loc.y);
    fin2(loc.x, loc.y);
    ellipse(loc.x, loc.y, sz.x, sz.y);
    line(loc.x, loc.y, loc.x, loc.y);
    stroke(0);
    arc(loc.x-6, loc.y, 22, 16, 5*PI/4, 2*PI);
    line(loc.x-12, loc.y-5, loc.x-4, loc.y);
    fill(0);
    ellipse(loc.x+20, loc.y-10, 10, 8);
    ellipse(loc.x+20, loc.y+10, 10, 8);
    popMatrix();
  }

  void setSz(PVector Sz) {
    this.speedX = speedX;
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

  void tail(float x, float y) {
    tailRot += tailSpeed;
    if (tailRot>30) {
      tailRot = 30;
      tailSpeed *=-1;
    } 
    if (tailRot < -30) {
      tailRot = -30;
      tailSpeed *=-1;
    }
    pushMatrix();
    translate(x-40, y);
    rotate(radians(tailRot));

    triangle(-40, -20, -40, 20, 0, 0);
    strokeWeight(1.15);
    line(0, 0, -35, -11);
    line(0, 0, -28, -4);
    line(0, 0, -37, 0);
    line(0, 0, -28, 4);
    line(0, 0, -35, 11);
    strokeWeight(1);
    popMatrix();
  }

  void fin1(float x, float y) {
    fin1Rot += tailSpeed;
    if (fin1Rot>30) {
      fin1Rot = 30;
      fin1Speed *=-1;
    } 
    if (fin1Rot < -30) {
      fin1Rot = -30;
      fin1Speed *=-1;
    }
    pushMatrix();
    translate(x, y-22);
    rotate(radians(fin1Rot));

    //arc(x, y, width, height, start, stop);
    arc(0, 0, 15, 30, PI, 3*PI/2);
    strokeWeight(1.15);
    line(-4, 0, -6, -8);
    line(-1, 0, -3, -12);
    strokeWeight(1);
    popMatrix();
  }

  void fin2(float x, float y) {
    fin2Rot += tailSpeed*-1;
    if (fin2Rot>30) {
      fin2Rot = 30;
      fin2Speed *=-1;
    } 
    if (fin2Rot < -30) {
      fin2Rot = -30;
      fin2Speed *=-1;
    }
    pushMatrix();
    translate(x, y+21);
    rotate(radians(fin2Rot));
    //arc(x, y, width, height, start, stop);
    arc(0, 0, 15, 30, PI/2, PI);
    strokeWeight(1.15);
    line(-4, 0, -6, 8);
    line(-1, 0, -3, 12);
    strokeWeight(1);
    popMatrix();
  }
}


