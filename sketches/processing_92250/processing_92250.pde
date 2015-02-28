
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/20140*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/* 
  Curtain (Fabric Simulator)
  Made by BlueThen on February 5th, 2011; updated February 10th and 11th, 2011 and July 18th and 19th, 2011
  To interact, left click and drag, right click to tear, 
               press 'G' to toggle gravity, and press 'R' to reset
  www.bluethen.com
*/

ArrayList particles;

// every particle within this many pixels will be influenced by the cursor
float mouseInfluenceSize = 15; 
// minimum distance for tearing when user is right clicking
float mouseTearSize = 8;
float mouseInfluenceScalar = 1;

// force of gravity is really 9.8, but because of scaling, we use 9.8 * 40 (392)
// (9.8 is too small for a 1 second timestep)
float gravity = 392; 

// Dimensions for our curtain. These are number of particles for each direction, not actual widths and heights
// the true width and height can be calculated by multiplying restingDistances by the curtain dimensions
final int curtainHeight = 56;
final int curtainWidth = 80;
final int yStart = 25; // where will the curtain start on the y axis?
final float restingDistances = 5;
final float stiffnesses = 1;
final float curtainTearSensitivity = 50; // distance the particles have to go before ripping

// These variables are used to keep track of how much time is elapsed between each frame
// they're used in the physics to maintain a certain level of accuracy and consistency
// this program should run the at the same rate whether it's running at 30 FPS or 300,000 FPS
long previousTime;
long currentTime;
// Delta means change. It's actually a triangular symbol, to label variables in equations
// some programmers like to call it elapsedTime, or changeInTime. It's all a matter of preference
// To keep the simulation accurate, we use a fixed time step.
final int fixedDeltaTime = 15;
float fixedDeltaTimeSeconds = (float)fixedDeltaTime / 1000.0;

// the leftOverDeltaTime carries over change in time that isn't accounted for over to the next frame
int leftOverDeltaTime = 0;

// How many times are the constraints solved for per frame:
int constraintAccuracy = 3;

// instructional stuffs:
PFont font;
final int instructionLength = 3000;
final int instructionFade = 300;
void setup () {
  // I find that P2D is the fastest renderer for 2D graphics
  // OPENGL may be faster for some people
  // The default renderer is JAVA2D
  size(640,480, P2D);
  
  // we square the mouseInfluenceSize and mouseTearSize so we don't have to use squareRoot when comparing distances with this.
  mouseInfluenceSize *= mouseInfluenceSize; 
  mouseTearSize *= mouseTearSize;
  
  // create the curtain
  createCurtain();
  
  font = loadFont("LucidaBright-Demi-16.vlw");
  textFont(font);
}

