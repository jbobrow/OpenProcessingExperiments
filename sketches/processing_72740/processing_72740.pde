
PImage p1, p2, p3, p4, p5, p6, p7, p8, p9;
PImage test;
int weight = 1;

BoltSystem bs;

void setup() {
  size(750, 500);
  imageMode(CENTER);
  strokeCap(PROJECT);
  int startX = (int) random(-width, 2*width);
  bs = new BoltSystem(0, new PVector(startX, whereToStart(startX)));

  p1 = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/p1.png");
  p2 = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/p2.png");
  p3 = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/p3.png");
  p4 = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/p4.png");
  p5 = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/p5.png");
  p6 = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/p6.png");
  p7 = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/p7.png");
  p8 = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/p8.png");
  p9 = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/p9.png");

  smooth();
}

void draw() {
  fill(0);
  rect(0, 0, width, height);
  //particle system for bolt
  bs.run();

  int startX = (int) random(-width, 2*width);
  float rSpeed = random(0.0, 3.0+(mouseX/20));
  PVector origin = new PVector(startX, whereToStart(startX), 0);
  PVector initSpeed = new PVector(0, rSpeed, 0);
  Bolt b = new Bolt(origin, initSpeed);
  
  weight = (int) map(mouseX, 0, width, 1, 10);

  int entropy = (int) random(0, mouseX+75);
  if (mouseX > width/2) {
    if (mouseX > width/4) {
        bs.addBolt(b);
        bs.addBolt(b);
    }
    if (entropy < mouseX+50) bs.addBolt(b);
  } 
  if (mouseX < width/2) {
    if (mouseX < width/4) {
      if (entropy < mouseX-100) bs.addBolt(b);
    }
    if (entropy < mouseX-50) bs.addBolt(b);
  }
  //ugly way to animate pikachu head because openprocessing hates me
  int frame = (int) map(mouseX, 0, width, 1, 9);
  if(frame == 1) image(p1, width/2, height/2);
  if(frame == 2) image(p2, width/2, height/2);
  if(frame == 3) image(p3, width/2, height/2);
  if(frame == 4) image(p4, width/2, height/2);
  if(frame == 5) image(p5, width/2, height/2);
  if(frame == 6) image(p6, width/2, height/2);
  if(frame == 7) image(p7, width/2, height/2);
  if(frame == 8) image(p8, width/2, height/2);
  if(frame == 9) image(p9, width/2, height/2);
}

/////////////////////////////////////////////////////////////////////////////
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
    float rSpeed = random(0.0, 3.0);
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
  float timer;

  Bolt(PVector l, PVector a) {
    acc = a.get();
    loc = l.get();
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
    strokeWeight(weight);
    stroke(255,255,0, timer);
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

/////////////////////////////////////////////////////////////////////////////
