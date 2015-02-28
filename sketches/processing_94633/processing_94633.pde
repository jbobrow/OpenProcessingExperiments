
class Crawler {
  int x;
  int y;
  int pivotCorner;
  int pivotAngle;
  int pivotGoal;
  int spawnDirection;
  int spawnCounter;
  Population home;
  ArrayList reserved;
  ArrayList locked;
  
  Crawler(Population homeland, int nx, int ny) {
    home = homeland;
    x = nx;
    y = ny;
    pivotCorner = 0;
    pivotAngle = 0;
    pivotGoal = 0;
    spawnDirection = -1;
    spawnCounter = 0;
    home.space[x][y] = 1;
    reserved = new ArrayList();
    locked = new ArrayList();
  }
  
  
  
  // ========================== DRAW ==========================
  void draw() {
    noFill();
    pushMatrix();
      translate(x * a, y * a);
      if(spawnDirection != -1) drawSpawner();
      stroke(56); 
      fill(255, map(countNeighbours(), 0, 8, 28, 128));
      drawFromCorner(pivotCorner);
    popMatrix();
  }
  
  
  // ========================== DRAW SPAWNER ==========================
  void drawSpawner() {
    
    stroke(map(spawnCounter, 0, 100, 255, 56));
    switch(spawnDirection) {
      case -1:
        return;
      case 0:
        rect(-a * spawnCounter * 0.01, 0, a * spawnCounter * 0.01, a);
        break;
      case 1:
        rect(0, -a * spawnCounter * 0.01, a, a * spawnCounter * 0.01);
        break;
      case 2:
        rect(a, 0, a * spawnCounter * 0.01, a);
        break;
      case 3:
        rect(0, a, a, a * spawnCounter * 0.01);
        break;
    }
    if(spawnCounter >= 100) finishSpawn();
    else spawnCounter ++;
  }
  
  
  // ========================== DRAW FROM CORNER ==========================
  void drawFromCorner(int cor) {
    pushMatrix();
    switch(cor) {
      case 0:
        break;
      case 1:
        translate(a, 0);
        rotate(HALF_PI);
        break;
      case 2:
        translate(a, a);
        rotate(PI);
        break;
      case 3:
        translate(0, a);
        rotate(-HALF_PI);
        break;
    }
    rotate(radians(pivotAngle));
    rect(0, 0, a, a);
    popMatrix();
    pivot();
  }
  
  
  // ========================== PIVOT ==========================
  void pivot() {
    switch(pivotAngle) {
      case 90:
        switch(pivotCorner) {
          case 0:
            switchPosition(-1, 0);
            pivotCorner = 1;
            break;
          case 1:
            switchPosition(0, -1);
            pivotCorner = 2;
            break;
          case 2:
            switchPosition(1, 0);
            pivotCorner = 3;
            break;
          case 3:
            switchPosition(0, 1);
            pivotCorner = 0;
            break;
        }
        pivotAngle -= 90;
        pivotGoal -= 90;
        reservePositions();
        break;
      case -90:
        switch(pivotCorner) {
          case 0:
            switchPosition(0, -1);
            pivotCorner = 3;
            break;
          case 1:
            switchPosition(1, 0);
            pivotCorner = 0;
            break;
          case 2:
            switchPosition(0, 1);
            pivotCorner = 1;
            break;
          case 3:
            switchPosition(-1, 0);
            pivotCorner = 2;
            break;
        }
        pivotAngle += 90;
        pivotGoal += 90;
        reservePositions();
        break;
      default:
        if(pivotAngle < pivotGoal) pivotAngle += speed;
        if(pivotAngle > pivotGoal) pivotAngle -= speed;
      break;
    }
    if(!moving()) occupy();
  }
  
  
  // ========================== SWITCH POSITIONS ==========================
  void switchPosition(int dx, int dy) {
    home.space[x][y] = -1;
    x += dx; y += dy;
    home.space[x][y] = 1;
  }
  
  
  // ========================== RESERVE POSITIONS ==========================
  void reservePositions() {
    clearReserved();
    clearLocked();
    switch(pivotCorner) {
      case 0:
        if(pivotGoal == 90) {
          lock(-1, -1);
          reserve(0, 0);
          reserve(-1, 0);
          reserve(-1, 1);
          reserve(0, 1);
        }
        if(pivotGoal == 180) {
          lock(0, -1);
          reserve(0, 0);
          reserve(-1, 0);
          reserve(-1, 1);
          reserve(0, 1);
          reserve(-2, 0);
          reserve(-2, -1);
          reserve(-1, -1);
        }
        if(pivotGoal == -90) {
          lock(-1, -1);
          reserve(0, 0);
          reserve(0, -1);
          reserve(1, -1);
          reserve(1, 0);
        }
        if(pivotGoal == -180) {
          lock(-1, 0);
          reserve(0, 0);
          reserve(0, -1);
          reserve(1, -1);
          reserve(1, 0);
          reserve(-1, -1);
          reserve(0, -2);
          reserve(-1, -2);
        }
        break;
      case 1:
        if(pivotGoal == 90) {
          lock(1, -1);
          reserve(0, 0);
          reserve(-1, -1);
          reserve(-1, 0);
          reserve(0, -1);
        }
        if(pivotGoal == 180) {
          lock(1, 0);
          reserve(0, 0);
          reserve(-1, -1);
          reserve(-1, 0);
          reserve(0, -1);
          reserve(0, -2);
          reserve(1, -2);
          reserve(1, -1);
        }
        if(pivotGoal == -90) {
          lock(1, -1);
          reserve(0, 0);
          reserve(1, 0);
          reserve(1, 1);
          reserve(0, 1);
        }
        if(pivotGoal == -180) {
          lock(0, -1);
          reserve(0, 0);
          reserve(1, 0);
          reserve(1, 1);
          reserve(0, 1);
          reserve(2, 0);
          reserve(2, -1);
          reserve(1, -1);
        }
        break;
      case 2:
        if(pivotGoal == 90) {
          lock(1, 1);
          reserve(0, 0);
          reserve(1, 0);
          reserve(1, -1);
          reserve(0, -1);
        }
        if(pivotGoal == 180) {
          lock(0, 1);
          reserve(0, 0);
          reserve(1, 0);
          reserve(1, -1);
          reserve(0, -1);
          reserve(2, 0);
          reserve(2, 1);
          reserve(1, 1);
        }
        if(pivotGoal == -90) {
          lock(1, 1);
          reserve(0, 0);
          reserve(-1, 0);
          reserve(-1, 1);
          reserve(0, 1);
        }
        if(pivotGoal == -180) {
          lock(1, 0);
          reserve(0, 0);
          reserve(-1, 0);
          reserve(-1, 1);
          reserve(0, 1);
          reserve(0, 2);
          reserve(1, 1);
          reserve(1, 2);
        }
        break;
      case 3:
        if(pivotGoal == 90) {
          lock(-1, 1);
          reserve(0, 0);
          reserve(1, 0);
          reserve(1, 1);
          reserve(0, 1);
        }
        if(pivotGoal == 180) {
          lock(-1, 0);
          reserve(0, 0);
          reserve(1, 0);
          reserve(1, 1);
          reserve(0, 1);
          reserve(-1, 2);
          reserve(-1, 1);
          reserve(0, 2);
        }
        if(pivotGoal == -90) {
          lock(-1, 1);
          reserve(0, 0);
          reserve(-1, 0);
          reserve(-1, -1);
          reserve(0, -1);
        }
        if(pivotGoal == -180) {
          lock(0, 1);
          reserve(0, 0);
          reserve(-1, 0);
          reserve(-1, -1);
          reserve(0, -1);
          reserve(-2, 0);
          reserve(-1, 1);
          reserve(-2, 1);
        }
        break;
    }
  }
  
