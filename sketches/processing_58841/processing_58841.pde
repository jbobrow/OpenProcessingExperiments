
class Ball {
  float x;    // location
  float y;
  float z;
  float xspeed;    // speed, velocity
  float yspeed;
  float zspeed;
  float start = 6;
  float angle = random(0, TWO_PI);
  float magN = random(0.2, 1.6);
  int timer;
  boolean alive = true;
   
  Ball() {
    x = r.xSize/2 * r.d;
    y = r.ySize/2 * r.d;
    z = r.vals[(int)r.xSize/2][(int)r.ySize/2] - 60;
    xspeed = cos(angle) * magN;
    yspeed = sin(angle) * magN;
    zspeed = random(0, start);
    timer = 75;
  }
   
  void update() {
    zspeed -= 0.1;
    x += xspeed;
    y += yspeed;
    z += zspeed;
    timer--;
    
    pushMatrix();
    translate(x, y, z);
    fill(frameRate * 127, 120, 0, timer);
    sphere(10);
    popMatrix();
    if (x < 0 || x > r.xSize * r.d || y < 0 || y > r.ySize * r.d) {
    } else if (z < 0 || z < r.vals[(int)constrain(x/r.d, 0, r.xSize)][(int)constrain(y/r.d, 0, r.ySize)]) {
      int xx = ((int) (x/r.d));
      int yy = ((int) (y/r.d));
      int minX = (int) constrain(xx - 2, 0, r.xSize);
      int minY = (int) constrain(yy - 2, 0, r.ySize);
      int maxX = (int) constrain(xx + 2, 0, r.xSize);
      int maxY = (int) constrain(yy + 2, 0, r.ySize);
      for (int i = minX; i < maxX; i++) {
        for (int j = minY; j < maxY; j++) {
         float val = mask[xx - i + 2][yy - j + 2];
         r.vals[i][j] += val;
        }
      }
      alive = false;
    }
  }
}


