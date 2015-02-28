

CollisionResolver m;

void setup() {
  size(480, 480);
  m = new CollisionResolver();
}

void draw() {
  background(255);
  m.render();
  fill(0);
  text("Click to shake things up", 20, 30);
}

void mousePressed() {
  m.mPressed();
}


class CollisionResolver {

  SimpleBox box1 = new SimpleBox(200, 100, 80, 0.3);
  SimpleBox box2 = new SimpleBox(100, 200, 40, 0.6);
  SimpleCircle circle1 = new SimpleCircle(280, 240, 60, 0.4);
  SimpleCircle circle2 = new SimpleCircle(340, 140, 30, 0.5);
  float penetration;
  PVector normal;
  float percent = 0.2;
  float slop = 0.01;

  CollisionResolver() {
    normal = new PVector();
  }

  void render() {
    box1.drawShape();
    box2.drawShape();
    circle1.drawShape();
    circle2.drawShape();

    // test for (and resolve) any possible collisions between the 4 shapes
    if (boxesColliding(box1, box2)) {
      resolveCollision(box1, box2);
      positionalCorrection(box1, box2);
    }
    if (circlesColliding(circle1, circle2)) {
      resolveCollision(circle1, circle2);
    }
    if (boxAndCircleColliding(box1, circle1)) {
      resolveCollision(box1, circle1);
      positionalCorrection(box1, circle1);
    }
    if (boxAndCircleColliding(box1, circle2)) {
      resolveCollision(box1, circle2);
      positionalCorrection(box1, circle2);
    }
    if (boxAndCircleColliding(box2, circle1)) {
      resolveCollision(box2, circle1);
      positionalCorrection(box2, circle1);
    }
    if (boxAndCircleColliding(box2, circle2)) {
      resolveCollision(box2, circle2);
      positionalCorrection(box2, circle2);
    }
  }

  boolean circlesColliding(SimpleCircle a, SimpleCircle b) {
    PVector n = PVector.sub(b.pos, a.pos);

    float r = a.r + b.r;
    r *= r;
    
    // exit routine if no collision
    if (n.x*n.x + n.y*n.y > r) {
      return false;
    }

    // avoid using the squareroot until necessary
    float d = n.mag();
    if (d != 0) {
      penetration = r - d;
      // normalize the normal
      normal =  PVector.div(n, d);
      return true;
    }
    else {
      // circles are on top of each other; arbitrary normal
      penetration = a.r;
      normal = new PVector(1, 0);
      return true;
    }
  }

  boolean boxesColliding(SimpleBox a, SimpleBox b) {
    PVector n = PVector.sub(b.pos, a.pos);
    float x_overlap = a.halfW + b.halfW - abs(n.x);

    // use the axis of least penetration to resolve collision
    if (x_overlap > 0) {
      float y_overlap = a.halfW + b.halfW - abs(n.y);

      if (y_overlap > 0) {
        if (x_overlap < y_overlap) {
          if (n.x < 0) {
            normal = new PVector(-1, 0);
          }
          else {
            normal = new PVector(1, 0);
          }
          penetration = x_overlap;
          return true;
        }
        else {
          if (n.y < 0) {
            normal = new PVector(0, -1);
          }
          else {
            normal = new PVector(0, 1);
          }
          penetration = y_overlap;
          return true;
        }
      }
    }
    return false;
  }

  boolean boxAndCircleColliding(SimpleBox a, SimpleCircle b) {
    PVector n = PVector.sub(b.pos, a.pos);

    /* 'closest' points from the box's center
    to the box's closest point to the circle */
    PVector closest = new PVector(n.x, n.y);
    closest.x = constrain(closest.x, -a.halfW, a.halfW);
    closest.y = constrain(closest.y, -a.halfW, a.halfW);

    boolean inside = false;
    // handle the event specially if the circle is inside the box
    if (n.x == closest.x && n.y == closest.y) {
      inside = true;
      if (abs(n.x) > abs(n.y)) {
        if (closest.x > 0) {
          closest.x = a.halfW;
        } 
        else {
          closest.x = -a.halfW;
        }
      }
      else {
        if (closest.y > 0) {
          closest.y = a.halfW;
        } 
        else {
          closest.y = -a.halfW;
        }
      }
    }

    /* normal is the difference between the vector from box's center
    to circle's center and the vector from box's center to box's
    closest point to the circle */
    normal = PVector.sub(n, closest);
    float d = normal.x*normal.x + normal.y*normal.y;
    float r = b.r;

    if (d > r*r && !inside) {
      return false;
    }

    // avoid squareroot until necessary
    d = sqrt(d);
    if (inside) {
      normal.mult(-1);
    }
    penetration = r - d;
    // normalize normal
    normal.div(d);
    return true;
  }

