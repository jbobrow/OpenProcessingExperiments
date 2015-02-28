

class Amoeba {
  //GLOBAL_VARIABLES

  float area = 300; //AREA_Of_COLOR_SHIFT

  float distance = 0;
  float R = 0;
  float G = 0;
  float B = 0;

  Vec3D loc = new Vec3D ();
  Vec3D vel = new Vec3D();
  Vec3D acc = new Vec3D();
  Vec3D speed = new Vec3D (random(-1, 1), random(-1, 1), 0); //SPEED_OF_BALLS
  Vec3D cent = new Vec3D(0.5*height, 0.5*width, 0);
  Vec3D colorLoc = new Vec3D(0.5*height, 0.5*width, 0);

  //CONSTRUCTOR 
  Amoeba(Vec3D _loc) {
    loc = _loc;
  }

  //FUNCTIONS
  void run() {
    display();
    move();
    bounce();
    flock();
    followPoint();
    avoidMouse();
    mouseMoved();
    changeClr();
  }

  void changeClr() {

    colorLoc.set(0.5*width, 0.5*width, 0);
    distance = loc.distanceTo(colorLoc);

    R = (map(loc.distanceTo(colorLoc), 0, area, 255, 0));
    G = (map(loc.distanceTo(colorLoc), 0, area, 255, 0));
    B = (map(loc.distanceTo(colorLoc), 0, area, 255, 0));
  }

  void followPoint() {

    Vec3D target = new Vec3D(0.5*width, 0.5*height, 0);

    Vec3D dif = target.sub(loc);

    float distance = dif.magnitude();

    dif.normalize();

    dif.scaleSelf(20/distance);

    acc.addSelf(dif);
  }

  int value = 0;

  void mouseMoved() {
    value = value + 10;
    if (value > 500) {
      value = 0;
    }

    Vec3D target = new Vec3D(0.5*width, 0.5*height, 0);

    Vec3D dif = target.sub(loc);

    float distance = dif.magnitude();
    float d = (value);

    if (distance > 0 && distance <random(10, 50)+(0.1*d)) {
      Vec3D diff = target.sub(loc);
      diff.normalizeTo(1.0/distance);
      acc.subSelf(dif);
      dif.normalize();
    }
  }

  void avoidMouse() {
    Vec3D target = new Vec3D(mouseX, mouseY, 0);

    Vec3D dif = target.sub(loc);
    int value = 0;
    float b = (value);
    float distance = dif.magnitude();
    value = value + 10;
    if (value > 700) {
      value = 0;
    }

    if (distance > 0 && distance < random(10, 70)+(0.1*b)) {
      Vec3D diff = target.sub(loc);
      diff.normalizeTo(1.0/distance);
      acc.subSelf(dif);
      dif.normalize();
    }
  }

  void flock() {

    separate(5);
    cohesion(0.001);
    align(0.1);
  }

  void align(float magnitude) {

    Vec3D steer = new Vec3D();
    int count = 0;

    for (int i = 0; i < amoebaCollection.size();i++) {
      Amoeba other = (Amoeba) amoebaCollection.get(i);

      float distance = loc.distanceTo(other.loc);

      if (distance > 0 && distance < 60) {

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

    for (int i = 0; i < amoebaCollection.size();i++) {
      Amoeba other = (Amoeba) amoebaCollection.get(i);

      float distance = loc.distanceTo(other.loc);

      if (distance > 0 && distance < 60) {

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
  
  void separate(float magnitude) {

    Vec3D steer = new Vec3D();
    int count = 0;

    for (int i = 0; i < amoebaCollection.size();i++) {
      Amoeba other = (Amoeba) amoebaCollection.get(i);

      float distance = loc.distanceTo(other.loc);

      if (distance > 0 && distance < 100) {

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

  void bounce() {

    float distance = loc.distanceTo(cent);
    if (distance > 350) {
      speed.x = speed.x * -1;
    }
    if (distance > 350) {
      speed.y = speed.y * -1;
    }
  }
  
  void move() {

    speed.addSelf(acc);

    speed.limit(2);

    loc.addSelf(speed);

    acc.clear();
  }

  void display() {

    float t = millis()/1000.0f;

    pushMatrix();
    translate(loc.x, loc.y);
    fill(R, G, B);
    strokeWeight(1.5);
    stroke(R*3.5-400, G*2.5-350, B*1.5-250);
    rotate(t*PI*2);
    ellipse(2, 2, 3.8, 3.8);
    popMatrix();
  }
}


