
// The Link class is used for handling constraints between particles.
class Link {
  float restingDistance;
  float stiffness;
  
  Particle p1;
  Particle p2;
  
  // the scalars are how much "tug" the particles have on each other
  // this takes into account masses and stiffness, and are set in the Link constructor
  float scalarP1;
  float scalarP2;
  
  // if you want this link to be invisible, set this to false
  boolean drawThis = true;
  
  Link (Particle which1, Particle which2, float restingDist, float stiff) {
    p1 = which1; // when you set one object to another, it's pretty much a reference. 
    p2 = which2; // Anything that'll happen to p1 or p2 in here will happen to the paticles in our array
    
    restingDistance = restingDist;
    stiffness = stiff;
    
    // although there are no differences in masses for the curtain, 
    // this opens up possibilities in the future for if we were to have a fabric with particles of different weights
    float im1 = 1 / p1.mass; // inverse mass quantities
    float im2 = 1 / p2.mass;
    scalarP1 = (im1 / (im1 + im2)) * stiffness;
    scalarP2 = (im2 / (im1 + im2)) * stiffness;
  }
  
  void constraintSolve () {
    // calculate the distance between the two particles
    PVector delta = PVector.sub(p1.position, p2.position);  
    float d = sqrt(delta.x * delta.x + delta.y * delta.y);
    float difference = (restingDistance - d) / d;
    
    // if the distance is more than curtainTearSensitivity, the cloth tears
    // it would probably be better if force was calculated, but this works
    if (d > curtainTearSensitivity) 
      p1.removeLink(this);
    
    // P1.position += delta * scalarP1 * difference
    // P2.position -= delta * scalarP2 * difference
    p1.position.add(PVector.mult(delta, scalarP1 * difference));
    p2.position.sub(PVector.mult(delta, scalarP2 * difference));
  }

  void draw () {
    if (drawThis)
      line(p1.position.x, p1.position.y, p2.position.x, p2.position.y);
  }
}

