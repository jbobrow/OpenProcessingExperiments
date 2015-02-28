
predator[] predators;
prey[] preys;

void setup() {
  size(500, 500); 

  initPredators(5, 4);
  initPrey(50, 30);
}

void initPredators(int totalPredators, int numDead) {
  predators = new predator[totalPredators];

  for (int i = 0; i < predators.length; i++) {
    predators[i] = new predator(random(width), random(height));
  }
  
  //kill off the ones we don't need
  for(int i = predators.length - numDead; i < predators.length; i++) {
    predators[i].die();
  }
}

void initPrey(int totalPrey, int numDead) {
  preys = new prey[totalPrey];

  for (int i = 0; i < preys.length; i++) {
    preys[i] = new prey(random(width), random(height));
  }
  
  //kill off the ones we don't need 
  for(int i = preys.length - numDead; i < preys.length; i++) {
    preys[i].die();
  }
}

float calcSpeed(PVector velocity) {
  return dist(0, 0, velocity.x, velocity.y);
}

float calcXOffset(PVector velocity) {
  return velocity.x / calcSpeed(velocity);
}

float calcYOffset(PVector velocity) {
  return velocity.y / calcSpeed(velocity);
}

void addPredator() {
  for(int i = 0; i < predators.length; i++) {
    if(!predators[i].isAlive()) {
      predators[i].setPos(mouseX, mouseY);
      predators[i].live();
      break;
    }
  }
}

void addPrey() {
  for(int i = 0; i < preys.length; i++) {
    if(!preys[i].isAlive()) {
      preys[i].setPos(mouseX, mouseY);
      preys[i].live();
      break;
    }
  }
}

boolean isLivingPrey() {
  boolean ret = false;  //assume failure
  for (int i = 0; i < preys.length; i++) {
    if (preys[i].isAlive()) {
      //we found a live one!
      ret = true;
      break;
    }
  }

  return ret;
}

void draw() {
  background(0, 57, 87);
  updateCritters();
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    addPredator();
  }
  
  if (mouseButton == LEFT) {
    addPrey();
  }
}


void updateCritters() {
  //update predators
  fill(187, 33, 11);
  for (int i = 0; i < predators.length; i++) {
    predators[i].update();
  }
  
   //update prey
  fill(191, 144, 136);
  for (int  i = 0; i < preys.length; i++) {
    preys[i].update();
  }

  //feed
  for (int i = 0; i < predators.length; i++) {
    predators[i].feed();
  }
}

class segment {
  PVector location;
  float radius;
  
  segment(float _x, float _y, float _radius) {
    location = new PVector(_x, _y);
    radius = _radius;   
   }

  void setPos(float _x, float _y) {
    location.x = _x;
    location.y = _y;
  }

  void update(float _x, float _y) {
    setPos(_x, _y);
    doDraw();
  }

  void doDraw() {
    noStroke();
    ellipse(location.x, location.y, radius, radius);
  }
}

class tail {
  int curSegments, maxSegments;
  segment[] segments;    

  tail(float _x, float _y, float _initialOffset, float _radiusParent, int _curSegments, int _maxSegments) {
    curSegments = _curSegments;
    maxSegments = _maxSegments;
    segments = new segment[_maxSegments];

    segments[0] = new segment(_x - _initialOffset, _y - _initialOffset, _radiusParent);

    for (int i = 1; i < segments.length; i++) {
      segments[i] = new segment(_x - _radiusParent, _y - _radiusParent, _radiusParent);
    }

    updateSegementSizes(_radiusParent);
  }

  void updateSegementSizes(float _radius) {
    _radius *= .5;
    segments[0].radius = _radius;

    for (int i = 1; i < curSegments; i++) {
      _radius *= .82;
      segments[i].radius = _radius;
    }
  }

  void update(float _x, float _y, PVector velocity) {
    updateSegmentPositions(_x, _y, velocity);
    doDraw();
  }

