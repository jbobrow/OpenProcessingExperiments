
Doodle doodle1;
Doodle doodle2;
Doodle doodle3;
Doodle doodle4;

int padding = 5;
int bounds = 105;
int weight = 2;

void setup() {
  //bounds = round(width/4 - padding*2);
  
  size(500,500,P2D);
  background(255);
  fill(20,255);
  noStroke();
  doodle1 = new Doodle(new PVector(width/4 + 5, height/4 + 5), true);
  doodle2 = new Doodle(new PVector(width*3/4 - 5, height/4 + 5), false);
  doodle3 = new Doodle(new PVector(width/4 + 5, height*3/4 - 5), false);
  doodle4 = new Doodle(new PVector(width*3/4 - 5, height*3/4 - 5), true);
}

void draw() {
  fill(255,2);
  //rect(0,0,width,height);
  
  fill(30,45);
  doodle1.update();
  doodle2.update();
  doodle3.update();
  doodle4.update();
}

void mousePressed() {
  background(255);
}

class Doodle {
  PVector start;
  PVector pos;
  PVector dir;
  int segmentLength;
  int segment;
  boolean NW;
  
  Doodle(PVector s, boolean nw) {
    start = s;
    pos = new PVector(0,0);//pos = start;
    dir = new PVector(-1,-1);
    segmentLength = 20;
    segment = 0;
    NW = nw;
  }
  
  void update() { 
    pushMatrix();
    translate(start.x, start.y);
    drawSegment();
    drawSegment();
    drawSegment();
    popMatrix();
  }
  
  void drawSegment() {
    pos.add(dir);
    checkBounds();
    ellipse(pos.x,pos.y, weight,weight);
    updateSegment();
  }
  
  PVector getNewDirection(){
    if (round(random(1,2)) == 2) {
      drawJoint(pos.x,pos.y);
    }
    segmentLength = round(random(1,3)) * 30;
    segment = 0;
    int r = round(random(1,8));
    switch(r) {
      case 1:
      case 7:
        return getDiagonal(false);
      case 2:
      case 8:
        return getDiagonal(true);
      case 3:
        return new PVector(0,-1);
      case 4:
        return new PVector(0,1);
      case 5:
        return new PVector(1,0);
      case 6:
        return new PVector(-1,0);
      default:
        return new PVector(0,0);
    }
  }
  
  void updateSegment() {
    //segment += sqrt(sq(dir.x) + sq(dir.y));
    segment++; 
    if (segment > segmentLength)
      dir = getNewDirection();
  }
  void checkBounds() {
    if (pos.x < -bounds || pos.x > bounds ||
        pos.y < -bounds || pos.y > bounds) 
    {
      dir.mult(-1);
      pos.add(dir);
    } 
  }
  PVector getDiagonal(boolean negative){
    PVector pv;
    pv = NW ? new PVector(1,1) : new PVector(1,-1);
    if (negative)
      pv.mult(-1);
    return pv;
  }
  
  void drawJoint(int x, int y) {
    //fill(255);
    stroke(40, 200);
    
    int r = round(random(3,9));
    ellipse(x,y, r,r);
    
    //fill(40,55);
    noStroke(); 
  }
}


