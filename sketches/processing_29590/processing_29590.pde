
class Body extends Vec2D {
  float distance = 0; // used to hold distance from source for Dijstra's Path Algorithm
  Body prev = null; // used to hold previous Body for Dijstra's Path Algorithm
  Planet parent = null;
  float mySize;
  float displaySize;
  int lNum = 0;
  String name;
  boolean animate = false;
  boolean follow = false;
  int animateStart = 0;
  color myColor;
  float ellipseE;
  float ellipseA;
  float ellipseB;
  float ellipseCenter;
  float orbit_speed;
  float pathAngle;

  Body() { 
    super(0, 0);
  } // the compiler needs this for default.  never used explicitly

  Body(String name, float sz) {
    super(0, 0);
    this.name = name;
    mySize = map(sz, 0, SCALE_FACTOR, 0, width/2);
    displaySize = mySize;
  }

  Body(Planet parent, String name, float sz, int lNum) {
    this(name, sz);
    this.parent = parent;
    this.lNum = lNum;
    myColor = RED;  // Lagrange points are displayed as red spheres
  }

  void display() {
    if (animate) {
      if (frameCount - animateStart < 10)
        ++displaySize;
      else if (frameCount - animateStart < 20)
        --displaySize;
      else
        animate = false;
    }
    fill(myColor);
    translate(x, y, 0);
    sphere(displaySize);
    translate(-x, -y, 0);
  }
  Vec2D getProjectedDest(Body dest) {
    for (int t = 1; t < 10000; ++t) {
      Vec2D projectedDest = dest.locationAtTime(t);
      Vec2D projectedVelocity = projectedDest.sub(this).normalize().scale(ROCKET_SPEED);
      if (add(projectedVelocity.scale(t).scale(SIM_SPEED)).distanceTo(projectedDest) < 5)
        return projectedDest;
    }
    return null;
  }

  void setSize(float sz) { 
    displaySize = sz;
  }
  // Get the time that the rocket would take to arrive at dest, starting
  // from this body, taking into account where these two bodies will
  // actually be at startTime, and the movement of the destination body
  int getArrivalTimeITN(Body dest, int startTime) {
    Vec2D realLoc = locationAtTime(startTime);  // Where is this body at startTime?
    for (int t = startTime; t < startTime + 10000; ++t) {
      Vec2D projectedDest = dest.locationAtTime(t);  // Where will dest be at time t?
      // Get the direction of travel for the rocket to get there:
      Vec2D projectedVelocity = projectedDest.sub(realLoc).normalize().scale(ROCKET_SPEED);
      // Simulate travelling for (t - startTime), and see if the rocket ends up at the destination:
      if (realLoc.add(projectedVelocity.scale(t - startTime).scale(SIM_SPEED)).distanceTo(projectedDest) < 5)
        return t;  // Return the total time.
    }
    return Integer.MAX_VALUE;
  }

  boolean mouseOver() {
    return dist(screenX(x, y, 0), screenY(x, y, 0), mouseX, mouseY) < SNAP_DIST*2;
  }

  void animate() {
    animate = true;
    animateStart = frameCount;
  }

  Vec2D locationAtTime(int steps) {
    switch(lNum) {
    case 0: 
      return new Vec2D(ellipseCenter + ellipseA*sin(angleAtTime(steps)), ellipseB*cos(angleAtTime(steps)));
    case 1: 
      return parent.locationAtTime(steps).scale(.95);
    case 2: 
      return parent.locationAtTime(steps).scale(1.15);
    case 3: 
      return parent.locationAtTime(steps).getRotated(PI);
    case 4: 
      return parent.locationAtTime(steps).getRotated(PI/3);
    case 5: 
      return parent.locationAtTime(steps).getRotated(-PI/3);
    default: 
      return null;
    }
  }

  float angleAtTime(int steps) {
    return pathAngle + steps*orbit_speed*SIM_SPEED;
  }

  Vec2D locationAtAngle(float angle) {
    return new Vec2D(ellipseCenter + ellipseA*cos(angle), ellipseB*sin(angle));
  }
}