  void grow(int _numGrow, float _radiusParent) {
    if (curSegments + _numGrow < maxSegments) {
      curSegments += _numGrow;
      updateSegementSizes(_radiusParent);
    }
  }

  void updateSegmentPositions(float _x, float _y, PVector velocity) {
    for (int i = 1; i < segments.length; i++) {
      segment prev = segments[i - 1];

      float xOffset = calcXOffset(velocity);
      float yOffset = calcYOffset(velocity);

      segments[i].setPos(prev.location.x - xOffset * prev.radius, prev.location.y - yOffset * prev.radius);
    }

    segments[0].setPos(_x, _y);
  }

  void doDraw() {
    for (int i = 0; i < curSegments; i++) {
      segments[i].doDraw();
    }
  }
}

class predator extends critter {
  predator(float _x, float _y) {
    super(_x, _y, 13, 4, 20);
  }

  void pickTarget() {
    super.pickTarget();
    
    if (isLivingPrey()) {
      float distTarget = width;
      prey targetPrey = null;
      for(int i = 0; i < preys.length; i++) {
        if(preys[i].isAlive()) {
          //start with the first living prey we find
          if(targetPrey == null) {
            targetPrey = preys[i];
            distTarget = PVector.dist(location, preys[i].target);
          } else {
            //is this prey's target closer than the last?
            float tempDist = PVector.dist(location, preys[i].target);
            
            if(tempDist < distTarget) {
              //we have a new target
              targetPrey = preys[i];
              distTarget = tempDist;
            }
          }
        }
      }
      //finally set our new target
      PVector dest = targetPrey.target;
      target.set(dest.x, dest.y);
    } 
    else {
      target.set(random(width), random(height));
    }
  }

  void feed() {
    //are we alive?
    if (isAlive()) {
      for (int i = 0; i < preys.length; i++) {
        //is this prey alive?
        if (preys[i].isAlive()) {
          //did we collide?
          if (PVector.dist(location, preys[i].location) < radius + preys[i].radius) {
            //kill the prey 
            preys[i].die();

            //grow our tail
            myTail.grow(1, radius);
          }
        }
      }
    }
  }
}

class prey extends critter {
  prey(float _x, float _y) {
    super(_x, _y, 10, 3, 3);
  }

  void pickTarget() {
    super.pickTarget();
    target.set(random(width), random(height));
  }
}

class critter extends segment {
  tail myTail;
  PVector target;
  PVector velocity;
  PVector acceleration;
  float topSpeed = 5;
  boolean alive;
  int steps;

  critter(float _x, float _y, float _radius, int _segments, int _maxSegments) {
    super(_x, _y, _radius);
    target = new PVector(random(width), random(height));
    resetSteps();
    velocity = new PVector(0, 0);
    initTail(_x, _y, _radius, _segments, _maxSegments);
    live();
  }

  void resetSteps() {
    steps = (int)random(20) + 5;
  }

  void pickTarget() {
    resetSteps();
  }

  boolean isAlive() {
    return alive;
  }
  void live() {
    alive = true;
  }

  void die() {
    alive = false;
  }

  void initTail( float _x, float _y, float _radius, int _segments, int _maxSegments) {
    myTail = new tail(_x, _y, radius / 2, _radius, _segments, _maxSegments);
  }

  void update() {
    if (isAlive()) {
      move();
      doDraw();     
    }
  }

  void updateTarget() {
    steps--;
    
    if (steps == 0) {
      pickTarget();
    }
  }

  void move() {
    updateTarget();

    PVector dir = PVector.sub(target, location);
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;

    //Set location based on acceleration
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }

  void doDraw() {
    noStroke();
    ellipse(location.x, location.y, radius, radius);

    float xOffset = calcXOffset(velocity);
    float yOffset = calcYOffset(velocity);

    myTail.update(location.x - xOffset * radius, location.y - yOffset * radius, velocity);
  }
}
