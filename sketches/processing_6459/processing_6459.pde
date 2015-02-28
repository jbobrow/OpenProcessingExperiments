

class Amo {
  PVector loc = new PVector();
  Tower t;
  int time = 0;
  PVector center;
  PVector turret;
  float dirX, dirY;
  PImage bullet;

  Amo (float x, float y) {
    loc.x = x;
    loc.y = y;
    turret = new PVector(loc.x, loc.y);
    bullet = loadImage("bullet.png");
  }

  void run(float a, float b) {
    dirX = a;
    dirY = b;
    center = new PVector(dirX, dirY);
    image(bullet,loc.x,loc.y);
    PVector velocity = PVector.sub(center,turret);
    loc.add(new PVector(velocity.x/2, velocity.y/2));
  }
}







