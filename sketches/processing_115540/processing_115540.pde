
ArrayList<Particle> myParticles;
ArrayList<Particle> childParticles;
ArrayList<Spring> mySprings;
ArrayList<Spring> childSprings;
float gravityForcex = 0;
float gravityForcey = .03;
boolean mouseHasChild = false;

void setup() {
  size(900, 400);
  myParticles = new ArrayList<Particle>();
  childParticles = new ArrayList<Particle>();
  fill(50);
  rect(0, 250, width, height);
  fill(255);
 //create parent
  myParticles.add( new Particle(200, 200, 0, .1));
  myParticles.add( new Particle(150, 250, 2, .5));
  myParticles.add( new Particle(250, 250, 4, .5));
  myParticles.add( new Particle(200, 250, 4, .5));
 //create child
  childParticles.add( new Particle(230, 230, 1, .1));
  childParticles.add( new Particle(210, 250, 2, .4));
  childParticles.add( new Particle(250, 250, 4, .4));
  childParticles.add( new Particle(230, 250, 4, .4));

  // stitch the particles together into a mesh.
  mySprings = new ArrayList<Spring>();
  childSprings = new ArrayList<Spring>();

  for (int a = 0; a <4; a +=1) {
    for (int b = a; b <4; b +=1) {
      Particle p = myParticles.get(a);
      Particle q = myParticles.get(b);
      Spring s0 = new Spring (p, q);
      mySprings.add (s0);
      
      p = childParticles.get(a);
      q = childParticles.get(b);
      s0 = new Spring (p, q);
      childSprings.add (s0);
    }
  }
}




int whichPointIsGrabbed = -1;
void mousePressed() {
  //print(whichPointIsGrabbed);
  // find the closest particle
  float maxDist = 50;
  for (int i=0; i<myParticles.size(); i++) {
    float dx = mouseX - myParticles.get(i).px;
    float dy = mouseY - myParticles.get(i).py;
    float dh = sqrt(dx*dx + dy*dy);
    if (dh < maxDist) {
      maxDist = dh;
      whichPointIsGrabbed = i;
      mouseHasChild = true;
    }
  }
}




void dontMoveMouse() {
  if (mouseY >=250) {
    mouseY=250;
  }
}




void draw() {
  dontMoveMouse();
  fill(0);
  rect(0, 0, width, 250);
  fill(50);
  noStroke();
  rect(0, 250, width, height);
  fill(255);
  handleAdult();
  handleChild();
}





void handleChild() {  
  for (int i=0; i<childParticles.size(); i++) {
    childParticles.get(i).bPeriodicBoundaries = true;
    childParticles.get(i).update(); // update all locations
  }

  if (!mousePressed) {
    whichPointIsGrabbed =-1;
    mouseHasChild = false;
  }
  if (mousePressed && whichPointIsGrabbed !=-1) {
    childParticles.get(whichPointIsGrabbed).px = mouseX;
    childParticles.get(whichPointIsGrabbed).py = mouseY;
  }

  for (int i=0; i<childSprings.size(); i++) {
    childSprings.get(i).update(); // draw all springs
    childSprings.get(i);
  }

  for (int i=0; i<childSprings.size(); i++) {
    childSprings.get(i).render(); // draw all springs
  }
  for (int i=0; i<childParticles.size(); i++) {
    Particle ithParticle = childParticles.get(i);

    ithParticle.render(); // draw all particles
    ithParticle.addForce (gravityForcex, gravityForcey);

    addRepulsion(ithParticle, 100);
    if (ithParticle.num == 1) {
      addAttraction(ithParticle, myParticles.get(0).px, myParticles.get(0).py, 300);
    }
  }
}




void handleAdult() {
  for (int i=0; i<myParticles.size(); i++) {
    myParticles.get(i).bPeriodicBoundaries = true;
    myParticles.get(i).update(); // update all locations
  }

  for (int i=0; i<mySprings.size(); i++) {
    mySprings.get(i).update(); // draw all springs
  }

  for (int i=0; i<mySprings.size(); i++) {
    mySprings.get(i).render(); // draw all springs
  }
  for (int i=0; i<myParticles.size(); i++) {
    Particle ithParticle = myParticles.get(i);

    ithParticle.render(); // draw all particles
    ithParticle.addForce (gravityForcex, gravityForcey);

    if (mouseHasChild) {
      addAttraction(ithParticle, mouseX, mouseY, 800.0);
    }
    else {
      addRepulsion(ithParticle, 200.0);
      if (ithParticle.num == 0) {
        addAttraction(ithParticle, childParticles.get(0).px, childParticles.get(0).py, 300);
      }
    }
  }
}




