
class Agent {

  //------------------------------------------------------- GLOBAL VARIABLES

  Vec3D loc = new Vec3D(0, 0, 0);
  Vec3D speed = new Vec3D(random(-20, 20), random(-20, 20), 0);
  Vec3D acc = new Vec3D();

  ArrayList <Vec3D> tail = new ArrayList <Vec3D> ();
  int Tcount = 0;
  int TLen = 20;
  int TStep = 6;

  //---------------------------angle detection flocking

  float angle;
  float VAngle;
  Vec3D perip = new Vec3D();

  //---------------------------angle detection 

  float tailAngle;
  float tailVAngle;
  Vec3D tailPerip = new Vec3D();

  //---------------------------future location

  Vec3D FutVec;
  Vec3D FutLoc;

  //-------------------------------------------------------CONSTRUCTOR

  Agent(Vec3D _loc) {
    loc = _loc;
  }

  //-------------------------------------------------------FUNCTIONS

  void run() {
    display();
    move();
    bounce();
    drawTail();
    FutLoc();
    tailVAngle = radians(tailViewAngle);

    //Additional behaviour 

    if (appWander) wander();
    seek(seekTarget);
    seek(seekTarget2);
    repel(repeller);
  }

  //--------------------------------------------------------TAIL SEEK

  void tailSeek(ArrayList<Vec3D> field) {

    tailSeparate(tailSepMag, tailSepViewRange, field);
    tailCohesion(tailCohMag, tailCohViewRange, field);
  }

  //------------------------------------------------------------TAIL COHESION

  void tailCohesion(float magnitude, float range, ArrayList <Vec3D> field) {

    Vec3D sum = new Vec3D();
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < field.size();i++) {
      float distance = FutLoc.distanceTo(field.get(i));
      if (distance > 0 && distance < range) {
        tailPerip = (field.get(i)).sub(loc);
        tailAngle = tailPerip.angleBetween(speed, true);
        if (tailAngle < 0) tailAngle += TWO_PI;
        if (abs(tailAngle) < tailVAngle ) {
          sum.addSelf(field.get(i));
          count++;
        }
      }
    }
    if (count>0) {
      sum.scaleSelf(1.0/count);
      steer = sum.sub(loc);
      //steer.normalize();
      steer.scaleSelf(magnitude);
      acc.addSelf(steer);
    }
  }

  //------------------------------------------------------TAIL SEPARATE

  void tailSeparate(float magnitude, float range, ArrayList <Vec3D> field) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < field.size();i++) {
      float distance = FutLoc.distanceTo(field.get(i));
      if (distance > 0 && distance < range) {
        tailPerip = (field.get(i)).sub(loc);
        tailAngle = tailPerip.angleBetween(speed, true);
        if (tailAngle < 0) tailAngle += TWO_PI;
        if (abs(tailAngle) < tailVAngle ) {
          Vec3D diff = loc.sub(field.get(i));
          diff.normalizeTo(1.0/distance);
          steer.addSelf(diff);
          count++;
        }
      }
    }
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    //steer.normalize();
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  //-----------------------------------------------------------------SPACE WRAP / knock its head

  void bounce() {
    if (loc.x > width) {
      //loc.x -=width;
      speed.x = speed.x * -1;
    }
    if (loc.x < 0) {
      //loc.x+=width;
      speed.x = speed.x * -1;
    }
    if (loc.y > height) {
      //loc.y-=height;
      speed.y = speed.y * -1;
    }
    if (loc.y < 0) {
      //loc.y+=height;
      speed.y = speed.y * -1;
    }
  }

  //-----------------------------------------------------------------MOVE

  void move() {

    speed.addSelf(acc);
    speed.limit(maxVel);
    loc.addSelf(speed);
    acc.clear();
  }

  //-----------------------------------------------------------------DISPLAY

  void display() {
    strokeWeight(1.5);
    stroke(0);
    point(loc.x, loc.y, 0);
  }

  //------------------------------------------------------------DRAW TAIL

  void drawTail() {
    Tcount++;
    if (Tcount > TStep) {
      tail.add(loc.copy());
      Tcount = 0;
    }
    if (tail.size() > TLen) {
      tail.remove(0);
    }

    for ( int i = 1; i < tail.size();i++ ) {    

      Vec3D a = tail.get(i-1);
      Vec3D b = tail.get(i);
      if (a.distanceTo(b) < 30) {
        stroke(0, 0, 0, map(i, 0, tail.size(), 0, 100));
        strokeWeight(map(i, 0, tail.size(), 0.5, 1));
        line(a.x, a.y, b.x, b.y);
      }
    }
  }

  //--------------------------------------------------------PREDICT FUT LOC / magician
  void FutLoc() {

    FutVec = speed.copy();
    FutVec.normalize();
    FutVec.scaleSelf(futLocMag);
    FutLoc = FutVec.addSelf(loc);
    stroke(50, 100);
    strokeWeight(0.5);
    if (futPrev) line(loc.x, loc.y, FutLoc.x, FutLoc.y);
  }

  //-----------------------------------------------------------WANDER / drunkenness

  void wander() {
    float wanderR = 50;
    float wanderD = 80;
    float change = 5;
    wandertheta += random(-change, change);
    Vec3D circleLoc = speed.copy();
    circleLoc.normalize();
    circleLoc.scaleSelf(wanderD);
    circleLoc.addSelf(loc); 
    Vec3D circleOffSet = new Vec3D(wanderR*cos(wandertheta), wanderR*sin(wandertheta), 0);
    Vec3D target = circleLoc.addSelf(circleOffSet);
    Vec3D steer = target.sub(loc);
    steer.normalize();
    steer.scaleSelf(1);
    acc.addSelf(steer);
  }

  //-----------------------------------SEEK TARGET

  void seek(Vec3D target) {

    float distanceT = target.distanceTo(loc);

    if (distanceT > 0 && distanceT < 800) {

      Vec3D desired = target.sub(loc);       
      desired.normalize();
      desired.scaleSelf(att);
      Vec3D steerTarget = desired.sub(speed);
      steerTarget.limit(maxAttract);
      acc.addSelf(steerTarget);
    }

  }

  //-----------------------------------REPEL TARGET

  void repel(Vec3D target) {

    float distanceT = target.distanceTo(loc);

    if (distanceT > 0 && distanceT < 150) {

      Vec3D desired = target.sub(loc);       
      desired.normalize();
      desired.scaleSelf(rep);
      Vec3D steerTarget = desired.sub(speed);
      steerTarget.limit(maxRepel);
      steerTarget.scaleSelf(-1);
      acc.addSelf(steerTarget);
    }

  }
}


