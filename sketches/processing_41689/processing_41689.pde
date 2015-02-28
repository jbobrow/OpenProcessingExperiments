
//Libraries
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//Feilds
int sz = 233; //Planet width
int starCount = 20; //Total number of Stars
int wS = 80;
int hS = 80;
//int wS = starCount/8; //Number of Stars across
//int hS = starCount/10; //Number of Stars height
int sCluster = -1;
int keyPresses = 0;
boolean dots = true;
PVector[] cluster = new PVector[starCount];

//Initalise
Star s;
ArrayList stars;
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
  cursor (CROSS);
}

//Drawing
void draw() {
  background(18);
  for (int i = 0; i < starCount*3 + keyPresses; i++) {
    Star s = (Star) stars.get(i);
    s.update();
    s.displayStar();
  }
  drawPlanet();
  mouseHover();
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
    target = cluster[clusterNumber];
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
  }

  Star(int _clusterNumber) {
    clusterNumber = _clusterNumber;
    target = cluster[clusterNumber];
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    topspeed = getHighestSpeed(clusterNumber) + 1;
  }

  //Sets new location for each part of the star
  void update() {
    //Calculate acceleration
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
      if (s.getCluster() == clusterNumber) {
        PVector clusterLoc = cluster[clusterNumber];
        PVector tempLocation = s.getLocation();
        strokeWeight(1);
        if (disCheck(int(clusterLoc.x), int(clusterLoc.y))) stroke(255, 0, 0);
        else if (sCluster == clusterNumber) stroke(255, 114, 0);
        else stroke(255);
        if (dots) ellipse (location.x, location.y, 1, 1);
        else line(location.x, location.y, tempLocation.x, tempLocation.y);
      }
    }
  }

  int getCluster() {
    return clusterNumber;
  }

  float getHighestSpeed(int c) {
    float high = 0;
    for (int i = 0; i < stars.size(); i++) {
      Star s = (Star) stars.get(i);
      if (s.getCluster() == c) {
        float t = s.getTopSpeed();
        if (t > high) high = t;
      }
    }
    return high;
  }

  PVector getLocation() {
    return location;
  }

  void setTopSpeed(int s) {
    topspeed = s;
  }

  float getTopSpeed() {
    return topspeed;
  }
}

//Custom Methods
void drawPlanet() {
  fill(144);
  noStroke();
  ellipse(width/2, height/2, sz + 4, sz + 4);
  stroke(0);
  strokeWeight(3);
  fill(80);
  ellipse(width/2, height/2, sz, sz);
  noStroke();
  fill(110);
  ellipse(width/2, height/2, sz - 20, sz - 20);
}

void addStars() {
  for (int i = 0; i < starCount; i++) {
    cluster[i] = new PVector(random(width), random(height));
  }
  noStroke();
  fill(255);
  for (int i = 0; i < starCount; i++) {
    for (int j = 0; j < 3; j++) {
      stars.add(new Star(random(width), random(height), i));
    }
  }
}

boolean disCheck() {
  if (dist(mouseX, mouseY, width/2, height/2) < sz/2) return true;
  else return false;
}

boolean disCheck(int x, int y) {
  if (dist(x, y, mouseX, mouseY) < 20) return true;
  else return false;
}

//Key Bindings
void keyPressed() {
  if (key == 'r' || key == 'R') {
    setup();
  }
  if (key == 'f' || key == 'F') {
    if (sCluster != -1) {
      PVector tempTarget = cluster[sCluster];
      stars.add(new Star(sCluster));
      //sCluster = -1;
      keyPresses++;
      p.loop(0);
    }
  }
  if (key == 'c' || key == 'C') {
    if (dots) dots = false;
    else dots = true;
  }
}

//Mouse Fuctions
void mouseHover() {
  for (int i = 0; i < starCount; i++) {
    PVector temp = cluster[i];
    if (disCheck(int(temp.x), int(temp.y))) {
      for (int j = 0; j < stars.size(); j++) {
        Star s = (Star) stars.get(j);
        if (i == s.getCluster()) s.displayStar();
      }
    }
  }
}

void mousePressed() {
  for (int i = 0; i < stars.size(); i++) {
    Star s = (Star) stars.get(i);
    PVector tempLocation = cluster[s.getCluster()];
    if (disCheck(int (tempLocation.x), int(tempLocation.y))) {
      sCluster = s.getCluster();
      break;
    }
    else sCluster = -1;
  }
}

