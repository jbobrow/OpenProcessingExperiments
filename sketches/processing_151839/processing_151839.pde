
int fc, num = 50, edge = 100;
ArrayList ballCollection;
boolean save = false, show = false;
color c = #00ff00, bg = #000000;

void setup() {
  size(500, 500);
  ballCollection = new ArrayList();
  createStuff();
}

void draw() {
  background(bg);
  for (int i=0; i<ballCollection.size (); i++) {
    Ball mb = (Ball) ballCollection.get(i);
    mb.run();
  }

  if (save) {
    if ((frameCount-fc)%90==0) show =! show;
    if (frameCount%3==0 && frameCount < fc + 361) saveFrame("image-####.gif");
    if (frameCount >= fc + 361) noLoop();
  }
}

void keyPressed() {
  if (key=='s') {
    //fc = frameCount;
    //save = true;
  }
  if (key=='c') {
    createStuff();
  }
  if (key=='f') saveFrame("image-###.jpg");
}

void mouseReleased() {
  show =! show;
}

void createStuff() {
  ballCollection.clear();
  for (int i=0; i<num; i++) {
    PVector org = new PVector(random(edge, width-edge), random(edge, height-edge));
    float radius = random(20, 60);
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
  float sz = 4;
  float theta, radius, offSet;
  int s, dir, d=40;

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
    theta += (0.0523/3*dir);
    if (show) {
      fill(c, 10);
      stroke(c, 40);
      ellipse(org.x, org.y, 2*radius, 2*radius);
    }
  }

  void lineBetween() {
    for (int i=0; i<ballCollection.size (); i++) {
      Ball other = (Ball) ballCollection.get(i);
      float distance = loc.dist(other.loc);
      if (distance >0 && distance < d) {
        stroke(c, 150);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
      }
    }
  }

  void display() {
    noStroke();
    /*for (int i=0; i<5; i++) {
     fill(0, i*50);
     ellipse(loc.x, loc.y, sz-2*i, sz-2*i);
     }*/
    fill(c);
    ellipse(loc.x, loc.y, sz,sz);
  }
}

