
int num = 1500; //a number of lines
Ball balls[] = new Ball[num];

int numPos = 7; //a number of gravity points
PVector[] pos = new PVector[numPos];

PVector speed;
float radius = 200;

PVector cPos;


void setup() {
  //frameRate(24);
  size(600, 600);
  background(255);
  strokeWeight(0.5);
  noFill();
  
  cPos = new PVector();

  //gravity points initialize
  for (int i=0; i<numPos; i++) {
    pos[i] = new PVector();
    pos[i].x = width/2 + radius * cos(i*TWO_PI/numPos);
    pos[i].y = height/2 + radius * sin(i*TWO_PI/numPos);
  }

  //balls initialize
  speed = new PVector();
  for (int i=0; i<num; i++) {
    float r = random(0,TWO_PI);
    speed.set(random(3,15)*cos(r), random(3,15)*sin(r));
    balls[i] = new Ball(speed);
  }
}


void draw() {
  fadeToWhite(175);

  for (int i=0; i<num; i++) {
    balls[i].reset();
    balls[i].move();
    balls[i].display();
  }

  //filter(DILATE);
  
//  saveFrame("/render/render_####.jpg");
}


void fadeToWhite(float alp) {
  pushStyle();
  fill(255, alp);
  noStroke();
  rect(0, 0, width, height);
  popStyle();
}


class Ball {
  PVector startPos, endPos, loc, pLoc, sp, acc;
  int index;

  Ball(PVector _sp) {
    startPos = new PVector();
    startPos.set(width/2, height/2);
    endPos = new PVector();
    loc = new PVector();
    pLoc = new PVector(99999, 99999);
    sp = new PVector();
    acc = new PVector(0, 0);

    loc.set(startPos);
    sp.set(_sp);
  }

  void move() {
    acc = PVector.sub(endPos, loc);
    acc.normalize();
    float multVal =sq(PVector.dist(endPos, loc))/100000;
    acc.mult(multVal);
    sp.add(acc);
    loc.add(sp);
    
    if(PVector.dist(cPos,loc) < radius){
      sp.mult(0.9);
    }
    
  }

  void display() {
    if (pLoc.mag()<10000) {
      pushStyle();
      color c = color(map(PVector.dist(loc,endPos),radius,radius*1.2,255,64),acc.mag()*100,map(PVector.dist(loc,endPos),0,radius,0,128));
      stroke(c);
      //fast is narrow
      strokeWeight(1/(sp.mag()+1)*10);
      line(pLoc.x, pLoc.y, loc.x, loc.y);
      popStyle();
    }
    pLoc.set(loc);
  }

  void reset() {
    //each 3fr, change gravity point
    int index = (int(frameCount/frameRate*3)+1) %numPos;
    endPos.set(pos[index]);
  }
}
