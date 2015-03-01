
float escapeVelocity;
int fadeRate;

int maxCells = 100;
int maxCellsPerColony = 15;
int maxColonies = 10;

ArrayList<Cell> unattached;
ArrayList<Colony> colonies;

void setup() {
  size(800, 600);

  unattached = new ArrayList<Cell> ();
  colonies = new ArrayList<Colony> ();
  for (int i=0; i<maxCells; i++) {
    unattached.add(new Cell(width/2+random(-width/3, width/3), height/2+random(-height/3, height/3)));
  }
  
  escapeVelocity = 0.25;
  fadeRate = 16;

  background(0);
}

void draw() {
  noStroke();
  fill(0, fadeRate);
  rect(0, 0, width, height);

  for (int i=unattached.size ()-1; i>=0; i--) {
    Cell moveCell = unattached.get(i);
    if (moveCell.move()) {
      unattached.remove(i);
      moveCell = new Cell(width/2+random(-width/3, width/3), height/2+random(-height/3, height/3));
      unattached.add(moveCell);
    }
    moveCell.display();
  }

  for (int i=colonies.size ()-1; i>=0; i--) {
    Colony moveColony = colonies.get(i);
    if (moveColony.move()) {
      colonies.remove(i);
    }
  }

  for (int i=unattached.size ()-1; i>=0; i--) {
    Cell testCell = unattached.get(i);
    boolean stillUnattached = true;
    int colonyIndex = 0;

    if (testCell.age > 3) {
      while (stillUnattached && colonyIndex < colonies.size ()) {
        Colony testColony = colonies.get(colonyIndex);
        if  (testColony.collidingCell(testCell)) {
          testColony.addCell(testCell);
          stillUnattached = false;
        }
        colonyIndex++;
      }
    }
  }

  if (colonies.size() < maxColonies) {

    int firstCellInd = unattached.size()-1;
    while (firstCellInd >= 0) {
      Cell firstCell = unattached.get(firstCellInd);

      if (firstCell.age > 3) {
        int secondCellInd = firstCellInd - 1;
        boolean colonyPresent = false;
        Colony newColony = new Colony();
        while (secondCellInd >= 0) {
          Cell secondCell = unattached.get(secondCellInd);

          if (secondCell.age > 3) {
            float distance = dist(firstCell.x, firstCell.y, secondCell.x, secondCell.y);
            if (distance < (firstCell.cellSize+secondCell.cellSize) / 2) {
              if (!colonyPresent) {
                colonies.add(newColony);
                colonyPresent = true;
                newColony.addCell(firstCell);
              }
              newColony.addCell(secondCell);
              firstCellInd--;
            }
          }
          secondCellInd--;
        }
      }
      firstCellInd--;
    }
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    fadeRate = constrain(--fadeRate, 0, 255);
  }
  if (keyCode == RIGHT) {
    fadeRate = constrain(++fadeRate, 0, 255);
  }
  if (keyCode == DOWN) {
    escapeVelocity = constrain(escapeVelocity - 0.05, 0.05, 1);
  }
  if (keyCode == UP) {
    escapeVelocity = constrain(escapeVelocity + 0.05, 0.05, 1);
  }
}
class Cell {
  float x;
  float y;
  float cellSize;
  float direction;
  float speed;
  float omega;
  boolean inColony;
  int age;

  Cell(float x_, float y_) {
    x = x_;
    y = y_;
    cellSize = randomGaussian()*2 + 50;
    direction = random(TWO_PI);
    speed = random(0.1, 0.5);
    omega = random(-0.1, 0.1);
    inColony = false;
    age = 0;
    ellipseMode(RADIUS);
  }

