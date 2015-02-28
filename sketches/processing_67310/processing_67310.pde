
class Walker {
  Vec3D loc = new Vec3D(width/2, height/2, 0);
  Vec3D vel = new Vec3D(0, 0, 0);
  Vec3D acc = new Vec3D(0, 0, 0);
  Vec3D dir = new Vec3D(-1, -1, 0);




  //constructor
  Walker (Vec3D _loc) {
    loc  = _loc;
  }

  void run() {
    display();
    update();
    step();
  }




  void display() {
    colorMode(RGB);
    fill(walkerred, 0, 0);
    noStroke();
    ellipse(loc.x, loc.y, walkersize, walkersize);
  }

  void update() {
    loc = loc.add(vel);
  }




  //use vectors to step  in 3d using z coordinate
  void step() {
    // step choice dependant on random throw of set of numbers
    // for 3D need to use 6

    float choice = random (1);
    if (choice < .01) {
      vel.x = random(-levyjump, levyjump);
      vel.y = random(-levyjump, levyjump);
    } 
    else {
      vel.x = random(-1, 1);
      vel.y = random(-1, 1);
    }

    if (( loc.x >width) || (loc.x < 0)) {
      loc.x = width/2;
    }
    if (( loc.y > height) || (loc.y < 0)) {
      loc.y = height/2;
    }
  }
} //--------------------------end class


