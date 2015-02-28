
static final int MINALIVE = 1;

int bugCount;
Bug[] bugs;
int lifesigns;

void setup() {
  size(400, 400);
  frameRate(10000);
  smooth();
  
  genesis();
}

void draw() {

  background(127, 127, 142);

  lifesigns = 0;
  for(int i=0; i<bugCount; i++) {
    Bug thisBug = bugs[i];
    if (!thisBug.dead) {
      lifesigns++;
      thisBug.move();
    }
    thisBug.show();
  }
  
  vita();
  
  if (bugCount > 256) {
//    saveFrame();
    noLoop();
//    genesis();
  }
}

// grow more bugs as necessary
void vita() {
  while (lifesigns < MINALIVE) {
    bugCount++;
    bugs = (Bug[]) expand(bugs, bugCount);
    bugs[bugCount-1] = new BugTurning(bugCount);
    lifesigns++;
  }
}

void genesis() {
  bugCount = 1;
  bugs = new Bug[1];
  
  Bug seed = new Bug(0);
  seed.dead = true;
  seed.position = new PVector(width/2, height/2);
  bugs[0] = seed;

  lifesigns = 0;
  
  vita();
}

class Bug {
  // uses: bugCount, bugs[]
  int bigness;
  float gray;
  boolean dead;
  PVector position;

  // constructor
  Bug(int newGray) {
    dead = false;
    gray = newGray;
    bigness = 6;
    
    float x = random(width);
    float y = random(height);
    position = new PVector(x, y);
  }

  void move() {
    // for children to implement
    // should call wrap(), and bumpDetect() 
  }
  
    
  // show it on canvas
  void show() {    
    stroke(0);
    fill(gray);
    ellipse(position.x, position.y, bigness, bigness);
  }
  
  // wrap within bounds
  void wrap() {
    if (position.x > width) { position.x -= width; };
    if (position.x < 0) { position.x += width; };
    if (position.y > width) { position.y -= width; };
    if (position.y < 0) { position.y += width; };
  }

  void bumpDetect(){
    for(int j=0; (j<bugCount) && !dead; j++){
      Bug theBug = bugs[j];
      if (this != theBug) {
        if (sqrt(sq(position.x-theBug.position.x)+sq(position.y-theBug.position.y)) < (theBug.bigness/2 + bigness/2)) {
          dead = true;
        }
      }
    }
  }
  
}
class BugTurning extends Bug {
  PVector velocity;

  // constructor
  BugTurning(int newId) {
    super(newId);
    velocity = new PVector(0, 0);
  }

  void move() {
    turn();
    position.add(velocity);
     
    wrap();
    bumpDetect();
  }

  //rotate randomly left or right
  void turn() {
    PVector acceleration = new PVector(random(-1,1),random(-1,1));
    
    velocity.add(acceleration);
    velocity.normalize();
  }

}