  boolean move() {
    float dx = speed * sin(direction);
    float dy = speed * cos(direction);
    float newX = x + dx;
    float newY = y + dy;
    
    if (newX < cellSize/2 || newX > width - cellSize/2 || newY < cellSize/2 || newY > height - cellSize/2) {
      if ((x >= width && dx > 0) || ( x <= 0 && dx < 0) || (y >= height && dy > 0) || (y < 0 && dy < 0)) {
        direction += omega;
      }
      else {
        x = newX;
        y = newY;
      }
    } else {
      x = newX;
      y = newY;
    }
    age++;
    return age > 5000;
  }
  
  boolean update(float x_, float y_, float direction_, float speed_) {
    if (speed_ > cellSize*escapeVelocity) return true;
    x = x_;
    y = y_;
    direction = direction_;
    speed = speed_;
    return false;
  }
  
  void release() {
    inColony = false;
    unattached.add(this);
  }
  
  void capture() {
    inColony = true;
    age = 0;
    unattached.remove(this);
  }

  void display() {
    if (inColony) {
      stroke(255, 0, 0);
      fill(255, 0, 0, 32);
    }
    else {
      stroke(255);
      fill(255, 192-age/20.0);
    }
    ellipse(x, y, cellSize/2, cellSize/2);
  }
}

class Colony {
  float spinRate;
  float centreX;
  float centreY;
  ArrayList<Cell> cells;

  Colony() {
    spinRate = 0;
    cells = new ArrayList<Cell> ();
    centreX = 0;  // Temp value, recalculate once cells added
    centreY = 0;  // Temp value, recalculate once cells added
  };

  boolean move() {
    boolean cellsEscaped = false;

    for (int i=cells.size ()-1; i>=0; i--) {
      Cell spinCell = cells.get(i);
      float distFromCentre = dist(spinCell.x, spinCell.y, centreX, centreY);
      float spinSpeed = distFromCentre*spinRate;
      float cellAngle = atan2(spinCell.x - centreX, spinCell.y - centreY) + spinRate;

      if (spinCell.update(centreX+distFromCentre*sin(cellAngle), centreY+distFromCentre*cos(cellAngle), cellAngle, spinSpeed)) {
        spinCell.release();
        cells.remove(i);
        spinCell.display();
        cellsEscaped = true;
      }
    }

    if (cellsEscaped) {
      if (cells.size() == 1) {
        Cell lastCell = cells.get(0);
        lastCell.release();
        cells.clear();
      }
      recalculateCentre();
//      spinRate = 0;
    } else {
      spinRate = spinRate + radians(0.25);
    }

    for (int i=0; i<cells.size (); i++) {
      cells.get(i).display();
    }

    return cells.size() == 0;
  }

  void addCell(Cell newCell) {
    newCell.capture();
    cells.add(newCell);
    recalculateCentre();
    spinRate = 0;
  }

  void recalculateCentre() {
    float minX = width * 2;
    float maxX = -width;
    float minY = height * 2;
    float maxY = -height;

    for (int i=0; i<cells.size (); i++) {
      Cell tempCell = cells.get(i);
      if (tempCell.x-tempCell.cellSize/2 < minX) {
        minX = tempCell.x-tempCell.cellSize/2;
      }
      if (tempCell.x+tempCell.cellSize/2 > maxX) {
        maxX = tempCell.x+tempCell.cellSize/2;
      }
      if (tempCell.y-tempCell.cellSize/2 < minY) {
        minY = tempCell.y-tempCell.cellSize/2;
      }
      if (tempCell.y+tempCell.cellSize/2 > maxY) {
        maxY = tempCell.y+tempCell.cellSize/2;
      }
    }

    centreX = (minX+maxX)/2;
    centreY = (minY+maxY)/2;
  }

  boolean collidingCell(Cell testCell) {
    if (cells.size() >= maxCellsPerColony) return false;
    for (int i=0; i<cells.size (); i++) {
      Cell colonyCell=cells.get(i);
      float distance = dist(testCell.x, testCell.y, colonyCell.x, colonyCell.y);
      if (distance < (testCell.cellSize+colonyCell.cellSize) / 2) {
        return true;
      }
    }

    return false;
  }
}