  // resolve between the various possible shape intersections
  void resolveCollision(SimpleBox a, SimpleBox b) {
    resolveCollision(a.vel, b.vel, a.restitution, b.restitution, a.invMass, b.invMass);
  }
  void resolveCollision(SimpleCircle a, SimpleCircle b) {
    resolveCollision(a.vel, b.vel, a.restitution, b.restitution, a.invMass, b.invMass);
  }
  void resolveCollision(SimpleBox a, SimpleCircle b) {
    resolveCollision(a.vel, b.vel, a.restitution, b.restitution, a.invMass, b.invMass);
  }
  void resolveCollision(PVector velA, PVector velB, float restitutionA, float restitutionB, float invMassA, float invMassB) {
    // complex equation at work here using impulse (instantaneous change in velocity)
    PVector rv = PVector.sub(velB, velA);

    float velAlongNormal = rv.dot(normal);
    if (velAlongNormal > 0) {
      return;
    }

    float e = min(restitutionA, restitutionB);

    float j = -(1 + e) * velAlongNormal;
    j /= invMassA + invMassB;

    PVector impulse = PVector.mult(normal, j);
    velA.x = velA.x - invMassA*impulse.x;
    velA.y = velA.y - invMassA*impulse.y;
    velB.x = velB.x + invMassB*impulse.x;
    velB.y = velB.y + invMassB*impulse.y;
  }

  // correct between the various possible shape intersections
  void positionalCorrection(SimpleBox a, SimpleBox b) {
    positionalCorrection(a.pos, b.pos, a.invMass, b.invMass);
  }
  void positionalCorrection(SimpleCircle a, SimpleCircle b) {
    positionalCorrection(a.pos, b.pos, a.invMass, b.invMass);
  }
  void positionalCorrection(SimpleBox a, SimpleCircle b) {
    positionalCorrection(a.pos, b.pos, a.invMass, b.invMass);
  }
  void positionalCorrection(PVector posA, PVector posB, float invMassA, float invMassB) {
    /* this method prevents shapes from sinking into each other
    due to floating-point errors and eliminates jittering by using 'slop' */
    PVector correction = PVector.mult(normal, max(penetration - slop, 0.0) / (invMassA + invMassB) * percent);
    posA.x -= invMassA * correction.x;
    posA.y -= invMassA * correction.y;
    posB.x += invMassB * correction.x;
    posB.y += invMassB * correction.y;
  }

  void mPressed() {
    box1.vel = new PVector(random(-3, 3), random(-3, 3));
    box2.vel = new PVector(random(-3, 3), random(-3, 3));
    circle1.vel = new PVector(random(-3, 3), random(-3, 3));
    circle2.vel = new PVector(random(-3, 3), random(-3, 3));
  }
}


class SimpleBox {

  PVector pos;
  PVector vel;
  PVector accel = new PVector(0, 0.03);
  float[] x, y;
  PVector[] vecs, normal;
  int numSides = 4;
  float r;
  float halfW;
  float invMass;
  float minProj;
  float maxProj;
  float angle = 0;
  // restitution is bounciness, between 0 (not bouncy) and 1 (bouncy)
  float restitution;
  color c;

