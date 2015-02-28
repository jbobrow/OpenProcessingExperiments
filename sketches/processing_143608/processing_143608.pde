

class Block {
  private int [] ang = { 
    0, 60, 120
  };
  private float wdrect;
  private float hgrect;
  private float  angle;
  private float x, y;
  int rndm;
  //  private boolean intersect = false;

  Block (float x, float y, float wd, float hg) {
    this.wdrect = wd;
    this.hgrect = hg;
    rndm = (int)random(ang.length);
    angle = radians(ang[rndm]);
    this.x=x; 
    this.y=y;
  }


  void display() {

    pushMatrix();
    rectMode(CENTER);
    translate(x, y);
    rotate(angle);
    rect(0, 0, wdrect, hgrect+1); 
//    rect(0, -1, wdrect, hgrect); 
    popMatrix();
  }

  boolean intersect(float inX, float inY) {
//    pushMatrix();
//    translate(x, y);
//    rotate(angle);
    boolean bf = false;

    if (inX > x-wdrect/2 && inX < x+wdrect/2 
    &&  inY > y-hgrect/2 && inY < y+hgrect/2) {
      bf =  true;
    }

//    popMatrix();
    return bf;
  } 

  void nextAngle() {
    angle = radians(ang[(++rndm)%ang.length]);
  }

  void nextRandomAngle() {
    angle = radians(ang[(int)random(ang.length)]);
  }

  void setAngle(int in) {
    angle = radians(ang[in]);
  }


  void changeSizeAndPos(int inS, float inX, float inY) {
    this.wdrect = inS;
    this.wdrect = constrain(this.wdrect, 5, width/15);
    this.hgrect = this.wdrect*1.75;
    
    this.x = inX;
    this.y = inY;
  }
  
  void setHeight(float in){
  this.hgrect = in;
  }

}

