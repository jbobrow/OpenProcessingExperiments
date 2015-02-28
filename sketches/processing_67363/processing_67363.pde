
class Paralel {

  // global var

  Vec3D loc;
  Vec3D acc = new Vec3D (0, 0.5, 0);
  Vec3D vel = new Vec3D (0, 5, 0);

  // constructor

  Paralel(Vec3D _loc) {
    loc = _loc;
  }
  // main funtions

  void run() {
    display();
    update();
    followMouse();
  }

  // -----------additional functions

  void update () {
    vel.addSelf(acc);
    vel.limit(10);
    loc.addSelf(vel);
    acc = new Vec3D(0, 5, 0);
  }

  void display() {
    //background(0,25);
    stroke(255);
    strokeWeight(3);
    line(0, loc.y-150, width, loc.y-150);
    line(0, loc.y-50, width, loc.y-50);
    line(0, loc.y +50, width, loc.y+50);
    line(0, loc.y +150, width, loc.y+150);
  }


  void followMouse() {
    Vec3D target = new Vec3D (mouseX, mouseY, 0);
    Vec3D dif = target.sub(loc);
    float distance = dif.magnitude();
    dif.normalize();
    dif.scaleSelf(10);
    acc.addSelf(dif);
  }

  //----------end of class
}


