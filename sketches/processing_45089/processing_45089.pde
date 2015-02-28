
// Link class :: handling constraints between particles

class Link {
  float restingDistance;
  float stiffness;

  Particle p1;
  Particle p2;

  float scalarP1;
  float scalarP2;
  // if you want this link to be invisible, set this to false
  boolean drawThis = false;


  // Constructor
  Link (Particle which1, Particle which2, float restingDist, float stiff) {
    p1 = which1; 
    p2 = which2; 

    restingDistance = restingDist;
    stiffness = stiff;

    float im1 = 1 / p1.mass;
    float im2 = 1 / p2.mass;
    scalarP1 = (im1 / (im1 + im2)) * stiffness;
    scalarP2 = (im2 / (im1 + im2)) * stiffness;
  }


  void constraintSolve () {
    PVector delta = PVector.sub(p1.position, p2.position); 
    float d = sqrt(delta.x * delta.x + delta.y * delta.y);
    float difference = (restingDistance - d) / d;

    p1.position.add(PVector.mult(delta, scalarP1 * difference));
    p2.position.sub(PVector.mult(delta, scalarP2 * difference));
  }


  void draw () {
    if (drawThis)
      line(p1.position.x, p1.position.y, p2.position.x, p2.position.y);
  }
}