  SimpleBox(float xCenter, float yCenter, float radius, float rest) {
    pos = new PVector(xCenter, yCenter);
    vel = new PVector(random(-3, 3), random(-3, 3));
    r = radius;
    halfW = r / sqrt(2);
    invMass = 1 / (2*r*r);
    x = new float[numSides];
    y = new float[numSides];
    restitution = rest;

    // one vector for each point; each normal corresponds to one of the sides
    vecs = new PVector[numSides];
    normal = new PVector[numSides];
    for (int i = 0; i < vecs.length; i++) {
      vecs[i] = new PVector();
      normal[i] = new PVector();
    }
    
    c = color(random(255), random(255), random(255));
  }

  void drawShape() {
    vel.add(accel);
    pos.add(vel);
    setPoints();

    // set the vectors from the origin to each point
    for (int i = 0; i < x.length; i++) {
      vecs[i].x = x[i];
      vecs[i].y = y[i];
    }

    // draw the shape
    stroke(0);
    fill(c);
    beginShape();
    for (int i = 0; i < x.length; i++) {
      vertex(x[i], y[i]);
    }
    endShape(CLOSE);

    checkBoundaries();
  }

  void setPoints() {
    /* defining points as real positions on the screen rather than within a rotation matrix
     allows for accurate vector operations */
    for (int i = 0; i < x.length; i++) {
      float currentAngle = i * TWO_PI / numSides;
      x[i] = pos.x + r*cos(currentAngle + PI/numSides + angle);
      y[i] = pos.y + r*sin(currentAngle + PI/numSides + angle);
    }
    // one normal for each edge; given Vector(x, y), its normal is Normal(-y, x)
    for (int i = 0; i < x.length-1; i++) {
      normal[i+1] = new PVector(-y[i+1] + y[i], x[i+1] - x[i]);
    }
    // find the normal for the edge between the first and last points
    normal[0] = new PVector(-y[0] + y[x.length-1], x[0] - x[x.length-1]);
  }

  void setMinMax(PVector axis) {
    /* arbitrarily set the minimum and maximum projections on 'axis' 
     to be the dot-product of the first point's vector against 'axis' */
    minProj = vecs[0].dot(axis);
    maxProj = minProj;
    // loop through the remaining points to determine the ACTUAL min and max
    for (int i = 1; i < vecs.length; i++) {
      float currentProj = vecs[i].dot(axis);
      if (currentProj < minProj) {
        minProj = currentProj;
      }
      if (currentProj > maxProj) {
        maxProj = currentProj;
      }
    }
  }

  void checkBoundaries() {
    if (pos.x - halfW < 0) {
      pos.x = halfW;
      vel.x *= -1;
    }
    if (pos.x + halfW > width) {
      pos.x = width - halfW;
      vel.x *= -1;
    } 
    if (pos.y - halfW < 0) {
      pos.y = halfW;
      vel.y *= -1;
    }
    if (pos.y + halfW > height) {
      pos.y = height - halfW;
      vel.y *= -1;
    }
  }
}


class SimpleCircle {
  
  PVector pos;
  PVector vel;
  PVector accel = new PVector(0, 0.03);
  float r;
  float invMass;
  // restitution is bounciness, between 0 (not bouncy) and 1 (bouncy)
  float restitution;
  color c;
  
  SimpleCircle(float x, float y, float r, float rest) {
    pos = new PVector(x, y);
    vel = new PVector(random(-3, 3), random(-3, 3));
    this.r = r;
    invMass = 1 / (PI * r * r);
    restitution = rest;
    c = color(random(255), random(255), random(255));
  }
  
  void drawShape() {
    vel.add(accel);
    pos.add(vel);
    fill(c);
    stroke(0);
    ellipse(pos.x, pos.y, 2*r, 2*r);
    checkBoundaries();
  }
  
  void checkBoundaries() {
    if (pos.x - r < 0) {
      pos.x = r;
      vel.x *= -1;
    }
   if (pos.x + r > width) {
      pos.x = width - r;
      vel.x *= -1;
    } 
    if (pos.y - r < 0) {
      pos.y = r;
      vel.y *= -1;
    }
   if (pos.y + r > height) {
      pos.y = height - r;
      vel.y *= -1;
    } 
  }
}


