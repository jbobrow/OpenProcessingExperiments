
predator[] predators;
prey[] preys;
grid myGrid;
PVector posLastAte; //seed for where predators will swarm when prey runs out

void setup() {
  size(800, 450);
  posLastAte = null;
  myGrid = new grid(8, 6);

  initPredators(5, 4);
  initPrey(25, 10);
}

void initPredators(int totalPredators, int numDead) {
  predators = new predator[totalPredators];

  //allocate
  for (int i = 0; i < predators.length; i++) {
    predators[i] = new predator(random(width), random(height));
  }

  //kill off the ones we don't need
  for (int i = predators.length - numDead; i < predators.length; i++) {
    predators[i].die();
  }
}

void initPrey(int totalPrey, int numDead) {
  preys = new prey[totalPrey];

  //allocate
  for (int i = 0; i < preys.length; i++) {
    preys[i] = new prey(random(width), random(height));
  }

  //kill off the ones we don't need
  for (int i = preys.length - numDead; i < preys.length; i++) {
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
  for (int i = 0; i < predators.length; i++) {
    if (!predators[i].isAlive()) {
      predators[i].setPos(mouseX, mouseY);
      predators[i].live();
      break;
    }
  }
}

void addPrey() {
  for (int i = 0; i < preys.length; i++) {
    if (!preys[i].isAlive()) {
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

  myGrid.reset();
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

//helper class for passing position/value pair
class cell {
  int x, y, val;
  
  cell(int _x, int _y, int _val) {
    x = _x;
    y = _y;
    val = _val;
  }
}

class grid {
  int cols, rows, cellWidth, cellHeight;
  int[][] cells;

  grid(int _cols, int _rows) {
    cols = _cols;
    rows = _rows;

    //pre-calc cell dimensions
    cellWidth = width / _cols;
    cellHeight = height / _rows;

    cells = new int[cols][rows];
  }

  void reset() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        cells[i][j] = 0;
      }
    }
  }

  int keepInBoundsX(int _x) {
    int ret = _x;

    //since we can move offscreen.. let's keep the target cell on grid
    if (ret < 0) {
      ret = 0;
    } 
    else if (ret >= cols) {
      ret = cols - 1;
    }

    return ret;
  }
  int convertFromScreenX(float _x) {
    int ret =  (int) (_x / cellWidth);

    return keepInBoundsX(ret);
  }

  int keepInBoundsY(int _y) {
    int ret = _y;

    if (ret < 0) {
      ret = 0;
    } 
    else if (ret >= rows) {
      ret = rows - 1;
    }

    return ret;
  }

  int convertFromScreenY(float _y) {
    int ret = (int) (_y / cellHeight);

    return keepInBoundsY(ret);
  }

  void doCellUpdate(int _x, int _y, int _val) {
    cells[keepInBoundsX(_x)][keepInBoundsY(_y)] += _val;
  }

  void updateTargetCell(PVector _target, int _val) {    
    int cellX = convertFromScreenX(_target.x);
    int cellY = convertFromScreenY(_target.y);

    doCellUpdate(cellX, cellY, _val);

    //halve our value (for surrounding cells)
    _val /= 2;

    //update surrounding cells with a lesser value
    doCellUpdate(cellX - 1, cellY - 1, _val);
    doCellUpdate(cellX, cellY - 1, _val);
    doCellUpdate(cellX + 1, cellY - 1, _val);
    doCellUpdate(cellX - 1, cellY, _val);
    doCellUpdate(cellX + 1, cellY, _val);
    doCellUpdate(cellX - 1, cellY + 1, _val);
    doCellUpdate(cellX, cellY + 1, _val);
    doCellUpdate(cellX + 1, cellY + 1, _val);
  }

  PVector getRandomPosInCell(float _x, float _y) {
    float retX = random(cellWidth) + (_x * cellWidth);
    float retY = random(cellHeight) + (_y * cellHeight);

    return new PVector(retX, retY);
  }

  void updateCell(cell _cell, int _x, int _y, int _val) {
    _cell.x = _x;
    _cell.y = _y;
    _cell.val = _val;
  }

  void updateBest(cell _currentBest, int _x, int _y) {
    _x = keepInBoundsX(_x);
    _y = keepInBoundsY(_y);
    int val = cells[_x][_y];

    if (val < _currentBest.val) {
      //this is a better cell
      updateCell(_currentBest, _x, _y, val);
    } 
    else if (val == _currentBest.val) {
      //equal value... let's add some randomness
      if (random(10) < 5) {
        updateCell(_currentBest, _x, _y, val);
      }
    } 
    else {
      //this is a worse dest, do nothing
    }
  }

  PVector getSafestCell(PVector _pos) {
    int cellX = convertFromScreenX(_pos.x);
    int cellY = convertFromScreenY(_pos.y);

    cell best = new cell(convertFromScreenX(_pos.x), convertFromScreenY(_pos.y), cells[cellX] [cellY]);

    //check all adjacent cells for the lowest value (least predator interest)
    updateBest(best, cellX - 1, cellY - 1);
    updateBest(best, cellX, cellY - 1);
    updateBest(best, cellX + 1, cellY - 1);
    updateBest(best, cellX - 1, cellY);
    updateBest(best, cellX + 1, cellY);
    updateBest(best, cellX - 1, cellY + 1);
    updateBest(best, cellX, cellY + 1);
    updateBest(best, cellX + 1, cellY + 1);

    return new PVector(best.x, best.y);
  }

  PVector getNewPreyDest(PVector _pos) {
    PVector best = getSafestCell(_pos);

    return getRandomPosInCell(best.x, best.y);
  }
}

class segment {
  PVector location;
  float radius;

  segment(float _x, float _y, float _radius) {
    location = new PVector(_x, _y);
    radius = _radius;
  }

  segment(segment _other) {
    this(_other.location.x, _other.location.y, _other.radius);
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
    for (int i = 0; i < curSegments; i++) {
      float temp = 0.5 - ((0.5 - 0.1) / (float)curSegments) * i;
      segments[i].radius = _radius * temp;
    }
  }

  void update(float _x, float _y, PVector _velocity) {
    updateSegmentPositions(_x, _y, _velocity);
    doDraw();
  }

  void grow(int _numGrow, float _radiusParent) {
    if (curSegments + _numGrow < maxSegments) {
      curSegments += _numGrow;
      updateSegementSizes(_radiusParent);
    }
  }

  void updateSegmentPositions(float _x, float _y, PVector _velocity) {
    segment prev = new segment(_x, _y, segments[0].radius);

    for (int i = 0; i < segments.length; i++) {
      segment cache = new segment(segments[i]);

      float xOffset = calcXOffset(_velocity);
      float yOffset = calcYOffset(_velocity);
      float radiusUsed = prev.radius / 2;

      segments[i].setPos(prev.location.x - xOffset * radiusUsed, prev.location.y - yOffset * radiusUsed);
      prev = new segment(cache);
    }
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

  void move() {
    super.move();
    myGrid.updateTargetCell(location, 2);
  }

  void pickTarget() {
    super.pickTarget();

    if (isLivingPrey()) {
      float distTarget = width;
      prey targetPrey = null;
      for (int i = 0; i < preys.length; i++) {
        if (preys[i].isAlive()) {
          //start with the first living prey we find
          if (targetPrey == null) {
            targetPrey = preys[i];
            distTarget = PVector.dist(location, preys[i].target);
          } 
          else {
            //is this prey's target closer than the last?
            float tempDist = PVector.dist(location, preys[i].target);

            if (tempDist < distTarget) {
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
      myGrid.updateTargetCell(target, 4);
    } 
    else {
      //there are no living prey
      setTargetNoPrey();
    }
  }

  void setTargetNoPrey() {
    int choice = (int) random(10);

    if (posLastAte == null || choice < 3) {
      //pick a random destination
      target.set(random(width), random(height));
    } 
    else {
      //look near last feeding
      target.set(posLastAte.x + random(-10, 10), posLastAte.y + random(-10, 10));
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

            posLastAte = new PVector(location.x, location.y);
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
    PVector dest = myGrid.getNewPreyDest(location);

    target.set(dest.x, dest.y);
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