void draw () {
  background(255);
  
  /******** Physics ********/
  // time related stuff
  currentTime = millis();
  // deltaTimeMS: change in time in milliseconds since last frame
  long deltaTimeMS = currentTime - previousTime;
  previousTime = currentTime; // reset previousTime
  // timeStepAmt will be how many of our fixedDeltaTime's can fit in the physics for this frame. 
  int timeStepAmt = (int)((float)(deltaTimeMS + leftOverDeltaTime) / (float)fixedDeltaTime);
  // Here we cap the timeStepAmt to prevent the iteration count from getting too high and exploding
  timeStepAmt = min(timeStepAmt, 5);
  
  leftOverDeltaTime += (int)deltaTimeMS - (timeStepAmt * fixedDeltaTime); // add to the leftOverDeltaTime.

  // If the mouse is pressing, it's influence will be spread out over every iteration in equal parts.
  // This keeps the program from exploding from user interaction if the timeStepAmt gets too high.
  mouseInfluenceScalar = 1.0 / timeStepAmt;
  
  // update physics
  for (int iteration = 1; iteration <= timeStepAmt; iteration++) {
    // solve the constraints multiple times
    // the more it's solved, the more accurate.
    for (int x = 0; x < constraintAccuracy; x++) {
      for (int i = 0; i < particles.size(); i++) {
        Particle particle = (Particle) particles.get(i);
        particle.solveConstraints();
      }
    }
    
    // update each particle's position
    for (int i = 0; i < particles.size(); i++) {
      Particle particle = (Particle) particles.get(i);
      particle.updateInteractions();
      particle.updatePhysics(fixedDeltaTimeSeconds);
    }
  }
  // draw each particle or its links
  for (int i = 0; i < particles.size(); i++) {
    Particle particle = (Particle) particles.get(i);
    particle.draw();
  }
  
  if (millis() < instructionLength)
    drawInstructions();
 
  if (frameCount % 60 == 0)
    println("Frame rate is " + frameRate);
}
void createCurtain () {
  // We use an ArrayList instead of an array so we could add or remove particles at will.
  // not that it isn't possible using an array, it's just more convenient this way
  particles = new ArrayList();
  
  // midWidth: amount to translate the curtain along x-axis for it to be centered
  // (curtainWidth * restingDistances) = curtain's pixel width
  int midWidth = (int) (width/2 - (curtainWidth * restingDistances)/2);
  // Since this our fabric is basically a grid of points, we have two loops
  for (int y = 0; y <= curtainHeight; y++) { // due to the way particles are attached, we need the y loop on the outside
    for (int x = 0; x <= curtainWidth; x++) { 
      Particle particle = new Particle(new PVector(midWidth + x * restingDistances, y * restingDistances + yStart));
      
      // attach to 
      // x - 1  and
      // y - 1  
      // particle attachTo parameters: Particle particle, float restingDistance, float stiffness
      // try disabling the next 2 lines (the if statement and attachTo part) to create a hairy effect
      if (x != 0) 
        particle.attachTo((Particle)(particles.get(particles.size()-1)), restingDistances, stiffnesses);
      // the index for the particles are one dimensions, 
      // so we convert x,y coordinates to 1 dimension using the formula y*width+x  
      if (y != 0)
        particle.attachTo((Particle)(particles.get((y - 1) * (curtainWidth+1) + x)), restingDistances, stiffnesses);
        
/*
      // shearing, presumably. Attaching invisible links diagonally between points can give our cloth stiffness.
      // the stiffer these are, the more our cloth acts like jello. 
      // these are unnecessary for me, so I keep them disabled.
      if ((x != 0) && (y != 0)) 
        particle.attachTo((Particle)(particles.get((y - 1) * (curtainWidth+1) + (x-1))), restingDistances * sqrt(2), 0.1, false);
      if ((x != curtainWidth) && (y != 0))
        particle.attachTo((Particle)(particles.get((y - 1) * (curtainWidth+1) + (x+1))), restingDistances * sqrt(2), 1, true);
*/
      
      // we pin the very top particles to where they are
      if (y == 0)
        particle.pinTo(particle.position);
        
      // add to particle array  
      particles.add(particle);
    }
  }
}

// Controls. The r key resets the curtain, g toggles gravity
void keyPressed() {
  if ((key == 'r') || (key == 'R'))
    createCurtain();
  if ((key == 'g') || (key == 'G'))
    toggleGravity();
}
void toggleGravity () {
  if (gravity != 0)
    gravity = 0;
  else
    gravity = 392;
}

void drawInstructions () {
  float fade = 255 - (((float)millis()-(instructionLength - instructionFade)) / instructionFade) * 255;
  stroke(0, fade);
  fill(255, fade);
  rect(0,0, 200,45);
  fill(0, fade);
  text("'r' : reset", 10, 20);
  text("'g' : toggle gravity", 10, 35);
}

// Credit to: http://www.codeguru.com/forum/showpost.php?p=1913101&postcount=16
float distPointToSegmentSquared (float lineX1, float lineY1, float lineX2, float lineY2, float pointX, float pointY) {
  float vx = lineX1 - pointX;
  float vy = lineY1 - pointY;
  float ux = lineX2 - lineX1;
  float uy = lineY2 - lineY1;
  
  float len = ux*ux + uy*uy;
  float det = (-vx * ux) + (-vy * uy);
  if ((det < 0) || (det > len)) {
    ux = lineX2 - pointX;
    uy = lineY2 - pointY;
    return min(vx*vx+vy*vy, ux*ux+uy*uy);
  }
  
  det = ux*vy - uy*vx;
  return (det*det) / len;
}
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
// the Particle class.
class Particle {
  PVector lastPosition; // for calculating position change (velocity)
  PVector position;
  
  PVector acceleration; 
  PVector colorAcc;
  
