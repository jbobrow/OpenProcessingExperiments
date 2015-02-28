
class Bullet {
  /**** Fields ****/
  Player owner;
  PVector location;
  PVector trajectory;
  float speed;
  int damage;
  int breadth;
  color colNorm;
  color colCur;
  
  /**** Constructors ****/
  Bullet(Player tempOwner) {
    owner = tempOwner;
    location = owner.location.get();
    breadth = 10;
    speed = 15.0;
    damage = 1;
    trajectory = PVector.sub(owner.mouseLoc, location);
    trajectory.normalize();
    trajectory.mult(speed);
    colNorm = color(25, 75, 200);
    colCur = colNorm;
  }
  
  /**** Methods ****/
  void travel() {
    // Bullet is moved along the trajectory
    location.add(trajectory);
  }
  
  void stillAlive() {
    // Delete bullet if it goes off screen.
    // Also, a cheesy Portal reference.
    // http://www.youtube.com/watch?v=8IGS9qY7xko
    // Also, thanks amnon.owned from the Processing forums
    // for the refactored code tip!
    if (location.y > height || location.y < 0 || location.x > width || location.x < 0) {
      destroy();
    }
  }
  
  void hasHit() {
    for (int i = 0; i < theEnemies.size(); i++) {
      Enemy e = theEnemies.get(i);
      float distance = dist(location.x, location.y, e.location.x, e.location.y);
     
      if (distance < breadth/2 + e.breadth/2) {
        e.takeDamage(this);
        destroy();
        break;
      }
    }
  }
  
  void destroy() {
    theBullets.remove(this);
  }
  
  
  /**** Update and Display ****/
  void update() {
    travel();
    stillAlive();
    hasHit();
  }
  
  void display() {
    pushMatrix();
    ellipseMode(CENTER);
    fill(colCur);
    ellipse(location.x, location.y, breadth, breadth);
    noFill();
    popMatrix();
  }
  
}

