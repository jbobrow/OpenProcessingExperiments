
//globals
int rotSpeed = 0;
int bNoise = 0;

BoltSystem bs;

void setup() {
  size(500, 500);

  int startX = (int) random(-width, 2*width);

  bs = new BoltSystem(100, new PVector(startX, whereToStart(startX)));
  smooth();
}

int whereToStart(int startX) {
  int startY;
  int pick = (int) random (0, 1);

  if ((startX > width) || (startX < 0)) {
    startY = (int) random(-height, 2*height);
  }
  else {
    if (pick == 0) {
      startY = (int) random(0, -height);
    }
    else startY = (int) random(height, 2*height);
  }

  return startY;
}

void draw() {
  background(255);
  bs.run();
  bs.addBolt();
}

class BoltSystem {

  ArrayList bolts;
  PVector origin;
  PVector initSpeed;

  BoltSystem(int num, PVector l) {
    bolts = new ArrayList();

    for (int i = 0; i < num; i++) {
      int startX = (int) random(-width, 2*width);
      float rSpeed = random(0.0, 2.0);
      origin = new PVector(startX, whereToStart(startX), 0);
      initSpeed = new PVector(0, rSpeed, 0);
      bolts.add(new Bolt(origin, initSpeed));
    }
  }

  void run() {
    for (int i = bolts.size()-1; i >= 0; i--) {
      Bolt b = (Bolt) bolts.get(i);
      b.run();
      if (b.isDead()) {
        bolts.remove(i);
      }
    }
  }

  void addBolt() {
    int startX = (int) random(-width, 2*width);
    float rSpeed = random(0.0, 2.0);
    origin = new PVector(startX, whereToStart(startX), 0);
    initSpeed = new PVector(0, rSpeed, 0);
    bolts.add(new Bolt(origin, initSpeed));
  }

  void addBolt(Bolt b) {
    bolts.add(b);
  }

  boolean dead() {
    if (bolts.isEmpty()) {
      return true;
    }
    else return false;
  }
}

class Bolt {
  PVector loc;
  PVector acc;
  //float boltNoise;
  float timer;

  Bolt(PVector l, PVector a) {
    acc = a.get();
    loc = l.get();
    //boltNoise  = bNoise;
    timer = 100.0;
  }

  void run() {
    update();
    render();
  }

  void update() {
    loc.add(acc);
    timer -= 2.0;
  }

  void render() {
    stroke(0, timer);
    line(width/2, height/2, loc.x, loc.y);
  }

  boolean isDead() {
    if (timer <= 0.0)
      return true;
    else
      return false;
  }
}

void mousePressed() {
  bs.addBolt();
}

