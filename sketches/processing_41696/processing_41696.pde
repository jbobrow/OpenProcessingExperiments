
//Libraries
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//Feilds
int starCount = 1; //Total number of Stars
int keyPresses = 0;
boolean held = true;
PVector cluster = new PVector(350, 200);
BlackHole[] holes = new BlackHole[3];

//Initalise
Star s;
ArrayList stars;
PFont sans;
Minim m;
AudioPlayer p;
Minim m2;
AudioPlayer p2;

//Setup
void setup() {
  size(700, 400);
  smooth();
  background(18);
  m = new Minim(this);
  p = m.loadFile("coin.wav");
  m2 = new Minim(this);
  p2 = m.loadFile("ambient space soft.mp3");
  stars = new ArrayList();
  addStars();
  p2.loop(10);
  sans = createFont("verdana.ttf", 10);
  textFont(sans);
  textAlign(LEFT);
  for (int i = 0; i < 3; i++) {
    holes[i] = new BlackHole(175 * (i + 1), 200);
  }
}

//Drawing
void draw() {
  //Background
  noStroke();
  fill(30, 120);
  rect(0, 0, width, height);
  //Text
  fill(255);
  
  text("Press 'R' to Refresh", 10, height - 10);
  //Updating
  for(int i = 0; i < starCount*3 + keyPresses; i++){
    Star s = (Star) stars.get(i);
    for(int j= 0; j < starCount*3 + keyPresses; j++){
      if(i != j){
        
      }
    }
  }
  //Display Black Holes
  for (int i = 0; i < 3; i++) {
    holes[i].displayForce();
    holes[i].display();
  }
  //Displays Stars
  for (int i = 0; i < starCount*3 + keyPresses; i++) {
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
  float topspeed = 5;

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
    target = cluster;
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
  
  boolean contact(Star other){
    PVector loc = other.getLocation();
    return dist(loc.x, loc.x, location.x, location.y) < (1);
  }

  int getCluster() {
    return clusterNumber;
  }

  PVector getLocation() {
    return location;
  }

  float getTopSpeed() {
    return topspeed;
  }
}

class BlackHole {

  int x;
  int y;
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
    noStroke();
    fill(0);
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
}

//Custom Methods
void addStars() {
  noStroke();
  fill(255);
  for (int i = 0; i < starCount; i++) {
    for (int j = 0; j < 3; j++) {
      stars.add(new Star(random(width), random(height), i));
    }
  }
}

boolean disCheck(int x, int y) {
  if (dist(x, y, mouseX, mouseY) < 20) return true;
  else return false;
}

//Mouse Functions
void mousePressed() {
  if (mouseButton == RIGHT) {
    if (stars.size() < 8) {
      PVector tempTarget = cluster;
      keyPresses++;
      stars.add(new Star(stars.size() - 1));
      p.loop(0);
    }
  }
  if (mouseButton == LEFT) {
    cluster = new PVector(mouseX, mouseY);
  }
}

//Key Bindings
void keyPressed() {
  if (key == 'r' || key == 'R') {
    cluster = new PVector(350, 200);
    keyPresses = 0;
    setup();
  }
}

