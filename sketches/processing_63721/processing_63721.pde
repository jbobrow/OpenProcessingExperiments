
World world;

PImage img;


float mouseInfluenceSize = 100;
float mouseTearSize = 20;
 
int leafCount = 75;


void setup () {
  size(500,500);
  
  img = loadImage("newLeaf.png");

   
  // The "sizes" are squared here, so they don't need to be when compared in the PointMass class
  mouseInfluenceSize *= mouseInfluenceSize;

   
  // Reset function initializes World, the bodies, and the circles in our environment.
  reset();
}

void draw () {

  world.update();

  fill(255, 50);
  noStroke();
  rect(0, 0, width, height);

}
 
// The reset function randomly places bodies and circles around the screen.
void reset () {
  // World class is constructed with 2 parameters: (int deltaTimeLength, int constraintAcc)
  // deltaTimeLength is the timestep used. Smaller would be more accurate.
  // constraintAcc is how many times constraints are solved per timestep.
  world = new World(15, 50);
   
  // Create the Bodies. in the Body constructor, everything is added to the World automatically.
  for (int i = 0; i < leafCount; i++) {
   itsALeaf leaf = new itsALeaf(new PVector(random(width), random(height)), 10);
  
  } 
  

  frameCount = 0;
}
 
// Allow the user to reset everything when they press 'R'.
void keyPressed() {
  if ((key == 'r') || (key == 'R'))
    reset();
}


// World
// All physics and objects, as well as the time step stuff, are handled here.
class World {
  // All of our objects
  ArrayList pointMasses = new ArrayList();
  ArrayList leaves = new ArrayList();
  
  
   
  float gravity = 0;
   
  // These variables are used to keep track of how much time is elapsed between each frame
  // they're used in the physics to maintain a certain level of accuracy and consistency
  // this program should run the at the same rate whether it's running at 30 FPS or 300,000 FPS
  long previousTime;
  long currentTime;
  // Delta means change. It's actually a triangular symbol, to label variables in equations
  // some programmers like to call it elapsedTime, or changeInTime. It's all a matter of preference
  // To keep the simulation accurate, we use a fixed time step
  int fixedDeltaTime;
  float fixedDeltaTimeSeconds;
  // the leftOverDeltaTime carries over change in time that isn't accounted for over to the next frame
  int leftOverDeltaTime;
 
  // How many times constraints are solved each frame
  int constraintAccuracy;
   
  World (int deltaTimeLength, int constraintAcc) {
    fixedDeltaTime = deltaTimeLength;
    fixedDeltaTimeSeconds = (float)fixedDeltaTime / 1000;
    previousTime = millis();
    currentTime = previousTime; 
    constraintAccuracy = constraintAcc;
  }
   
  void update () {
    /* Time related stuff */
    currentTime = millis();
    // deltaTimeMS: change in time in milliseconds since last frame
    long deltaTimeMS = currentTime - previousTime;
    // Reset previousTime.
    previousTime = currentTime;
    // timeStepAmt will be how many of our fixedDeltaTime's can fit in the physics for this frame.
    int timeStepAmt = (int)((float)(deltaTimeMS + leftOverDeltaTime) / (float)fixedDeltaTime);
    // reset leftOverDeltaTime.
    leftOverDeltaTime = (int)deltaTimeMS - (timeStepAmt * fixedDeltaTime);
    float fixedDeltaTimeSeconds = (float)fixedDeltaTime / 1000;
     
    /* Physics */
    for (int iteration = 1; iteration <= timeStepAmt; iteration++) {
      // update each PointMass's position
      for (int i = 0; i < pointMasses.size(); i++) {
        PointMass p = (PointMass) pointMasses.get(i);
        p.updatePhysics(fixedDeltaTimeSeconds);
      }
      // solve the constraints
      for (int x = 0; x < constraintAccuracy; x++) {
        for (int i = 0; i < pointMasses.size(); i++) {
          PointMass p = (PointMass) pointMasses.get(i);
          p.solveConstraints();
        }
        for (int i = 0; i < leaves.size(); i++) {
          Leaf c = (Leaf) leaves.get(i);
          c.solveConstraints(); 
        }
      }
    }
     
    // we use a separate loop for drawing so points and their links don't get drawn more than once
    // (rendering can be a major resource hog if not done efficiently)
    // also, interactions (mouse dragging) is applied
    for (int i = 0; i < pointMasses.size(); i++) {
      PointMass p = (PointMass) pointMasses.get(i);
      p.updateInteractions();
      p.draw();
    }
    for (int i = 0; i < leaves.size(); i++) {
      Leaf c = (Leaf) leaves.get(i);
      c.draw(); 
    }
  }
  // Functions for adding PointMasses and Circles.
  void addLeaf (Leaf c) {
    leaves.add(c); 
  }
  void removeLeaf (Leaf c) {
    leaves.remove(c); 
  }
  void addPointMass (PointMass p) {
    pointMasses.add(p);
  }
  void removePointMass (PointMass p) {
    pointMasses.remove(p);
  }
}


class itsALeaf {

  PointMass oneLeaf;

 Leaf theLeaf;
   
  float leafLength;
  itsALeaf (PVector position, float leafHeight) {
    leafLength = leafHeight / 2;
 
    // PointMasses
    // Here, they're initialized with random positions.
    oneLeaf = new PointMass(new PVector(position.x + random(-5,5),position.y + random(-5,5)));

    // Masses
    // Uses data from http://www.humanics-es.com/ADA304353.pdf
    oneLeaf.mass = 4;

    // Leaf
    theLeaf = new Leaf(oneLeaf.position, leafLength*0.75);
    theLeaf.attachToPointMass(oneLeaf);

    // The PointMasses (and circle!) is added to the world
    world.addLeaf(theLeaf);
    world.addPointMass(oneLeaf);

  }

}


