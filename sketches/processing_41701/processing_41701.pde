
class BlackHole {
  //Feilds
  float x;
  float y;
  float dirX = 0;
  float dirY = 0;
  float velo = 0.99;
  int sz = 10;
  int mn = 8;
  int mx = 15;
  int pulse = 1;
  int count = 0;
  int hold = 0;

  //Constructor
  BlackHole(int _x, int _y) {
    x = _x;
    y = _y;
    display();
  }

  //Draw Hole
  void display() {
    if (count >= 10) {
      if (sz <= mn) {
        pulse = 1;
        sz = mn + 1;
      }
      if (sz >= mx) {
        pulse = -1;
        sz = mx - 1;
      }
      sz += pulse;
      count = 0;
    }
    else {
      count++;
    }
    if (passedOver() != -1) {
      sz += 2;
      hold = 8;
      noStroke();
      if (holes[0].passedOver() != -1) {
        if (!p2.isPlaying()) p2.loop(0);
      }
      else if (holes[1].passedOver() != -1) { 
        if (!p3.isPlaying()) p3.loop(0);
      }
      else if (holes[2].passedOver() != -1) { 
        if (!p4.isPlaying()) p4.loop(0);
      }
    }
    else {
      noStroke();
      if (hold != 0) { 
        hold--;
        fill(68, 140, 203);
      }
      else fill(0);
    }
    dirX *= velo;
    dirY *= velo;
    x += dirX;
    y += dirY;
    ellipse(x, y, sz, sz);
  }

  int passedOver() {
    for (int i = 0; i < stars.size(); i++) {
      Star s = (Star) stars.get(i);
      PVector loc = s.getLocation();
      if (dist(x, y, loc.x, loc.y) < (sz/2)) return i;
    }
    return -1;
  }

  void mouseClose(int num) {
    int dis = int(mouseCheck(holes[num].getX(), holes[num].getY()));
    int disX = mouseX - holes[num].getX();
    int disY = mouseY - holes[num].getY();
    if (disX < press && disX > 0 && abs(disY) < dis) holes[num].setDirX((press - disX)/(200)*-1);
    if (disX < 0 && disX > -press && abs(disY) < dis) holes[num].setDirX((-press - disX)/(200)*-1);
    if (disY < press && disY > 0 && abs(disX) < dis) holes[num].setDirY((press - disY)/(200)*-1);
    if (disY < 0 && disY > -press && abs(disX) < dis) holes[num].setDirY((-press - disY)/(200)*-1);
  }

  void boundaryCheck() {
    if (x + sz > width || x - sz < 0) dirX *= -1;
    if (y + sz > height || y - sz < 0) dirY *= -1;
  }

  int getX() {
    return int(x);
  }

  int getY() {
    return int(y);
  }

  void setDirX(int _dirX) {
    dirX += _dirX;
  }

  void setDirY(int _dirY) {
    dirY += _dirY;
  }

  int getSize() { 
    return sz;
  }
}


