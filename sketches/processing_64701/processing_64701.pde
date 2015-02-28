
// Values used for different properties of bird behavior
// Cohesion: tendency to move towards the surrounding birds' average position
static float cohesionMin = -0.1f;
static float cohesionMax = 5f;

// Alignment: tendency to move towards the surrounding birds' average velocity
static float alignmentMin = -0.01f;
static float alignmentMax = 0.05f;

// Separation: tendency to move away from the surrounding birds' average position
static float separationMin = 0.25f;
static float separationMax = 5f;

static float separationDistMinSq = 5 * 5;
static float separationDistMaxSq = 15 * 15;

class Bird implements GridObject {  
  PVector position;
  PVector velocity;
  
  PVector[] lastPos;
  
  // by chance, we choose between high and low factors
  float cohesion = cohesionMax;
  float alignment = alignmentMax;
  float separation = separationMax;
  float separationDistSq = separationDistMaxSq;
  
  // constructor
  Bird (PVector pos, PVector vel) {
    lastPos = new PVector[birdTailLen];
    for (int i = 0; i < lastPos.length; i++)
      lastPos[i] = pos.get();
    position = pos.get();
    velocity = vel.get();
  }
  
  // Update position and velocity
  void update (float elapsedTime) {
    // If outside boundary, teleport to opposite side
    if (position.x > width)
      position.x = 1;
    if (position.x < -1)
      position.x = width;
    if (position.y > height)
      position.y = 1;
    if (position.y < -1)
      position.y = height;
    
    // track last positions
    if (lastPos.length > 0) {
      for (int i = lastPos.length-1; i > 0; i--) 
        lastPos[i] = lastPos[i-1].get();
      lastPos[0] = position.get();
    }
    
    // set up variables for flocking algorithm
    PVector cohesionSum = new PVector(0, 0);
    int cohesionCount = 0;
    
    PVector alignmentSum = new PVector(0, 0);
    int alignmentCount = 0;
    
    PVector separationSum = new PVector(0, 0);
    int separationCount = 0;
  
    // Use grid to find birds potentially close enough to interact with
    List<Bird> nearby = grid.nearByObjects(position.x, position.y);
    
    // loop through each nearby Bird
    for (Bird bird : nearby) {
      if (bird != this) {
        PVector other = bird.position;
        
        // find distance squared
        // using sqrt is very costly, so we avoid it when possible
        float xDiff = position.x - other.x;
        float yDiff = position.y - other.y;
        float distSq = xDiff * xDiff + yDiff * yDiff;
        
        // 15 is the minimum distance needed for two birds to interact
        if (distSq < 324) {
          // added their pos to cohesion
          cohesionSum.add(other);
          cohesionCount++;

          // add their velocity to alignment
          alignmentSum.add(bird.velocity);
          alignmentCount++;
          
          // the separation distance will be smaller than cohere distance
          // birds will try and maintain a particular distance from each other
          if (distSq < separationDistSq) {
            separationSum.add(other);
            separationCount++;
            if (distSq < separationDistMinSq) { // avoid being too close to any particular bird
              separationSum.add(PVector.mult(other,12));
              separationCount += 12;
            } // separation minimum
          } // separation dist check
        } // dist check
      } // bird != this check
    } // end of for loop

    // now average the separation, cohesion, and alignment, and factor them into the bird's new direction
    
    PVector acceleration = new PVector(0, 0);
    
    // Cohesion
    if (cohesionCount > 0) {
      // one would normally normalize the desired vector
      // however, for the sake of speed (normalizing uses sqrt), we just use the vector itself
      
      // average the cohesion to find the evarage position of all surrounding bird
      cohesionSum.div(cohesionCount);
      
      // find the vector between the average position and this bird's position
      PVector desired = PVector.sub(position, cohesionSum);

      // multiply it by our cohesion
      desired.mult(cohesion);
      
      if (cohesionCount > 10 && cohesion > 0) // avoid tightly packed groups
        desired.mult(-0.25);

      // subtract it from acceleration
      acceleration.sub(desired);
    }
    
    // Alignment
    if (alignmentCount > 0) {
      alignmentSum.div(alignmentCount); // average out all the velocities
      alignmentSum.mult(alignment); // multiply it by our alignment property
      acceleration.add(alignmentSum); // add it to the acceleration
    }
    
    // Separation
    // uses the exact same algorithm as Cohesion, except steer is subracted from acceleration instead of added
    if (separationCount > 0) {
      separationSum.div(separationCount); // average out the surrounding birds' position
      
      PVector desired = PVector.sub(position, separationSum); // find vector between this bird and the avg position
      desired.mult(separation); // multiply that vector by our separation property

      acceleration.add(desired); // add it to the acceleration
    }

    // Interaction with mouse
    if (mousePressed && mousePressedOnCanvas) {
      // first make sure the bird is close enough
      float mDiffX = mouseX - position.x; 
      float mDiffY = mouseY - position.y;
      float mDistSq = mDiffX * mDiffX + mDiffY * mDiffY;
      if (mDistSq < 100 * 100) {
        float mDist = sqrt(mDistSq);
        // push it away by normalizing the vector from mouse to position, and changing the vector length to 100
        acceleration.sub((mDiffX/mDist) * 100, (mDiffY/mDist) * 100,0);
      }
    }
    // factor in the acceleration
    velocity.add(acceleration);
    
    // velocity.limit(); <- really slow. They calculate the sqrt twice to check and limit the vector
    float velMagSq = velocity.x * velocity.x + velocity.y * velocity.y;
    if (velMagSq > 6400) { // 80 * 80
      float velMag = sqrt(velMagSq); // only sqrt the magnitude when absolutely necessary
      // change velocity's length to 80
      velocity.x = (velocity.x / velMag) * 80;
      velocity.y = (velocity.y / velMag) * 80;
    }
    
    // add the velocity
    position.add(PVector.mult(velocity, elapsedTime));
    
    // update the grid with the new position
    grid.update(this);
  }
  
  // Render
  public void draw() {
    // each bird is colored based on their "personality"
    stroke(((cohesion - cohesionMin) / (cohesionMax - cohesionMin)) * 155 + 100,
           ((alignment - alignmentMin) / (alignmentMax - alignmentMin)) * 155 + 100,
           ((separation - separationMin) / (separationMax - separationMin)) * 155 + 100, 255);
    
    if (lastPos.length > 0) { // if we keep track of the last position(s)
      vertex((int)position.x, (int)position.y); // draw a line from current to first last position
      vertex((int)(lastPos[0].x + 1), (int)(lastPos[0].y + 1)); // we add 1 to ensure that atleast something is drawn.
      
      for (int i = 0; i < lastPos.length-1; i++) {
          float diffX = lastPos[i].x - lastPos[i+1].x;
          float diffY = lastPos[i].y - lastPos[i+1].y;
          float distSq = diffX * diffX + diffY * diffY;
          // check to see if the line is
          //   long enough to even bother drawing
          //   and not stretched across the entire screen because of edge wrapping
          if (distSq > 1.5 && distSq < 2500) {
            vertex((int)lastPos[i].x, (int)lastPos[i].y);
            vertex((int)lastPos[i+1].x, (int)lastPos[i+1].y); 
          }
      }
    }
    else { // we're not keeping track of the last position(s)
      // just draw a point
      vertex((int)position.x, (int)position.y);
      vertex((int)position.x+1, (int)position.y+1);
    }
  }
  
  // getX() and getY() is used by the Grid
  public float getX() { 
    return position.x;
  }
  public float getY() {
    return position.y;
  }
}

