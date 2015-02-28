
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
  }
  
  void nudge(float temperature) {
    PVector origLoc = loc.get();
    
    int tries = 100;
    while (tries > 0) {
      tries -= 1;
      PVector d = getNudgeVector(temperature);
      float dist = 1000.0 * random(temperature) / (rad * rad);
      d.mult(dist);
      
      loc.x = constrain(loc.x + d.x, 0, width);
      loc.y = constrain(loc.y + d.y, 0, height);
      
      if (!anyOverlaps(this, circles)) {
        return;
      }
      else {
        loc = origLoc.get();
      }
    }
  }
  
  PVector getNudgeVector(float temperature) {
    PVector dir = PVector.sub(target, loc);
    float angle = atan2(dir.y, dir.x);
    
    float dAngle = 1.5 * PI * temperature * (random(1) - 0.5);
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
}

