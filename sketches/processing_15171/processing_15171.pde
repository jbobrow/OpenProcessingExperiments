
class Fish {
  PVector sz;
  PVector loc;
  float speedX;
  float speedY;
  float tailRot;
  float tailSpeed;

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
    fill(255, 100, 0);
    //(int) random(0, 255), (int) random(0, 255), (int) random(0, 255));
    tail(loc.x, loc.y);
    ellipse(loc.x, loc.y, sz.x, sz.y);
    stroke(0);
    arc(loc.x-6, loc.y, 22, 16, 5*PI/4, 2*PI);
    line(loc.x-12, loc.y-5, loc.x-4, loc.y);
    fill(0);
    ellipse(loc.x+20, loc.y-10, 10, 8);
    ellipse(loc.x+20, loc.y+10, 10, 8);
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
    float x2 = x-60;
    float y2 = y-22;
    float x3 = x-60;
    float y3 = y+22;
    float x4 = x;
    float y4 = y;

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
    line(0, 0, -28, -5);
    line(0, 0, -37, 0);
    line(0, 0, -28, 5);
    line(0, 0, -35, 11);
    strokeWeight(1);
    popMatrix();
  }
}


//crickel@smu.edu


