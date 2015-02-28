
class Circle {
  PVector loc;
  float rad;
  color col;
  PVector target = new PVector(width/2, height/2);

  Circle(float x, float y, float rad) {
    this.loc = new PVector(x, y);
    this.rad = rad;
    this.col = color(220);
  }

  void draw() {
    stroke(col);
    noFill();
    ellipse(loc.x, loc.y, rad, rad);
    //line(loc.x, loc.y, target.x, target.y);
  }

  // returns: how many tries did I take this turn?
  int nudge(float temperature) {

    float maxDistanceForPointMass = 300.0 * distanceFromTarget();

    PVector origLoc = loc.get();
    int maxTries = ceil(100 * temperature * temperature);
    int tries = 0;
    while (tries < maxTries) {
      tries += 1;
      PVector nudge = getNudgeVector(temperature);
      float dist = maxDistanceForPointMass * random(temperature) / (rad * rad);
      nudge.mult(dist);

      loc.x = constrain(origLoc.x + nudge.x, 0, width);
      loc.y = constrain(origLoc.y + nudge.y, 0, height);

      if (!anyOverlaps(this, circles)) {
        return tries;
      }
      else {
        loc = origLoc.get();
      }
    }
    return tries;
  }

  PVector getNudgeVector(float temperature) {
    PVector dir = PVector.sub(target, loc);
    float angle = atan2(dir.y, dir.x);

    float dAngle = 1.2 * PI * temperature * (random(1) - 0.5);
    angle += dAngle;

    return new PVector(cos(angle), sin(angle));
  }

  PVector getRandomNudgeVector(float dist) {
    // Random vector
    float dir = random(TWO_PI);
    float dx = dist * cos(dir);
    float dy = dist * sin(dir);
    return new PVector(dx, dy);
  }

  boolean overlaps(Circle c) {
    return PVector.dist(loc, c.loc) < (rad + c.rad) * 0.5;
  }

  float distanceFromTarget() {
    return PVector.dist(loc, target);
  }
}


