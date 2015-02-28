
class Link {

  float restingDistance; 
  float stiffness;

  Particle p1; 
  Particle p2; 

  float scalarP1; 
  float scalarP2;

  Link(Particle p1, Particle p2, float restingDist, float stiff) {
    this.p1 = p1; 
    this.p2 = p2; 

    restingDistance = restingDist;
    stiffness = stiff;

    float im1 = 1/this.p1.mass;
    float im2 = 1/this.p2.mass;
    scalarP1 = (im1 / (im1 + im2)) * stiffness;
    scalarP2 = (im2 / (im1 + im2)) * stiffness;
  }

  void constraintSolve() {
    PVector delta = PVector.sub(p1.position, p2.position);  
    float d = PVector.dist(p1.position, p2.position);
    float difference = (restingDistance - d) / d;

    p1.position.add(PVector.mult(delta, scalarP1 * difference));
    p2.position.sub(PVector.mult(delta, scalarP2 * difference));
  }

  void draw(int plan) {
    //stroke(255-255*map(p1.position.y, 0, curtainWidth, 0, 1), 57, 174, 200);
    
    switch (plan) {
    case 0:
      line(p1.position.x, p1.position.y, p1.position.z, p2.position.x, p2.position.y, p2.position.z);
      //stroke(100);
      line(0,0,0,0,0,gravity/2);
      break;
    case 1:
      line(p1.position.x, p1.position.y, p2.position.x, p2.position.y);
      break;
    case 2:
      line(p1.position.x, -p1.position.z, p2.position.x, -p2.position.z);
      //stroke(100);
      line(0,0,0,-gravity/2); 
      break;
    }
  }
}


