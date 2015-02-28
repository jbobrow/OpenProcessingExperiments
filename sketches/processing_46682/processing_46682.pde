
class Ant {

  Vec3D loc;
  Vec3D nextLoc;
  int speed;
  float step;
  color c;
  boolean hasFood = false;


  int x = (width/2)/resolution;
  int y = (height/2)/resolution;

  float pR;
  float pL;
  float pF;
  float pB;

  Ant(Vec3D _loc, float _step, int _speed) {
    loc = new Vec3D(resolution*2, resolution*2, 0);
    step = _step;
    speed = _speed;

    x = int(loc.x/resolution);
    y = int(loc.y/resolution);
  }

  void run() {
    rebirth();
    evalPhero();
    foodFinding();
    nestReturn();
    display();
    move();
    updateLoc();
    updateIndex();
  }

  void rebirth() {
    if (x >= int(width/resolution) - speed|| x <= 0 + speed || y >= int(height/resolution) - speed || y <= 0 + speed) {
      loc = new Vec3D(nestX, nestY, 0);
      x = int(loc.x/resolution);
      y = int(loc.y/resolution);
      hasFood = false;
    }
  }

  void evalPhero() {
    Cell r = grid[x + speed][y];
    Cell l = grid[x - speed][y];
    Cell f = grid[x][y + speed];
    Cell b = grid[x][y - speed];

    if (hasFood) {
      float tempPL = sq(k + l.homePheroLev);
      float tempPB = sq(k + b.homePheroLev);

      pL = tempPL/(tempPL + tempPB);
      pB = tempPB/(tempPL + tempPB);
    }
    else {
      float tempPR = sq(k + r.foodPheroLev);
      float tempPF = sq(k + f.foodPheroLev);

      pR = tempPR/(tempPR + tempPF);
      pF = tempPF/(tempPR + tempPF);
    }
  }

  void updateLoc() {
    loc = nextLoc;
  }



  void nestReturn() {
    Vec3D nest = new Vec3D(resolution, resolution, 0);

    float distance = loc.distanceTo(nest);

    if (distance < nestSize/2) {
      if (hasFood) {
        foodCaught++;
        println("FOOD!!! " + foodCaught);
      }
      hasFood = false;
    }
  }

  void foodFinding() {
    for (int i = 0; i < food.size(); i++) {
      Food f = (Food) food.get(i);

      float distance = loc.distanceTo(f.loc);

      if (distance < f.dim/2) {
        hasFood = true;
      }
    }
  }


  void updateIndex() {
    x = int(loc.x/resolution);
    y = int(loc.y/resolution);
  }

  void move() {
    if (x > 0 && x < width/resolution && y > 0 && y < height/resolution) {
      float rand = random(1);

      if (hasFood) {
        if (rand < pL) {
          nextLoc = new Vec3D(grid[x - speed][y].loc.x, grid[x - speed][y].loc.y, 0);
        }
        else if (rand < 1) {
          nextLoc = new Vec3D(grid[x][y - speed].loc.x, grid[x][y - speed].loc.y, 0);
        }
      }
      else {
        if (rand < pR) {
          nextLoc = new Vec3D(grid[x + speed][y].loc.x, grid[x + speed][y].loc.y, 0);
        }
        else if (rand < 1) {
          nextLoc = new Vec3D(grid[x][y + speed].loc.x, grid[x][y + speed].loc.y, 0);
        }
      }
    }
    else {
      rebirth();
    }
  }


  void display() {
    if (hasFood) {
      stroke(255, 255, 0);
    }
    else {
      stroke(255, 0, 0);
    }
    strokeWeight(resolution);
    point(loc.x, loc.y);
  }
}


