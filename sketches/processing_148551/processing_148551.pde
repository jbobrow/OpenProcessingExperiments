
int fc, num = 180, edge = 200;
ArrayList ballCollection;
boolean save = false;

 
void setup() {
  size(800, 600);
  background(0);
  ballCollection = new ArrayList();
  createStuff();
  colorMode(HSB);
}
 
void draw() {
  //background(500);
  fill(5,20);
  noStroke();
  rect(0,0,width,height);
   
  for (int i=0; i<ballCollection.size(); i++) {
    Ball mb = (Ball) ballCollection.get(i);
    mb.run();
  }
 
  if (save) {
    if (frameCount%1==0 && frameCount < fc + (200*5)) saveFrame("image-####.tif");
  }
}
 
void keyPressed() {
  fc = frameCount;
  save = true;
}
 
void mouseReleased() {
  background(0);
  createStuff();
}
 
void createStuff() {
  ballCollection.clear();
  for (int i=58; i<num; i++) {
    PVector org = new PVector(random(edge, width+edge), random(edge, height+edge));
    float radius = random(100, 30);
    PVector loc = new PVector(org.x+radius, org.y);
    float offSet = random(TWO_PI);
    int dir = 4;
    float r = random(10);
    if (r>.9) dir =-3;
    Ball myBall = new Ball(org, loc, radius, dir, offSet);
    ballCollection.add(myBall);
  }
}
class Ball {
 
  PVector org, loc;
  float sz = 10;
  float theta, radius, offSet;
  int s, dir, d = 60;
 
  Ball(PVector _org, PVector _loc, float _radius, int _dir, float _offSet) {
    org = _org;
    loc = _loc;
    radius = _radius;
    dir = _dir;
    offSet = _offSet;
  }
 
  void run() {
    move();
    display();
    lineBetween();
  }
 
  void move() {
    loc.x = org.x + sin(theta+offSet)*radius;
    loc.y = org.y + cos(theta+offSet)*radius;
    theta += (0.0523/2*dir);
  }
 
  void lineBetween() {
    for (int i=0; i<ballCollection.size(); i++) {
      Ball other = (Ball) ballCollection.get(i);
      float distance = loc.dist(other.loc);
      if (distance >0 && distance < d) {
        stroke(#ffffff,150);
        line(loc.x, loc.y, other.loc.x, other.loc.y);       
      }
    }
  }
 
  void display() {
    noStroke();
    for (int i=0; i<5; i++) {
      fill(250, i*30);
      ellipse(loc.x, loc.y, sz-2*i, sz-2*i);
    }
  }
}

