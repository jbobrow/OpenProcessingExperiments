
//globals
PImage secFish, minFish, hourFish;
boolean arrived = false;
int x, y;
ArrayList secFishes;
ArrayList minFishes;
ArrayList hourFishes;
int startsec = second()+1;
int startmin = minute()+1;
int starthour = hour()+1;
boolean initCalled = false;

void setup() {
  size(1000, 600);
  secFish = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/secfish.png");
  minFish = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/minfish.png");
  hourFish = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/hourfish.png");
  secFishes = new ArrayList();
  minFishes = new ArrayList();
  hourFishes = new ArrayList();
}

void draw() {
  background(196, 242, 237);
  
  //only initialize once
  if (initCalled == false) initFish();

  //add in the second fish
  if (second() == startsec) {
    secFishes.add(new Fish(new PVector(width/2, height/2), 1.5, 0.03, secFish));
    startsec++;
    if (startsec == 60) {
      startsec = 0;
      fishFadeOut(secFishes);
    }
  }
  //run the second fish
  for (int i = secFishes.size()-1; i >= 0; i--) {
    Fish f = (Fish) secFishes.get(i);
    if ((f.dead == true) && (f.fade == 0)) secFishes.remove(i);
    if (((x==0)&&(y==0)) || (arrived == true)) f.wander();
    else f.arrive(new PVector (x, y));
    f.run();
  }

  //add the minute fish
  if (minute() == startmin) {
    minFishes.add(new Fish(new PVector(width/2, height/2), 1.0, 0.02, minFish));
    startmin++;
    if (startmin == 60) {
      startmin = 1;
      fishFadeOut(minFishes);
    }
  }
  //run the minute fish
  for (int i = minFishes.size()-1; i >= 0; i--) {
    Fish f = (Fish) minFishes.get(i);
    if ((f.dead == true) && (f.fade == 0)) minFishes.remove(i);
    if (((x==0)&&(y==0)) || (arrived == true)) f.wander();
    else f.arrive(new PVector (x, y));
    f.run();
  }

  //add the hour fish
  if (hour() == starthour) {
    hourFishes.add(new Fish(new PVector(width/2, height/2), 0.5, 0.01, hourFish));
    starthour++;
    if (starthour == 24) {
      starthour = 0;
      fishFadeOut(hourFishes);
    }
  }
  //run the hour fish
  for (int i = hourFishes.size()-1; i >= 0; i--) {
    Fish f = (Fish) hourFishes.get(i);
    if ((f.dead == true) && (f.fade == 0)) hourFishes.remove(i);
    if (((x==0)&&(y==0)) || (arrived == true)) f.wander();
    else f.arrive(new PVector (x, y));
    f.run();
  }
}

//adds in all fish of time at start of program
void initFish() {
  initCalled = true;
  for (int s = second(); s > 0; s--) {
    secFishes.add(new Fish(new PVector(width/2, height/2), 1.5, 0.03, secFish));
  }
  for (int m = minute(); m > 0; m--) {
    minFishes.add(new Fish(new PVector(width/2, height/2), 1.0, 0.02, minFish));
  }
  for (int h = hour(); h > 0; h--) {
    hourFishes.add(new Fish(new PVector(width/2, height/2), 0.5, 0.01, hourFish));
  }
}

//kills dead fish on rollover
void fishFadeOut(ArrayList fishes) {
  for (int i = fishes.size()-1; i >= 0; i--) {
    Fish f = (Fish) fishes.get(i);
    f.dead = true;
  }
}

//fish move to mouse
void mousePressed() {
  arrived = false;
  x = mouseX;
  y = mouseY;
}

/////////////////////////////////////////////////////////////////////////////

//Fish class, based off of the Boid class from daniel shiffman (shiffman.net)
class Fish {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float wandertheta; //angle of steering
  float maxForce; //maximum steering force
  float maxSpeed; //maximum speed
  int fade;
  boolean dead;
  PImage fish;
  boolean born;

  Fish(PVector l, float ms, float mf, PImage time) {
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    loc = l.get();
    r = 30.0;
    wandertheta = 0.0;
    maxSpeed = ms;
    maxForce = mf;
    fade = 0;
    born = true;
    dead = false;
    fish = time;
  }

  void run() {
    update();
    borders();
    render();
  }

  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    loc.add(vel);
    acc.mult(0);
  }

  void seek(PVector target) {
    acc.add(steer(target, false));
  }

  void arrive(PVector target) {
    acc.add(steer(target, true));
  }

  void wander() {
    float wanderR = 1.0f; //radius for wander circle
    float wanderD = 100.0f; //distance for wander circle
    float change = 0.25f;
    wandertheta += random(-change, change); //alter direction randomly

    //calc new target to steer towards
    PVector circleloc = vel.get();
    circleloc.normalize();
    circleloc.mult(wanderD);
    circleloc.add(loc);

    PVector circleOffset = new PVector(wanderR*cos(wandertheta), wanderR*sin(wandertheta));
    PVector target = PVector.add(circleloc, circleOffset);
    acc.add(steer(target, false)); //steer towards target
  }

  PVector steer(PVector target, boolean slowdown) {
    PVector steer;
    PVector desired = PVector.sub(target, loc); //vector pointing to target from loc
    float d = desired.mag(); //distance from target is magnitude of vector
    //if distance is greater than 0, calc steering, else return zero vector
    if (d > 0) {
      if ((arrived == false) && (x>0) && (y>0) && (d < 20)) arrived = true;
      desired.normalize();
      if ((slowdown)&&(d < 100.0f)) desired.mult(maxSpeed*(d/100.0f)); //damping
      else desired.mult(maxSpeed);

      steer = PVector.sub(desired, vel);
      steer.limit(maxForce); //don't surpass maxForce for smoothness of steering
    }
    else steer = new PVector(0, 0);
    return steer;
  }

  void render() {
    //orient fish image
    float theta = vel.heading2D() + radians(90);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    //normal fish
    if ((dead == false)&&(born == false)) {
      tint(255, 255, 255, 255);
      image(fish, 0, 0);
    }
    //new fish fade-in
    if (born == true) {
      tint(255, 255, 255, fade);
      image(fish, 0, 0);
      fade += 5;
      if (fade == 255) born = false;
    }
    //dead fish fade-out
    else if (dead == true) {
      tint(255, 255, 255, fade);
      image(fish, 0, 0);
      fade -= 5;
    } 
    popMatrix();
  }

  //wraparound
  void borders() {
    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;
  }
}
