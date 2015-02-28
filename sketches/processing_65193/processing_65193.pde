
/* Circle class */
class Circle implements GridObject {
  /* Which PointMass is the circle attached to? */
  boolean attachedToPointMass = false;
  int attachedPointMass;
  
  float radius;
  float radiusSquared;
  
  float damping = 0.95;
  /* Constructor */
  Circle (float r) {
    //position = pos.get();
    radius = r;
    radiusSquared = r*r;
  }
  /* Constraint solving algorithm */
  // Here we find out if the circle is overlapping the surfacem, and act accordingly.
  void solveConstraints (boolean preserveImpulse) {
    // set the wheel's position to it's attached PointMass's position
    float x = xPos[attachedPointMass];
    float y = yPos[attachedPointMass];
    
    float prevX = lastX[attachedPointMass];
    float prevY = lastY[attachedPointMass];
    
    // Make sure it isn't outside of the screen
    float vx = 0, vy = 0;
    if (preserveImpulse) {
      vx = (prevX - x) * damping;
      vy = (prevY - y) * damping;
    }
    
    if (x - radius < 0) {
      x = radius;
      if (preserveImpulse)
        prevX = x - vx;
    }
    if (x + radius > width) {
      x = 2 * (width - radius) - x;
      if (preserveImpulse)
        prevX = x - vx;
    }
    if (y - radius < 0) {
      y = 2*(radius) - y;
      if (preserveImpulse)
        prevY = y - vy;
    }
    if (y + radius > height) {
      y = 2 * (height - radius) - y;
      if (preserveImpulse)
        prevY = y - vy;
    }
    
    xPos[attachedPointMass] = x;
    yPos[attachedPointMass] = y;
    
    lastX[attachedPointMass] = prevX;
    lastY[attachedPointMass] = prevY;
    
    grid.update(this);
    List nearBy = grid.nearByObjects(x,y);
    for (int i = 0; i < nearBy.size(); i++) {
      Circle nextPM = (Circle) nearBy.get(i);
      avoid(nextPM, preserveImpulse);
    }
  }
  // Checks for a collision between two circles, and solves for it
  // Also creates a link if their velocities are similar.
  void avoid (Circle what, boolean preserveImpulse) {
    if (what != this) {
      float x = xPos[attachedPointMass];
      float y = yPos[attachedPointMass];
      
      float otherX = xPos[what.attachedPointMass];
      float otherY = yPos[what.attachedPointMass];

      float diffX = x - otherX;
      float diffY = y - otherY;

      float diffSquared = diffX * diffX + diffY * diffY;
      
      if (diffSquared <= sq(radius + what.radius)) { // first make sure they're intersecting
        
        // Previous velocity
        float v1x = x - lastX[attachedPointMass];
        float v1y = y - lastY[attachedPointMass];
        float v2x = otherX - lastX[what.attachedPointMass];
        float v2y = otherY - lastY[what.attachedPointMass];
        
        // distance between centers
        float d = sqrt(diffSquared);
        
        // minimum translation distance to push balls apart after intersecting
        float mtdX;
        float mtdY;
        if (d == 0) {
          d = radius + what.radius - 1;
          diffX = radius + what.radius;
          diffY = 0;
        } 
        
        float difference = ((radius + what.radius) - d) / d;
        
        mtdX = diffX * difference;
        mtdY = diffY * difference;
        
        // resolve intersection
        float im1 = 1f / 2f; // inverse mass quantities
        float im2 = 1f / 2f;
        
        // push-pull them based on mass
        xPos[attachedPointMass] += mtdX * (im1 / (im1 + im2));
        yPos[attachedPointMass] += mtdY * (im1 / (im1 + im2));
        
        xPos[what.attachedPointMass] -= mtdX * (im1 / (im1 + im2));
        yPos[what.attachedPointMass] -= mtdY * (im1 / (im1 + im2));
        
        if (preserveImpulse) { // preserve velocities/impulse based on http://codeflow.org/entries/2010/nov/29/verlet-collision-with-impulse-preservation/
          float f1 = (damping * (diffX * v1x + diffY * v1y)) / diffSquared;
          float f2 = (damping * (diffX * v2x + diffY * v2y)) / diffSquared;
        
          v1x += f2 * diffX - f1 * diffX;
          v2x += f1 * diffX - f2 * diffX;
          v1y += f2 * diffY - f1 * diffY;
          v2y += f1 * diffY - f2 * diffY;
          
          
          lastX[attachedPointMass] = xPos[attachedPointMass] - v1x;
          lastY[attachedPointMass] = yPos[attachedPointMass] - v1y;
          
          lastX[what.attachedPointMass] = xPos[what.attachedPointMass] - v2x;
          lastY[what.attachedPointMass] = yPos[what.attachedPointMass] - v2y;
        }
        
        // Now we see if they're moving at similar speeds
        float vX = xPos[attachedPointMass] - lastX[attachedPointMass];
        float vY = yPos[attachedPointMass] - lastY[attachedPointMass];
        float otherVX = xPos[what.attachedPointMass] - lastX[what.attachedPointMass];
        float otherVY = yPos[what.attachedPointMass] - lastY[what.attachedPointMass];
        
        float diffVX = vX - otherVX;
        float diffVY = vY - otherVY;
      
        if (diffVX * diffVX + diffVY * diffVY < 1) {
          
          // make sure we're not already attached
          if (linked(attachedPointMass, what.attachedPointMass))
            return;
          
          // find empty link
          int linkIndex = -1;
          for (int i = 0; i < links[attachedPointMass].length; i++) {
            if (linkStiff[attachedPointMass][i] == 0) {
              linkIndex = i;
              break;
            }
          }
          if (linkIndex == -1)
            return;
          
          // create link at linkIndex
          if (linkIndex >= linkCount[attachedPointMass])
            linkCount[attachedPointMass]++;
          links[attachedPointMass][linkIndex] = what.attachedPointMass;
          linkDist[attachedPointMass][linkIndex] = radius + what.radius + 1;
          linkStiff[attachedPointMass][linkIndex] = stiffness;
        }
      }
    }
  }
  
  /* The circle's draw function */
  void draw () {
    noFill();
    stroke(255);
    ellipse(xPos[attachedPointMass], yPos[attachedPointMass], radius*2, radius*2);
  }
  
  /* Set the attached PointMass */
  void attachToPointMass (int p) {
    attachedPointMass = p;
  }
  
  float getX() {
    return xPos[attachedPointMass];
  }
  float getY() {
    return yPos[attachedPointMass];
  }
  float getLastX() {
    return lastX[attachedPointMass];
  }
  float getLastY() {
    return lastY[attachedPointMass];
  }
}

