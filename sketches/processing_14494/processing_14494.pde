
class Bait {
  float xpos = width/2;
  float ypos = height/2;
  float speed = 4;
  float speed2 = 6;
  int direction = 1;
  int direction2 = -1;
  int radius = x/4;

  void setPosition() {
    xpos = random(radius+1, width-radius-1);
    ypos = random(radius+1, height-radius-1);
  }

  void move() {
    xpos = xpos + speed * direction;
    ypos = ypos + speed2 * direction2;
    if (ypos > height-radius || ypos < radius) {
      direction2 *= -1;
    }
    if (xpos > width-radius || xpos < radius) {
      direction *= -1;
    }
  }
}


