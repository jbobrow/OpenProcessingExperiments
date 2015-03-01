
Level[] level = new Level[1];
int gameState = 0;
int cols = 25;
int rows = 25;
Cells[][] cell = new Cells[cols][rows];
boolean paused = false;

void setup() {
  size(700, 700);
  background(0);
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      cell[i][j] = new Cells(i, j);
    }
  }
  level[0] = new Level(20, 15, 8, 3, 5);
}


void draw() {
  if (gameState == 0) splash();
  else if (gameState <= level.length) level[gameState-1].display();
  else gameFinished();
}

void splash() {
  background(#08E4FF);
  textAlign(CENTER);
  textSize(60);
  fill(255);
  text("CURED", width/2, height/2);
  textSize(20);
  text("press space to start", width/2, height/2 +40);
  if(keyPressed && key == ' ') gameState ++;
}

void gameFinished() {
  background(#FF0000);
  textAlign(CENTER);
  textSize(60);
  fill(255);
  text("INFECTED", width/2, height/2);
  textSize(20);
  text("press space to try again", width/2, height/2 +40);
}

void infectOthers (int c, int r) {
  for (int i = c-1; i<=c+1; i++) {
    for (int j = r-1; j<=r+1; j++) {
      if (isInBounds(i, j) && (i == c || j == r)) {
        if (!(cell[i][j].isInfected && cell[i][j].readyToInfect && cell[i][j].isCured)) {
          cell[i][j].readyToInfect = false;
          cell[i][j].isInfected = true;
        }
      }
    }
  }
}

boolean isInBounds(int c, int r) {
  if (c < 0 || c >= cols || r < 0 || r >= rows) {
    return false;
  }
  return true;
}

void moveCure(int c, int r) {
  int n = 0;
  ArrayList<Cells> infectedCells = new ArrayList<Cells>();
  while (infectedCells.size () == 0){
    n++;
    for (int i = c-n; i <= c+n; i++) {
      for (int j = r-n; j <= r+n; j++) {
        if (isInBounds(i, j)) {
          if (cell[i][j].isInfected && !(i == c && j == r)) {
            infectedCells.add(cell[i][j]);
          }
        }
      }
    }
  }

  if (infectedCells.size() > 0) {
    Cells cellToCure = findClosest(infectedCells, level[0].motherCellX, level[0].motherCellY);
    Cells movedCure = moveCureSpace(c, r, cellToCure);
    movedCure.isCured = true;
    movedCure.isInfected = false;
    movedCure.readyToCure = false;
    cell[c][r].isInfected = false;
    cell[c][r].isCured = false;
  }
}

Cells moveCureSpace(int cureI, int cureJ, Cells cellToCure) {
  if (cureI > cellToCure.i) {
    if (cureJ > cellToCure.j) {
      //2nd quadrand
      if (random(1) > .5 && isInBounds(cureI-1, cureJ)) return cell[cureI-1][cureJ];
      else if(isInBounds(cureI, cureJ-1)) return cell[cureI][cureJ-1];
    }
    else {
      //3rd quadrant
      if (random(1) > .5 && isInBounds(cureI-1, cureJ)) return cell[cureI-1][cureJ];
      else if(isInBounds(cureI, cureJ+1)) return cell[cureI][cureJ+1];
    }
  }
  else if (cureJ > cellToCure.j) {
    //1st quadrant
    if (random(1) > .5 && isInBounds(cureI+1, cureJ)) return cell[cureI+1][cureJ];
    else if(isInBounds(cureI, cureJ-1)) return cell[cureI][cureJ-1];
  }
  else {
    //4th quadrant
    if (random(1) > .5 && isInBounds(cureI+1, cureJ)) return cell[cureI+1][cureJ];
    else if(isInBounds(cureI, cureJ+1)) return cell[cureI][cureJ+1];
  }
  return cell[cureI][cureJ];
}


Cells findClosest(ArrayList<Cells> cellList, int x, int y) {
  FloatList numList = new FloatList();
  FloatList sortedNumList;
  for (Cells c : cellList) {
    float d = dist(c.x, c.y, x, y);
    numList.append(d);
  }
  sortedNumList = numList;
  sortedNumList.sort();
  for (int i=0; i<numList.size(); i++) {
    if (numList.get(i) == sortedNumList.get(0)) {
      Cells returnCell = cellList.get(i);
      return returnCell;
    }
  }
  Cells closestCell = cellList.get(cellList.size());
  return closestCell;
}

class Cells {
  int x, y;
  int i, j;
  boolean isInfected, isCured;
  boolean readyToInfect, readyToCure;
  boolean isWinSpace;
  boolean mousedOver;
  Cells(int ni, int nj) {
    i = ni;
    j = nj;
    if (j%2 ==0) {
      x = i*25 + 50;
      y = j*25 + 50;
    }
    else {
      x = i*25 + 67; //75
      y = j*25 + 50;
    }
  }

  color fillCol () {
    if (isCured) return color(#03B9FF);
    else if (isInfected) return color(#FF3E3E);
    else if (isWinSpace) return color(0, 255, 0);
    else if (mousedOver) return color(0);
    else return color(#C2C6C6);
  }

  void display() {
    strokeWeight(10);
    stroke(fillCol());
    point(x, y);
  }
}

class Level {
  int infectedX, infectedY, motherCellX, motherCellY, antibodyCount;
  int levelState = 1;
  int timer = 0;
  int mouseCoverage = 40;

  Level(int initialInfectedX, int initialInfectedY, int _motherCellX, int _motherCellY, int _antibodies) {
    infectedX = initialInfectedX;
    infectedY = initialInfectedY;
    motherCellX = _motherCellX;
    motherCellY = _motherCellY;
    antibodyCount = _antibodies;

    cell[infectedX][infectedY].isInfected = true;
    cell[motherCellX][motherCellY].isWinSpace = true;
    println(dist(infectedX, infectedY, motherCellX, motherCellY));
  }

  void display() {
    //    if (levelState == 0) placeCures();
    if (levelState == 1) displayLevel();
    else if (levelState == 2) displayWinScreen();
    else if (levelState == 3) displayLoseScreen();
  }


  void placeCures() {
    background(255);
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        cell[i][j].display();
      }
    }

    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        if (dist(mouseX, mouseY, cell[i][j].x, cell[i][j].y) <= 12) {
          cell[i][j].mousedOver = true;
          if (mousePressed) {
            if (!cell[i][j].isCured) {
              cell[i][j].isCured = true;
              cell[i][j].mousedOver = false;
              antibodyCount --;
            }
          }
        } 
        else cell[i][j].mousedOver = false;
      }
    }
    if (antibodyCount <= 0) levelState ++;
  }

  void displayLevel() {
    if (!paused) {
      background(255);
      for (int i=0; i<cols; i++) {
        for (int j=0; j<rows; j++) {
          cell[i][j].display();
          cell[i][j].readyToInfect = true;
          cell[i][j].readyToCure = true;
          if (dist(mouseX, mouseY, cell[i][j].x, cell[i][j].y) <= mouseCoverage) {
            cell[i][j].mousedOver = true;
            if (mousePressed) {
              cell[i][j].isCured = true;
            }
          }
          else {
            cell[i][j].mousedOver = false;
          }
        }
      }
      if (timer % 60 == 15 || timer % 60 == 30 || timer % 60 == 45) {
        for (int i=0; i<cols; i++) {
          for (int j=0; j<rows; j++) {
            if (cell[i][j].isCured) {
              moveCure(i, j);
            }
          }
        }
      }
      if (timer % 60 == 0) {
        for (int i=0; i<cols; i++) {
          for (int j=0; j<rows; j++) {
            if (cell[i][j].isInfected && cell[i][j].readyToInfect) {
              infectOthers(i, j);
            }
          }
        }
      }
      timer ++;
    }
  }

  void displayWinScreen() {
  }

  void displayLoseScreen() {
  }
}



