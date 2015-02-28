
// counter for time
int framesPassed = 0;
int bestTime= 1000;
// interface for time
PFont font;

int masterRadius = 200;
boolean restarted;

// number of rotators
int rotatorCount=30;

// integer used for counting and reseting hits
int amountCollided=0;

Rotator [] allRotators = new Rotator [rotatorCount];
Gun gun;

void setup() {
  size(450, 450);
  background(0);
  smooth();
  stroke(255);
  frameRate(50);

  font = loadFont("LevenimMT-48.vlw");

  //create rotators
  for (int i=0; i<rotatorCount; i++) {
    allRotators[i] = new Rotator(i*(int(360/rotatorCount)));
  }

  //create weapon
  gun = new Gun(width/2, height/2);
}

void draw() {
  background(0);

  // run and update the rotators
  strokeWeight(1);
  for (int i=0; i<rotatorCount; i++) {
    allRotators[i].update();
  }

  gun.render();

  // check if all the dots are currently black
  allRotatorsBlack();

  // display and advance the time
  time();
}

void time() {
  fill(255); 

  // if not at default time of 1000, show time for best run
  if (bestTime<1000) text(bestTime, 30, 30);
  // display time for current run
  text(framesPassed, width/2, height/2-100);
  // advance time
  framesPassed+=1;
}

void resetTime() {

  // if your score is lower than lowest recorded, record best time
  if (framesPassed!=1 &&framesPassed<bestTime && !restarted) bestTime=framesPassed;
  // tell you game you reset so that it will not check for best time
  restarted = true;

  // reset time
  framesPassed=0;
}

void allRotatorsBlack() {
  // count how many have collided
  for (int i=0;i<rotatorCount;i++) {
    if (allRotators[i].collision) amountCollided+=1;
  }

  // if they have all rotators are black, reset them
  if (amountCollided==rotatorCount) {

    // the game was not just reset, so it can check for a best time
    restarted = false;

    for (int i=0;i<rotatorCount;i++) {
      // reset all rotators
      allRotators[i].reset();
      // and the time
      resetTime();
    }
  }
  // otherwise, reset the collide count for the next frame
  else amountCollided=0;
}

class Gun {
  public PVector loc = new PVector();
  private float r = masterRadius;

  // these represent the coordinates at the tip of your "gun"
  float cX;
  float cY;

  public Gun(float x, float y)
  {
    // the axes which your weapon rotates around
    loc.x = x;
    loc.y = y;
  }

  void render() {
    float angle = atan2(mouseY-loc.y, mouseX-loc.x);

    cX = (r * cos(angle)) + loc.x;
    cY = (r * sin(angle)) + loc.y; 


    strokeWeight(1);
    stroke(255);
point(width/2,height/2);

    line(loc.x, loc.y, cX, cY);
//    strokeWeight(1);
  }
}
class Rotator {
  float x, y, rad, offset;
  boolean xCollide, yCollide, collision;
  int r=20;
  int distance= masterRadius;
  int deg;
  int whiteVal=255;
  int speed=1;

  Rotator(int deg_) {
    // the point (degree) along the circle where the dot exists
    deg=deg_;
  } 

  void update() {
    display();
    checkCollision();
  }

  void display() {
    // color the dot (black if you've hit it)
    fill(whiteVal);

    //convert rads to degrees
    deg=deg+speed;
    rad=(PI/180)*deg;
    x=sin(rad)*distance+(width/2);
    y=cos(rad)*distance+(height/2);

    ellipse(x, y, r, r);
  }

  void checkCollision() {

    if (int(x) >= int(gun.cX)-r && int(x) <= int(gun.cX)+r) xCollide=true;
    else xCollide = false;
    if (int(y) >= int(gun.cY)-r && int(y) <= int(gun.cY)+r) yCollide=true;
    else yCollide = false;

    // if the weapon is in contact with a dot
    if (xCollide && yCollide) {
      collision = true;
      // make the dot black
      whiteVal=0;
    }
  }


  void reset() {
    // turn the dot back on completely
    collision = false;
    xCollide = false;
    yCollide = false;
    whiteVal=255;
  }
}                               
