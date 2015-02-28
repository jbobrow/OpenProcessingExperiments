
int fc, num = 100, edge = 0;
ArrayList ballCollection; 
boolean save = false;

void setup() {
  size(1920, 1080);
  background(0);
  ballCollection = new ArrayList();
  createStuff();
}

void draw() {
  background(0);
  for (int i=0; i<ballCollection.size(); i++) {
    Ball mb = (Ball) ballCollection.get(i);
    mb.run();
  }

  if (save) {
    if (frameCount%2==0 && frameCount < fc + 241) saveFrame("image-####.gif");
  }
}

void keyPressed() {
  fc = frameCount;
  save = true;
}

void mouseReleased() {
  createStuff();
}

void createStuff() {
  ballCollection.clear();
  for (int i=0; i<num; i++) {
    PVector org = new PVector(random(edge, width-edge), random(edge, height-edge));
    float radius = random(60, 100);
    PVector loc = new PVector(org.x+radius, org.y);
    float offSet = random(TWO_PI);
    int dir = 1;
    float r = random(1);
    if (r>.5) dir =-1;
    Ball myBall = new Ball(org, loc, radius, dir, offSet);
    ballCollection.add(myBall);
  }
}

class Ball {

  PVector org, loc;
  float sz = 7;
  float theta, radius, offSet, distance;
  int s, dir, d = 40;

  Ball(PVector _org, PVector _loc, float _radius, int _dir, float _offSet) {
    org = _org;
    loc = _loc;
    radius = _radius;
    dir = _dir;
    offSet = _offSet;
  }

  void run() {
    display();
    move();
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
      distance = loc.dist(other.loc);
      if (distance >0 && distance < d) {
        fill(#6FFF00,50);
        stroke(255, 200);
        noStroke();
        ellipse(loc.x, loc.y, d+20-distance, d+20-distance);
      }
    }
  }

  void display() {
    noStroke();
    fill(#6FFF00, 255);
    ellipse(loc.x, loc.y, sz, sz);
  }
}


