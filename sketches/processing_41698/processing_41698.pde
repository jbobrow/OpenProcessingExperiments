
//Libraries
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//Feilds
int starCount = 2; //Total number of Stars
int holeCount = 3;
int keyPresses = 0;
boolean held = false;
PVector cluster = new PVector(350, 200);
BlackHole[] holes = new BlackHole[holeCount];
int[] counts = new int[starCount];

//Initalise
Star s;
ArrayList stars;
PFont sans;
Minim m;
AudioPlayer p;
AudioPlayer p2;
AudioPlayer p3;
AudioPlayer p4;
AudioPlayer p5;

//Setup
void setup() {
  size(700, 400);
  smooth();
  background(18);
  addSFX();
  stars = new ArrayList();
  addStars();
  p.loop(10);
  sans = createFont("verdana.ttf", 10);
  textFont(sans);
  textAlign(CENTER);
  for (int i = 0; i < holeCount; i++) {
    //holes[i] = new BlackHole(175 * (i + 1), 200);
    holes[i] = new BlackHole(width/(holeCount+1) * (i+1), 200);
  }
}

//Drawing
void draw() {
  //Background
  noStroke();
  fill(30, 100);
  rect(0, 0, width, height);
  //Text
  fill(255);
  if (frameCount > 1200 && frameCount < 1800) text("Try Clicking on a Black Hole", width/2, 15);
  if (frameCount == 1200) p5.loop(0);
  //Updating
  for (int i = 0; i < starCount + keyPresses; i++) {
    Star s = (Star) stars.get(i);
    for (int j= 0; j < starCount + keyPresses; j++) {
      if (i != j) {
      }
    }
  }
  //Display Black Holes
  for (int i = 0; i < holeCount; i++) {
    if (mouseCheck(holes[i].getX(), holes[i].getY()) < 50) {
      int disX = mouseX - holes[i].getX();
      int disY = mouseY - holes[i].getY();
      if (disX < 250 && disX > -250) {
        holes[i].setDirX(((disX)/10)*-1); //GET THIS WORKING
      }
      if (disY < 250 && disY > -250) {
        holes[i].setDirY(((disY)/10)*-1);
      }
    }
    holes[i].boundaryCheck();
    holes[i].displayForce();
    holes[i].display();
  }
  //Displays Stars
  for (int i = 0; i < starCount + keyPresses; i++) {
    Star s = (Star) stars.get(i);
    s.update();
    s.displayStar();
  }
}

//Custom Class
class Star {
  //Feilds
  int clusterNumber;
  PVector target;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed = 10;

  //Constructor
  Star(float x, float y, int _clusterNumber) {
    clusterNumber = _clusterNumber;
    target = cluster;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
  }

  Star(int _clusterNumber) {
    clusterNumber = _clusterNumber;
    target = cluster;
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    topspeed = topspeed + keyPresses;
  }

  //Sets new location for each part of the star
  void update() {
    //Calculate acceleration
    if (held) targetClick();
    else target = targetCheck();
    //target = cluster;
    PVector dir = PVector.sub(target, location);
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;
    //Set location based on acceleration
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  //Displays star
  void displayStar() {
    for (int i = 0; i < stars.size(); i++) {
      Star s = (Star) stars.get(i);
      PVector tempLocation = s.getLocation();
      fill(255);
      ellipse (tempLocation.x, tempLocation.y, 1, 1);
    }
  }

  boolean contact(Star other) {
    PVector loc = other.getLocation();
    return dist(loc.x, loc.x, location.x, location.y) < (1);
  }

  int getCluster() {
    return clusterNumber;
  }

  PVector getLocation() {
    return location;
  }

  void setTarget(PVector t) {
    target = t;
  }

  float getTopSpeed() {
    return topspeed;
  }

  void targetClick() {
    PVector t = null;
    for (int i = 0; i < holeCount; i++) {
      if (mouseCheck(holes[i].getX(), holes[i].getY()) < holes[i].getSize()) {
        t = new PVector(holes[i].getX(), holes[i].getY());
        for (int j = 0; j < stars.size(); j++) {
          Star s = (Star) stars.get(j);
          s.setTarget(t);
        }
      }
    }
  }

  PVector targetCheck() {
    int low = -1;
    float distance = 0;
    for (int i = 0; i < holeCount; i++) {
      BlackHole b = holes[i];
      float temp = dist(location.x, location.y, b.getX(), getY());
      if (low == -1) {
        low = i;
        distance = temp;
      }
      else if (temp < distance) {
        low = i;
        distance = temp;
      }
    }
    BlackHole b = holes[low];
    return new PVector(b.getX(), b.getY());
  }
}

class BlackHole {

