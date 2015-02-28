
//Circle class makes a fancy cursor

class Circles {
  
  PVector loc;
  PVector vel;
  float r;
  boolean colliding;

  Circles() {
    loc = new PVector(59, 89);
    vel = new PVector(mouseX, mouseY);
    r = 45;
    colliding = false;
  }

  void display() {
    //circles
    noStroke();
    fill(#211a10);
    ellipse(loc.x, loc.y, 90, 90);
    stroke(#9f9685);
    strokeWeight(2);
    noFill();
    ellipse(loc.x, loc.y, 75, 75);
    stroke(#f0e8d1);
    ellipse(loc.x, loc.y, 68, 68);
    fill(#cabe96);
    noStroke();
    ellipse(loc.x, loc.y, 62, 62);
    fill(#1a1b1d);
    ellipse(loc.x, loc.y, 40, 40);
  }
  
void update() {
    //velocity
    vel = new PVector(mouseX-pmouseX,mouseY-pmouseY);
    vel.mult(0.75);
    loc = new PVector(mouseX, mouseY);
  }
  //Collide function from Daniel Shiffman Thing Class
  void collide(ColorSpot c) {
    float d = PVector.dist(loc, c.loc);
    float sumR = r + c.r;
    // Are they colliding?
    if (!colliding && d < sumR) {
      // Yes, make new velocities!
      colliding = true;
      // Direction of one object another
      PVector n = PVector.sub(c.loc, loc);
      n.normalize();

      // Difference of velocities so that we think of one object as stationary
      PVector u = PVector.sub(vel, c.vel);

      // Separate out components -- one in direction of normal
      PVector un = componentVector(u, n);
      // Other component
      u.sub(un);
      // These are the new velocities plus the velocity of the object we consider as stastionary
      vel = PVector.add(u, c.vel);
      c.vel = PVector.add(un, c.vel);
    } 
    else if (d > sumR) {
      colliding = false;
    }
  }

  PVector componentVector (PVector vector, PVector directionVector) {
    //--! ARGUMENTS: vector, directionVector (2D vectors)
    //--! RETURNS: the component vector of vector in the direction directionVector
    //-- normalize directionVector
    directionVector.normalize();
    directionVector.mult(vector.dot(directionVector));
    return directionVector;
  }
}