  // ========================== RESERVE ==========================
  void reserve(int rx, int ry) {
    reserved.add(new PVector(x + rx, y + ry));
    home.space[x + rx][y + ry] = 0;
  }
  
  
  // ========================== OCCUPY ==========================
  void occupy() {
    if(!locked()) home.space[x][y] = 1;
  }
  
  // ========================== LOCK ==========================
  void lock(int rx, int ry) {
    if(home.space[x + rx][y + ry] != 1) return;
    locked.add(new PVector(x + rx, y + ry));
    home.space[x + rx][y + ry] = 3;
  }
  
  
  // ========================== CLEAR RESERVED ==========================
  void clearReserved() {
    for(int i = 0; i < reserved.size(); i++) {
      PVector r = (PVector) reserved.get(i);
      if(home.space[int(r.x)][int(r.y)] != 1) home.space[int(r.x)][int(r.y)] = -1;
      if(int(r.x) == x && int(r.y) == y) home.space[int(r.x)][int(r.y)] = 1;
    }
    reserved.clear();
  }
  
  // ========================== CLEAR LOCKED ==========================
  void clearLocked() {
    for(int i = 0; i < locked.size(); i++) {
      PVector l = (PVector) locked.get(i);
      if(home.space[int(l.x)][int(l.y)] != 1) home.space[int(l.x)][int(l.y)] = 1;
    }
    locked.clear();
  }
  
  
  // ========================== SET PIVOT GOAL ==========================
  void setPivotGoal(int g) {
    if(moving() || locked()) return;
    pivotGoal = g;
    reservePositions();
    //println("pivotCorner = " + pivotCorner + " pivotGoal = " + pivotGoal);
  }
  
  
  // ========================== SET PIVOT CORNER ==========================
  void setPivotCorner(int c) {
    if(moving() || locked()) return;
    pivotCorner = c;
  }
  
