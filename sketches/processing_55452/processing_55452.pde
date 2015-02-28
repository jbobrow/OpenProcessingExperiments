
// Declare a class, setting up a class name, which is "Ball"
class Ball {
  // Global Variables, Main variables for the class

  Vec3D loc = new Vec3D (0, 0, 0);
  Vec3D speed = new Vec3D (random(-0.5, 0.5), random(-0.5, 0.5), 0);

  Vec3D acc = new Vec3D();

  Vec3D grav = new Vec3D(0, 0.2, 0);

  // Constructor, Happen just once, starting with the name of the class
  Ball(Vec3D _loc) {

    loc = _loc;  // Passing information to the global variables
  }

  // Functions

  void run() {    // One function that contain all Functionalities
    display();
    move();
    bounce();
    //gravity();

    lineBetween();

    //flock();
  }

  void flock() {

    seperate(3);
    cohesion(0.01);
    //align(0.01);
  }

  void align(float magnitude) {

    Vec3D steer = new Vec3D();
    int count = 0;

    for ( int i = 0; i < ballCollection.size(); i++) {
      Ball other = (Ball) ballCollection.get(i);

      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 30) {

        steer.addSelf(other.speed);
        count++;
      }
    }

    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }

    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void cohesion(float magnitude) {

    Vec3D sum = new Vec3D();
    int count = 0;

    for ( int i = 0; i < ballCollection.size(); i++) {
      Ball other = (Ball) ballCollection.get(i);

      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 30) {

        sum.addSelf(other.loc);
        count++;
      }
    }

    if (count > 0) {
      sum.scaleSelf(1.0/count);
    }

    Vec3D steer = sum.sub(loc);
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void seperate(float magnitude) {

    Vec3D steer = new Vec3D();
    int count = 0;

    for ( int i = 0; i < ballCollection.size(); i++) {
      Ball other = (Ball) ballCollection.get(i);

      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 30) {

        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(1.0/distance);

        steer.addSelf(diff);

        count++;
      }
    }

    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }

    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void lineBetween() {

    //ballCollection

      for ( int i = 0; i < ballCollection.size(); i++) {

      Ball other = (Ball) ballCollection.get(i);

      float distance = loc.distanceTo(other.loc);

      if (distance > 0 && distance < 100) {

        stroke(255, 60);
        strokeWeight(0.1);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
      }
    }
  }

  void gravity() {
    speed.addSelf(grav);
  }


  void bounce() {
    if (loc.x > width) {
      speed.x = speed.x * -1;
    } 
    else if (loc.x < 0) {
      speed.x = speed.x * -1;
    }
    else if (loc.y < 0) {
      speed.y = speed.y * -1;
    }
    else if (loc.y > height) {
      speed.y = speed.y * -1;
    }
  }


  void move() {

    speed.addSelf(acc);

    speed.limit(2); // Maxium Velocity;

    loc.addSelf(speed);

    acc.clear();
  }


  void display() {
    noStroke();
    fill(255, 60);
    ellipse(loc.x, loc.y, 5, 5);
  }
}


