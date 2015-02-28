
class Bomb {
  float xpos, ypos;
  float speed = 15;
  int rB = 12;

  //Bomb constructor
  Bomb(float tempXpos, float tempYpos) {
    xpos = tempXpos;
    ypos = tempYpos;
  }

  //Bomb methods
  void display() {
    image(imgBomb, xpos, ypos);
    if (ypos >= 450) {
      image(imgExplode, xpos-12, ypos);
      rB = 35;
    }
  }

  void fire() {
    ypos = ypos + speed;
  }

  boolean hitBottom() {
    if (ypos <= 0) {
      return true;
    } 
    else {
      return false;
    }
  }

  //Specify intersect conditions for bombs and the player
  boolean intersect(Player a) {
    float distance = dist(xpos+15, ypos, a.x_, a.y_);
    if (distance <= rB + a.r ) {
      return true;
    } 
    else {
      return false;
    }
  }
}


