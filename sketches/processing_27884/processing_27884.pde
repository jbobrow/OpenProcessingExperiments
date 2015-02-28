
/* Circle class */
// Used in the program as our wheels
class Circle {
  /* Other properties */
  PVector position;
  float radius;
  float radiusSquared;
  
  /* Car specific properties */
  boolean wheel = false;
  // how much force the wheel exerts on its attached PointMass
  int force; 
  
  /* Which PointMass is the circle attached to? */
  boolean attachedToPointMass = false;
  PointMass attachedPointMass;
 
  boolean touchingGround;
  /* Constructor */
  Circle (PVector pos, float r) {
    position = pos.get();
    radius = r;
    radiusSquared = r*r;
    // add the circle to the world object so constraint solving is performed
    world.addCircle(this);
  }
  
  /* Constraint solving algorithm */
  // Here we find out if the circle is overlapping the surfacem, and act accordingly.
  void solveConstraints () {
    // At the end of the constraint solve, 
    // if this boolean is set to true and the player is pressing an up/down arrow key, the wheel accelerates
    touchingGround = false;

    // set the wheel's position to it's attached PointMass's position
    position = attachedPointMass.position.get();
    
    // if the wheel is overlapping the top of the screen, we push it down
    if (position.y < radius)
      position.y = 2*(radius) - position.y;

    /* Surface to Wheel collision */
    // Loop through x-coordinates the wheel occupies
    for (int i = (int)-radius; i < (int)radius; i++) {
      // The x coordinate
      int xPos = (int)position.x+i;
      
      // if the surface point at this x coordinate doesn't exist, then we generate it
      if (!surface.containsKey(xPos))
        surfaceGenerate(xPos);
      
      // Set a PVector using the xPos and the surface's height at the position
      PVector groundPoint = new PVector(xPos, (Float)surface.get(xPos));
      
      // avoid(PVector point) is a function inside this class 
      // that solves any collision between the point and this circle
      // it returns a boolean, true for if there was a collision, false if otherwise
      if (this.avoid(groundPoint)) {
        touchingGround = true;
        
        // surface friction is applied here:
        attachedPointMass.lastPosition.x += 0.1 * (attachedPointMass.position.x - attachedPointMass.lastPosition.x);
        attachedPointMass.lastPosition.y += 0.3 * (attachedPointMass.position.y - attachedPointMass.lastPosition.y);
      }
    }

    /* Here the wheel accelerates */
    if ((wheel) && (touchingGround)) {
      if (keys[40]) { // down
        attachedPointMass.applyForce(new PVector(-force, 0));
      }
      else if (keys[38]) { // up
        attachedPointMass.applyForce(new PVector(force, 0));
      }
    }  
    
    // Move the attached PointMass to the circle's position
    attachedPointMass.position = position.get();
  }
  
  /* Avoid */
  // Pushes the circle away from a static point
  // if there's a collision, it returns true
  // otherwise it returns false
  boolean avoid (PVector what) {
    // first we see if the point is inside the circle.
    PVector delta = PVector.sub(what, position);  
    if (radiusSquared > (sq(delta.x) + sq(delta.y))) {
      // find the distance
      float d = sqrt(delta.x * delta.x + delta.y * delta.y);

      // Move the circle based on how much the point overlaps it
      float difference = (radius - d) / d;
      position.sub(PVector.mult(delta, difference));
      return true;
    }
    return false;
  }
  
  /* The circle's draw function */
  void draw () {
    noFill();
    stroke(255);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  /* Set the attached PointMass */
  void attachToPointMass (PointMass p) {
    attachedPointMass = p;
  }
}