  // ========================== CHECK PIVOT CORNER ==========================
  void moveAtRandom() {
    if(moving() || locked()) return;
    int c = int(random(4));
    int d = int(random(2));
    int dir = checkPivotCorner(c)[d];
    if(dir > 0) {
      setPivotCorner(c);
      setPivotGoal((d == 0 ? -1 : 1) * 90 * dir);
    }
  }
  
  // ========================== CHECK PIVOT CORNER ==========================
  int[] checkPivotCorner(int c) {
    int[] directions = {0, 0};
    
    switch(c) {
      case 0:
        if(checkNeighbour(-1, -1) && checkFree(0, 1) && checkFree(-1, 1) && checkFree(-1, 0))
          directions[1] = 1;
        if(checkNeighbour(0, -1) && checkFree(-1, -1) && checkFree(-1, 0) && checkFree(-1, 1) && checkFree(0, 1) && checkFree(-2, -1) && checkFree(-2, 0))
          directions[1] = 2;
          
        if(checkNeighbour(-1, -1) && checkFree(0, -1) && checkFree(1, -1) && checkFree(1, 0))
          directions[0] = 1;
        if(checkNeighbour(-1, 0) && checkFree(0, -1) && checkFree(1, -1) && checkFree(1, 0) && checkFree(-1, -1) && checkFree(0, -2) && checkFree(-1, -2))
          directions[0] = 2;
        break;
      case 1:
        if(checkNeighbour(1, -1) && checkFree(-1, -1) && checkFree(-1, 0) && checkFree(0, -1))
          directions[1] = 1;
        if(checkNeighbour(1, 0) && checkFree(-1, -1) && checkFree(-1, 0) && checkFree(0, -1) && checkFree(0, -2) && checkFree(1, -2) && checkFree(1, -1))
          directions[1] = 2;
          
        if(checkNeighbour(1, -1) && checkFree(1, 0) && checkFree(1, 1) && checkFree(0, 1))
          directions[0] = 1;
        if(checkNeighbour(0, -1) && checkFree(1, 0) && checkFree(1, 1) && checkFree(0, 1) && checkFree(2, 0) && checkFree(2, -1) && checkFree(1, -1))
          directions[0] = 2;
        break;
      case 2:
        if(checkNeighbour(1, 1) && checkFree(1, 0) && checkFree(1, -1) && checkFree(0, -1))
          directions[1] = 1;
        if(checkNeighbour(0, 1) && checkFree(1, 0) && checkFree(1, -1) && checkFree(0, -1) && checkFree(2, 0) && checkFree(2, 1) && checkFree(1, 1))
          directions[1] = 2;
          
        if(checkNeighbour(1, 1) && checkFree(-1, 0) && checkFree(-1, 1) && checkFree(0, 1))
          directions[0] = 1;
        if(checkNeighbour(1, 0) && checkFree(-1, 0) && checkFree(-1, 1) && checkFree(0, 1) && checkFree(0, 2) && checkFree(1, 1) && checkFree(1, 2))
          directions[0] = 2;
        break;
      case 3:
        if(checkNeighbour(-1, 1) && checkFree(1, 0) && checkFree(1, 1) && checkFree(0, 1))
          directions[1] = 1;
        if(checkNeighbour(-1, 0) && checkFree(1, 0) && checkFree(1, 1) && checkFree(0, 1) && checkFree(-1, 2) && checkFree(-1, 1) && checkFree(0, 2))
          directions[1] = 2;
          
        if(checkNeighbour(-1, 1) && checkFree(-1, 0) && checkFree(-1, -1) && checkFree(0, -1))
          directions[0] = 1;
        if(checkNeighbour(0, 1) && checkFree(-1, 0) && checkFree(-1, -1) && checkFree(0, -1) && checkFree(-2, 0) && checkFree(-1, 1) && checkFree(-2, 1))
          directions[0] = 2;
        break;
    }
    
    return directions;
  }
  
  
  // ========================== am I MOVING ==========================
  boolean moving() {
    if(pivotGoal != 0) return true;
    else return false;
  }
  
  
  // ========================== am I LOCKED ==========================
  boolean locked() {
    if(home.space[x][y] == 3) return true;
    else return false;
  }
  
