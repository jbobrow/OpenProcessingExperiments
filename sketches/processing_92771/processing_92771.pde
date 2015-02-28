
final int maxBalls = 100;
final int perSpawn = maxBalls / 1;
final int velocity = 5;
Ball[] BallArray;
Poly[] PolyArray;
int ballsSpawned = 0;
int totalPolys = 0;

void setup() {
  size(800, 450);
  frameRate(200);
  background(100, 100, 100);
  BallArray = new Ball[1000];
  PolyArray = new Poly[10];
  for (int i = 0; i < 10; i++) {
    PolyArray[i] = new Poly();
  }
}

void draw() {
  background(100, 100, 100);
  for (int i = 0; i < totalPolys; i++) {
    PolyArray[i].drawSelf();
  }
  for (int i = 0; i < maxBalls && i < ballsSpawned; i++) {
    BallArray[i].increment();
    BallArray[i].drawSelf();
  }
}

void drawCircle(int x, int y, int r) {
  ellipse(x, y, r*2, r*2);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    PolyPoint();
  }
}

void keyPressed() {
  if (key == 'c') {
    ballsSpawned = 0;
  }
  if (key == 'b') {
      SpawnBalls();
  }
  if (key == 'z' && totalPolys<10) {
    PolyArray[totalPolys].setFinished(true);
    totalPolys++;
  }
}

void SpawnBalls() {
  for (int i = 0; i < perSpawn; i++) {
    BallArray[ballsSpawned % maxBalls + i] = new Ball(mouseX, mouseY, random(1, 3), random(0, 360), 7);
  }
  ballsSpawned += perSpawn;
}

void PolyPoint() {
  if (totalPolys < 10) {
    PolyArray[totalPolys].addPoint(mouseX, mouseY);
  }
}

int ballCount() {
  return BallArray.length;
}

class Poly {
  int[][] pointArray = new int[2][5];
  int thickness;
  int totalPoints;
  boolean isFinished = false;

  Poly() {
    thickness = 4;
    totalPoints = 0;
  }

  Poly(int thickness1) {
    thickness = thickness1;
    totalPoints = 0;
  }

  void drawSelf() {
    if (totalPoints > 1) {
      for (int i = 0; i < totalPoints - 1; i++) {
        line(pointArray[0][i], pointArray[1][i], pointArray[0][i+1], pointArray[1][i+1]);
      }
      if (isFinished) {
        line(pointArray[0][totalPoints-1], pointArray[1][totalPoints-1], pointArray[0][0], pointArray[1][0]);
      }
    }
  }

  int getTotalPoints() {
    return totalPoints;
  }

  int getX(int i) {
    if (i < 5 && i >= 0) {
      return pointArray[0][i];
    }
    else {
      return -1;
    }
  }

  int getY(int i) {
    if (i < 5 && i >= 0) {
      return pointArray[1][i];
    }
    else {
      return -1;
    }
  }

  void addPoint(int x1, int y1) {
    if (!isFinished) {
      pointArray[0][totalPoints] = x1;
      pointArray[1][totalPoints] = y1;
      totalPoints++;
      if (totalPoints == 5) {
        isFinished = true;
        totalPolys++;
      }
    }
  }

  void setX(int i, int x1) {
    if (i < 5 && i >= 0) {
      pointArray[0][i] = x1;
    }
  }

  void setY(int i, int y1) {
    if (i < 5 && i >= 0) {
      pointArray[1][i] = y1;
    }
  }

  void setFinished(boolean b) {
    isFinished = b;
  }

  boolean isFinished() {
    return isFinished;
  }
}

class Ball {
  float x, y, Vx, Vy, r, angle;
  boolean attached = false;


  Ball() {
    x = 0;
    y = 0;
    Vx = 0;
    Vy = 0;
    r = 0;
    angle = 0;
  }

  Ball(float x1, float y1, float V1, float angle1, float r1) {
    x = x1;
    y = y1;
    Vx = V1 * cos(radians(angle1));
    Vy = V1 * sin(radians(angle1));
    angle = angle1;
    r = r1;
  }

  void drawSelf() {
    ellipse(x, y, r*2, r*2);
  }

  void increment() {
    if (!attached){
      if (detectCollision()){
        Vx = 0;
        Vy = 0;
        attached = true;
    }
    }
    x = x + Vx;
    y = y + Vy;
    if (x < 0 + r || x > width - r) {
      Vx = -Vx;
    }
    if (y < 0 + r || y > height - r) {
      Vy = -Vy;
    }
  }

  boolean detectCollision() {
    Poly currentPoly;
    float a, b, l;
    int x1, y1, x2, y2;
    float thresh = 0.5;
      for (int i = 0; i < totalPolys; i++) {
        currentPoly = PolyArray[i];
        for (int j = 0; j < currentPoly.getTotalPoints() - 1; j++) {
          x1 = currentPoly.getX(j);
          y1 = currentPoly.getY(j);
          x2 = currentPoly.getX(j+1);
          y2 = currentPoly.getY(j+1);
          l = sqrt( pow(x2 - x1, 2) + pow(y2 - y1, 2));
          a = sqrt( pow(x2 - x, 2) + pow(y2 - y, 2));
          b = sqrt( pow(x1 - x, 2) + pow(y1 - y, 2));
          if ((a + b) - l < thresh || a < thresh*10 || b < thresh*10) {
            return true;
          }
        }
          x1 = currentPoly.getX(currentPoly.getTotalPoints() - 1);
          y1 = currentPoly.getY(currentPoly.getTotalPoints() - 1);
          x2 = currentPoly.getX(0);
          y2 = currentPoly.getY(0);
          l = sqrt( pow(x2 - x1, 2) + pow(y2 - y1, 2));
          a = sqrt( pow(x2 - x, 2) + pow(y2 - y, 2));
          b = sqrt( pow(x1 - x, 2) + pow(y1 - y, 2));
         if ((a + b) - l < thresh || a < thresh*10 || b < thresh*10) {
            return true;
          }
      }
      return false;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  void setX(int x1) {
    x = x1;
  }

  void setY(int y1) {
    y = y1;
  }

  float getR() {
    return r;
  }

  float setR() {
    return r;
  }

  void setV(int V1, int angle1) {
    Vx = V1 * cos(radians(angle1));
    Vy = V1 * sin(radians(angle1));
    angle = angle1;
  }

  void setV(int V1) {
    Vx = V1 * cos(radians(angle));
    Vy = V1 * sin(radians(angle));
  }

  void setAngle(int angle1) {
    Vx = V * cos(radians(angle));
    Vy = V * sin(radians(angle));
    angle = angle1;
  }
}
