
int fc, num=100, edge = 100;
ArrayList ballCollection; 
boolean save = false;
float scal, theta;

void setup() {
  size(400, 400);
  background(20);
  ballCollection = new ArrayList();
  createStuff();
}

void draw() {
  background(20);
  for (int i=0; i<ballCollection.size(); i++) {
    Ball mb = (Ball) ballCollection.get(i);
    mb.run();
  }  
  
  theta += (0.0523/2);

  if (save) {
    if (frameCount%6==0 && frameCount < fc + 241) saveFrame("image-####.gif");
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
    float radius = random(20, 80);
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
  float sz = 2;
  float radius, offSet, a, c;
  float[] col = new float[num];
  int s, dir, countC, d = 40;
  boolean[] connection = new boolean[num];

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
    loc.x = org.x + sin(theta*dir+offSet)*radius;
    loc.y = org.y + cos(theta*dir+offSet)*radius;
  }

  void lineBetween() {
    countC = 1;
    for (int i=0; i<ballCollection.size(); i++) {
      Ball other = (Ball) ballCollection.get(i);
      float distance = loc.dist(other.loc);
      if (distance >0 && distance < d) {
        connection[i] = true;
      }       
      else {
        connection[i] = false;
      }
      if (connection[i]) countC++;
      //println(countC);
      if (distance >0 && distance < d) {
        a = map(countC, 1, 20, 10, 150);
        stroke(#ffffff, a);
        //strokeWeight(c);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
        colorMode(RGB);
      }
    }

    //println(countC);
  }
  void display() {
    noStroke();
    fill(255, a);
    ellipse(loc.x, loc.y, sz, sz);
  }
}