  // ========================== CHECK NEIGHBOUR ==========================
  boolean checkNeighbour(int nx, int ny) {
    if(home.space[x + nx][y + ny] == 1 || home.space[x + nx][y + ny] == 3) return true;
    else return false;
  }
  
  
  // ========================== COUNT NEIGHBOURS ==========================
  int countNeighbours() {
    int sum = -1;
    for(int i = -1; i <= 1; i++)
      for(int j = -1; j <= 1; j++)
        if(checkNeighbour(i, j)) sum++;
    return sum;
  }
  
  // ========================== CHECK FREE ==========================
  boolean checkFree(int nx, int ny) {
    if(home.space[x + nx][y + ny] == -1) return true;
    else return false;
  }
  
  // ========================== SPAWN ==========================
  void spawn() {
    if(moving() || locked()) return;
    if(random(8) < countNeighbours()) return;
    int dir = int(random(4));
    switch(dir) {
      case 0:
        if(!checkFree(-1, 0)) return;
        reserve(-1, 0);
        break;
      case 1:
        if(!checkFree(0, -1)) return;
        reserve(0, -1);
        break;
      case 2:
        if(!checkFree(1, 0)) return;
        reserve(1, 0);
        break;
      case 3:
        if(!checkFree(0, 1)) return;
        reserve(0, 1);
        break;
    }
    lock(0, 0);
    spawnDirection = dir;
    spawnCounter = 1;
  }
  
  
  // ========================== FINISH SPAWN ==========================
  void finishSpawn() {
    clearReserved();
    switch(spawnDirection) {
      case 0:
        home.addCrawler(x - 1, y);
        break;
      case 1:
        home.addCrawler(x, y - 1);
        break;
      case 2:
        home.addCrawler(x + 1, y);
        break;
      case 3:
        home.addCrawler(x, y + 1);
        break;
    }
    clearLocked();
    spawnDirection = -1;
    spawnCounter = 0;
  }
}

