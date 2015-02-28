
class Prt {
  
  Vec2D pos, vel;
  int lifeSpan = 0;
  color mainColor;
  
  Prt(int newX, int newY, color mainColor) {
    println("new prt");
    pos = new Vec2D(newX, newY);
    vel = new Vec2D(random(-1,1), random(-1,1));
    this.mainColor = mainColor;
  }
  
  void draw() {
    fill(mainColor);
    noStroke();
    ellipseMode(CENTER);
    ellipse(pos.x, pos.y, 100,100);
  }
  
  void update() {
    pos = pos.add(vel);
    if  (lifeSpan % 100 == 1) {
      int choice = int(random(0,2));
      if (choice == 0) {
        vel = vel.rotate(90);
      } else {
        vel = vel.rotate(-90);
      }
    }
    lifeSpan++;
  }
}