  float mass = 1;
  float damping = 20;

  // An ArrayList for links, so we can have as many links as we want to this particle :)
  ArrayList links = new ArrayList();
  
  boolean pinned = false;
  PVector pinLocation = new PVector(0,0);
  
  // Particle constructor
  Particle (PVector pos) {
    position = pos.get();
    lastPosition = pos.get();
    acceleration = new PVector(0,0);
    
  }
  
  // The update function is used to update the physics of the particle.
  // motion is applied, and links are drawn here
  void updatePhysics (float timeStep) { // timeStep should be in elapsed seconds (deltaTime)
    // gravity:
    // f(gravity) = m * g
    PVector fg = new PVector(0, mass * gravity);
    this.applyForce(fg);
    
    
    /* Verlet Integration, WAS using http://archive.gamedev.net/reference/programming/features/verlet/ 
       however, we're using the tradition Velocity Verlet integration, because our timestep is now constant. */
    // velocity = position - lastPosition
    PVector velocity = PVector.sub(position, lastPosition);
    // apply damping: acceleration -= velocity * (damping/mass)
    acceleration.sub(PVector.mult(velocity,damping/mass)); 
    // newPosition = position + velocity + 0.5 * acceleration * deltaTime * deltaTime
    PVector nextPos = PVector.add(PVector.add(position, velocity), PVector.mult(PVector.mult(acceleration, 0.5), timeStep * timeStep));
    
    // reset variables
    lastPosition.set(position);
    position.set(nextPos);
    colorAcc = new PVector(velocity.x * 100, velocity.y * 100);
    acceleration.set(0,0,0);
  } 
  void updateInteractions () {
    // this is where our interaction comes in.
    if (mousePressed) {
      float distanceSquared = distPointToSegmentSquared(pmouseX,pmouseY,mouseX,mouseY,position.x,position.y);
      if (mouseButton == LEFT) {
        if (distanceSquared < mouseInfluenceSize) { // remember mouseInfluenceSize was squared in setup()
          // To change the velocity of our particle, we subtract that change from the lastPosition.
          // When the physics gets integrated (see updatePhysics()), the change is calculated
          // Here, the velocity is set equal to the cursor's velocity
          lastPosition = PVector.sub(position, new PVector((mouseX-pmouseX)*mouseInfluenceScalar, (mouseY-pmouseY)*mouseInfluenceScalar));
        }
      }
      else { // if the right mouse button is clicking, we tear the cloth by removing links
        if (distanceSquared < mouseTearSize) 
          links.clear();
      }
    }
  }

  void draw () {
    // draw the links and points
    stroke(colorAcc.x, colorAcc.y, 50);
    if (links.size() > 0) {
      for (int i = 0; i < links.size(); i++) {
        Link currentLink = (Link) links.get(i);
        currentLink.draw();
      }
    }
    else
      point(position.x, position.y);
  }
  /* Constraints */
  void solveConstraints () {
    /* Link Constraints */
    // Links make sure particles connected to this one is at a set distance away
    for (int i = 0; i < links.size(); i++) {
      Link currentLink = (Link) links.get(i);
      currentLink.constraintSolve();
    }
    
    /* Boundary Constraints */
    // These if statements keep the particles within the screen
    if (position.y < 1)
      position.y = 2 * (1) - position.y;
    if (position.y > height-1)
      position.y = 2 * (height - 1) - position.y;
    if (position.x > width-1)
      position.x = 2 * (width - 1) - position.x;
    if (position.x < 1)
      position.x = 2 * (1) - position.x;
    
    /* Other Constraints */
    // make sure the particle stays in its place if it's pinned
    if (pinned)
      position.set(pinLocation);
  }
  
  // attachTo can be used to create links between this particle and other particles
  void attachTo (Particle P, float restingDist, float stiff) {
    Link lnk = new Link(this, P, restingDist, stiff);
    links.add(lnk);
  }
  void removeLink (Link lnk) {
    links.remove(lnk);
  }  
 
  void applyForce (PVector f) {
    // acceleration = (1/mass) * force
    // or
    // acceleration = force / mass
    acceleration.add(PVector.div(f, mass));
  }
  
  void pinTo (PVector location) {
    pinned = true;
    pinLocation.set(location);
  }
} 