  float x;
  float y;
  float dirX = 0;
  float dirY = 0;
  float velo = 0.99;
  int sz = 10;
  int mn = 8;
  int mx = 15;
  int pulse = 1;
  int count = 0;
  int _sz = 8;
  int _count = 0;

  BlackHole(int _x, int _y) {
    x = _x;
    y = _y;
    displayForce();
    display();
  }

  //Draw Hole
  void display() {
    if (count >= 10) {
      if (sz <= mn) {
        pulse = 1;
        sz = mn + 1;
      }
      if (sz >= mx) {
        pulse = -1;
        sz = mx - 1;
      }
      sz += pulse;
      count = 0;
    }
    else {
      count++;
    }
    if (passedOver() != -1) {
      sz += 1;
      noStroke();
      fill(255, 0, 0);
    }
    else {
      for (int i = 0; i < starCount; i++) {
        if (counts[i] != 0) {
          counts[i]++;
          if (counts[i] == 100) counts[i] = 0;
        }
      }
      noStroke();
      fill(0);
    }
    dirX *= velo;
    dirY *= velo;
    x += dirX;
    y += dirY;
    ellipse(x, y, sz, sz);
  }

  //Draw Force
  void displayForce() {
    if (_count >= 2) { 
      _sz--; 
      _count = 0;
    }
    if (_sz <= 0) _sz = mx * 8;
    stroke(80);
    strokeWeight(1);
    noFill();
    ellipse(x, y, _sz, _sz);
    _count++;
  }

  int getX() {
    return int(x);
  }

  int getY() {
    return int(y);
  }

  void setDirX(int _dirX) {
    dirX += _dirX;
  }

  void setDirY(int _dirY) {
    dirY += _dirY;
  }

  int getSize() {
    return _sz;
  }

  int passedOver() {
    for (int i = 0; i < stars.size(); i++) {
      Star s = (Star) stars.get(i);
      PVector loc = s.getLocation();
      if (dist(x, y, loc.x, loc.y) < ((_sz/2) - 2)) return i;
    }
    return -1;
  }

  void boundaryCheck() {
    if (x + sz > width || x - sz < 0) dirX *= -1;
    if (y + sz > height || y - sz < 0) dirY *= -1;
  }
}

//Custom Methods

void addSFX() {
  m = new Minim(this);
  p = m.loadFile("ambient space soft.mp3");
  p2 = m.loadFile("click_x.wav");
  p3 = m.loadFile("click_x.wav");
  p4 = m.loadFile("click_x.wav");
  p5 = m.loadFile("coin.wav");
}

void addStars() {
  noStroke();
  fill(255);
  for (int i = 0; i < starCount; i++) {
    stars.add(new Star(random(width), random(height), i));
    counts[i] = 0;
  }
}

boolean disCheck(int x, int y) {
  if (dist(x, y, mouseX, mouseY) < 20) return true;
  else return false;
}

float mouseCheck(int x, int y) {
  return dist(x, y, mouseX, mouseY);
}

//Mouse Functions
void mousePressed() {
  if (mouseButton == RIGHT) {
    if (stars.size() < 10) {
      PVector tempTarget = cluster;
      keyPresses++;
      stars.add(new Star(stars.size() - 1));
      p.loop(0);
    }
  }
  if (mouseButton == LEFT) {
    held = true;
  }
}

void mouseReleased() {
  held = false;
}

//Key Bindings
void keyPressed() {
  if (key == 'r' || key == 'R') {
    cluster = new PVector(350, 200);
    keyPresses = 0;
    setup();
  }
}