// Could be called "Head" if we wanted, since it's basically all it's used for.
class Leaf {
  PVector position;
  PVector lposition;

 // float radius;
   float r=1;

  // Most of the physics is done in the PointMass the Circle is attached to.
  boolean attachedToPointMass = false;
  PointMass attachedPointMass;
   
  Leaf (PVector pos, float r) {
    position = pos.get();
    lposition=position.get();
  }
  void solveConstraints () {
    // First move the circle to where its attached PointMass is.
    position = attachedPointMass.position.get();

    // Move the PointMass to the corrected position.
    attachedPointMass.position = position.get();
  }
  void draw () {
    
    
    float d=dist(lposition.x, lposition.y,position.x,position.y);
        r=r+d/70.0;

    pushMatrix();
     translate(position.x,position.y);
     rotate(r);
    translate(-position.x,-position.y);

    image(img,position.x+10,position.y,100,70);

  popMatrix();
  
  lposition = position.get();

  }
  

  void attachToPointMass (PointMass p) {
    attachedPointMass = p;
  }
}





// The Link class is used for handling constraints between particles.
class Link {
  float restingDistance;
  float stiffness;
   
  PointMass p1;
  PointMass p2;
   
  // the scalars are how much "tug" the particles have on each other
  // this takes into account masses and stiffness, and are set in the Link constructor
  float scalarP1;
  float scalarP2;
   
  // if you want this link to be invisible, set this to false
  boolean drawThis;
   
}



// PointMass
// http://www.openprocessing.org/visuals/?visualID=20140
class PointMass {
  PVector lastPosition; // for calculating position change (velocity)
  PVector position;
 
  PVector acceleration;
 
  float mass = 1;
  float damping = 20; // friction
 
  // An ArrayList for links, so we can have as many links as we want to this PointMass
  ArrayList links = new ArrayList();
 
  boolean pinned = false;
  PVector pinLocation = new PVector(0,0);
 
  // PointMass constructor
  PointMass (PVector pos) {
    position = pos.get();
    lastPosition = pos.get();
    acceleration = new PVector(0,0);
  }
   
  // The update function is used to update the physics of the particle.
  // motion is applied, and links are drawn here
  void updatePhysics (float timeStep) {
    // gravity:
    // f(gravity) = m * g
    PVector fg = new PVector(0, mass * world.gravity, 0);
    this.applyForce(fg);
 
    /*
       We use Verlet Integration to simulate the physics
       In Verlet Integration, the rule is simple: any change in position will result in a change of velocity
       Therefore, things in motion will stay in motion. If you want to push a PointMass towards a direction,
       just move its position and it'll continue going that way.  
    */
    // velocity = position - lastPosition
    PVector velocity = PVector.sub(position, lastPosition);
    // apply damping: acceleration -= velocity * (damping/mass)
    acceleration.sub(PVector.mult(velocity,damping/mass));
    // newPosition = position + velocity + 0.5 * acceleration * deltaTime * deltaTime
    PVector nextPos = PVector.add(PVector.add(position, velocity), PVector.mult(PVector.mult(acceleration, 0.5), timeStep * timeStep));
    // reset variables
    lastPosition.set(position);
    position.set(nextPos);
    acceleration.set(0,0,0);
 
    // make sure the particle stays in its place if it's pinned
    // (This isn't used for this simulation, but it's there anyways.)
    if (pinned)
      position.set(pinLocation);
  }
  void updateInteractions () {
    // this is where our interaction comes in.
    if (mousePressed) {
      float distanceSquared = sq(mouseX - position.x) + sq(mouseY - position.y);
      if (mouseButton == LEFT || mouseButton== RIGHT) {
        if (distanceSquared < mouseInfluenceSize) { // remember mouseInfluenceSize was squared in setup()
          // move particles towards where the mouse is moving
          // amount to add onto the particle position:
          position.x += (mouseX - pmouseX) * 0.1 * (sqrt(mouseInfluenceSize) - sqrt(distanceSquared)) / sqrt(mouseInfluenceSize);
          position.y += (mouseY - pmouseY) * 0.1 * (sqrt(mouseInfluenceSize) - sqrt(distanceSquared)) / sqrt(mouseInfluenceSize);
         
        }

      }
      
    }
  }
 
  void draw () {
    // draw the links and points
    stroke(0);
    //these are the dust particles
      point(position.x+100,position.y+100);
      point(position.x,position.y+100);
  }
  // here we tell each Link to solve constraints
  void solveConstraints () {
    for (int i = 0; i < links.size(); i++) {
      Link currentLink = (Link) links.get(i);
    }
     
    // These if statements keep the particles within the screen
    if (position.y < 1)
      position.y = 2 - position.y;
    if (position.y > height-1)
      position.y = 2 * (height - 1) - position.y;
    if (position.x > width-1)
      position.x = 2 * (width - 1) - position.x;
    if (position.x < 1)
      position.x = 2 - position.x;
  }
 

  void applyForce (PVector f) {

    acceleration.add(PVector.div(PVector.mult(f,1), mass));
  }
 
  void pinTo (PVector location) {
    pinned = true;
    pinLocation.set(location);
  }
}