void addRepulsion(Particle ithParticle, float force) {
  float mutualRepulsionAmount = force;
  if (mouseX!=0 && mouseY!= 0) {
    float px = ithParticle.px;
    float py = ithParticle.py;

    float dx = px - mouseX;
    float dy = py - mouseY;
    float dh = sqrt(dx*dx + dy*dy);
    if (dh > 1.0) {

      float componentInX = dx/dh;
      float componentInY = dy/dh;
      float proportionToDistanceSquared = 1.0/(dh*dh);

      float repulsionForcex = mutualRepulsionAmount * componentInX * proportionToDistanceSquared;
      ithParticle.addForce( repulsionForcex, 0); // add in forces
    }
  }
}





void addAttraction(Particle ithParticle, float attractX, float attractY, float force) {
  float mutualAttractionAmount = force;
  if (mouseX!=0 && mouseY!= 0) {
    float px = ithParticle.px;
    float py = ithParticle.py;

    float dx = px - attractX;
    float dy = py - attractY;
    float dh = sqrt(dx*dx + dy*dy);
    if (dh > 1.0) {

      float componentInX = dx/dh;
      float componentInY = dy/dh;
      float proportionToDistanceSquared = 1.0/(dh*dh);

      float attractionForcex = mutualAttractionAmount * componentInX * proportionToDistanceSquared;
      ithParticle.addAttractionForce( attractionForcex, 0); // add in forces
    }
  }
}

//Particle and Spring Classes Modified from code PRovided by Golan Levin 2013

//==========================================================
class Particle {
  float dirEyeX;
  float dirEyeY;
  int num;
  float px;
  float py;
  float vx;
  float vy;
  float damping;
  float mass;
  boolean bLimitVelocities = true;
  boolean bPeriodicBoundaries = false;

  // Constructor for the Particle
  Particle (float x, float y, int n, float m) {
    num = n;
    px = x;
    py = y;
    vx = vy = 0;
    damping = 0.93;
    mass = m;
  }

  // Add a force in. One step of Euler integration.
  void addForce (float fx, float fy) {
    float ax = fx / mass;
    float ay = fy / mass;
    vx += ax;
    vy += ay;
    handleBoundaries();
  }

  void addAttractionForce (float fx, float fy) {
    float ax = fx / mass;
    float ay = fy / mass;
    vx -= ax;
    vy -= ay;
    handleBoundaries();
  }

  // Update the position. Another step of Euler integration.
  void update() {

    vx *= damping;
    vy *= damping;
    limitVelocities();
    handleBoundaries();
    px += vx;
    py += vy;



    if (mouseX != 0) {
      dirEyeX = mouseX-(width-px);
      dirEyeX = dirEyeX/ abs(dirEyeX);
    }

    if (mouseY!=0) {
      dirEyeY = mouseY-(height-py);
      dirEyeY = dirEyeY/ abs(dirEyeY);
    }
  }




  void limitVelocities() {
    if (bLimitVelocities) {
      float speed = sqrt(vx*vx + vy*vy);
      float maxSpeed = 10.0;
      if (speed > maxSpeed) {
        vx *= maxSpeed/speed;
        vy *= maxSpeed/speed;
      }
    }
  }

  void handleBoundaries() {
    if (num == 1 || num == 0) {
      if (py >245) vx= 0;
    }
    if (bPeriodicBoundaries) {
      if (px > width ) px -= 1;
      if (px < 0     ) px += 1;
      if (py > 250   ) py = 250;
      if (py < 0     ) py += 1;
    }

    else {
      if (px > width ) vx = -vx;
      if (px < 0     ) vx = -vx;
      if (py > 250   ) vy = -vy;
      if (py < 0     ) vy = -vy;
    }
  }

  void render() {
    if (num == 0 || num == 1) {
      if (num == 0) ellipse(px, py, 20, 20);
      if (num == 1) ellipse(px, py, 15, 15);
      fill(255, 0, 0);
      stroke(0);
      if (num == 0) ellipse(px+dirEyeX, py+dirEyeY, 4, 4);
      if (num == 1) ellipse(px+dirEyeX, py+dirEyeY, 2, 2);
      fill(255);
      stroke(255);
    }
    else {
      ellipse(px, py, 7, 7);
    }
  }
}


//==========================================================


class Spring {
  Particle p;
  Particle q;
  float restLength;
  float springConstant;

  Spring (Particle p1, Particle p2) {
    p = p1;
    q = p2;

    float dx = p.px - q.px;
    float dy = p.py - q.py;
    restLength = sqrt(dx*dx + dy*dy);//distance between the two
    springConstant = 0.08;
  }

  void update() {
    float dx = p.px - q.px;
    float dy = p.py - q.py;
    float dh = sqrt(dx*dx + dy*dy);//current distance between the two

    if (dh > 1) {
      float distention = dh - restLength;//how do we get the original distance back?
      float restorativeForce = springConstant * distention; // F = -kx
      float fx = (dx/dh) * restorativeForce;//calculates how to get original distance back
      float fy = (dy/dh) * restorativeForce;
      p.addForce (-fx, -fy);//updates to get original distance
      q.addForce ( fx, fy);
    }
  }

  void render() {
    stroke(255);
    line(p.px, p.py, q.px, q.py);
  }
}



