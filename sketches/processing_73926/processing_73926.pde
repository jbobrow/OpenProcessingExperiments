
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;
import toxi.geom.*;

// Reference to physics world
VerletPhysics2D physics;

ArrayList springs;
ArrayList behaviors;
int count = 1;
int nTrunks = 1;
int nBranches = 1;

float startLen = 80;
float currentLen = 0;

float springStrength = .3;
float branchScale = .75;

float repelRadius = startLen-20;
float repelStrength = -6;
float jitter = .01;

float numSec = 5;
float numSteps = 6.0;
float m;
float p = 0;
float s = 0;
float elapseTotal;
float elapsePartial;
float stepMillis = numSec*1000/numSteps;


void setup() {
  size(400, 600);
  smooth();

  //Initialize arraylists

  springs = new ArrayList();
  behaviors = new ArrayList();
  // Initialize the physics
  physics=new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.6)));
}

void draw() {
  physics.update();

  background(255);
  m = millis();
  elapseTotal = m-s;
  elapsePartial = m-p;

  if (elapseTotal > numSec*1000) {
    for (int i = 0; i < behaviors.size(); i++) {
      AttractionBehavior a = (AttractionBehavior)behaviors.get(i);
      a.setStrength(-90);
      a.setJitter(0);
    }
  } 
  else if (elapsePartial > stepMillis) {
    addLevel(count, nTrunks, nBranches, radians(90), branchScale);
    nTrunks *= count;
    count += 1;
    nBranches = nTrunks * count;
    p = millis();
  }

  // Display springs
  for (int i = 0; i<springs.size(); i++) {
    Spring s = (Spring) springs.get(i);
    s.display();
  }
} 

void keyPressed() {
  if (key == 'a') {
    println("keypressed");
    addLevel(count, nTrunks, nBranches, random(-HALF_PI,HALF_PI),branchScale);
    nTrunks *= count;
    count += 1;
    nBranches = nTrunks * count;
    println("count= " + count);
    println("nTrunks= " + nTrunks);
    println("nBranches= " + nBranches);
  } 
  else if (key == 's') {

    println("number of Springs= " + springs.size());
  }
  else if (key == 'c' && behaviors.size()>1) {
    for (int i = 0; i < behaviors.size(); i++) {
      AttractionBehavior a = (AttractionBehavior)behaviors.get(i);
      a.setStrength(-70);
      a.setJitter(0);
    }
  } 

}



void addLevel(int count, int nTrunks, int nBranches, float theta, float branchScale) {
  if (count == 1) {
    // Make two particles
    Particle p1 = new Particle(width/2, 20);
    Vec2D origin = new Vec2D(p1.x, p1.y);
    Particle p2 = new Particle(width/2, 180);
    // Lock one in place
    p1.lock();

    // Make a spring connecting both Particles
    Spring spring1=new Spring(p1, p2, startLen, springStrength, startLen );
    // add to spring arraylist for future refrence
    springs.add(spring1);
    // add repeling behavior for end of spring
    AttractionBehavior a = new AttractionBehavior(p2, repelRadius, repelStrength, jitter);
    physics.addBehavior(a);
    behaviors.add(a);

    //add into the physics world
    physics.addParticle(p1);
    physics.addParticle(p2);
    physics.addSpring(spring1);
  } 
  else {
    int indexToStopAt = springs.size()-1-nTrunks;
    int numBranches = count*(count+1);
    for (int i = springs.size()-1; i > indexToStopAt; i--) { 
      Spring s = (Spring) springs.get(i);
      addBranches(s, count, theta, branchScale);
    }
  }
}

void addBranches(Spring spring, int count, float theta, float branchScale) {

  Vec3D start = new Vec3D(spring.a.x, spring.a.y, 0);
  Vec3D end = new Vec3D(spring.b.x, spring.b.y, 0);
  Vec3D trunk = start.sub(end);
  float len = startLen*pow(branchScale, count);
  repelRadius = len;
  for (int i = 0; i < count; i++) {
    Vec3D branch = trunk.scale(branchScale);
    branch.rotateZ(random(PI));
    branch.addSelf(end);

    Particle pStart = (Particle)spring.b;
    Particle pEnd = new Particle(end.x, end.y);

    // add repeling behavior!!!
    AttractionBehavior a = new AttractionBehavior(pEnd, repelRadius, repelStrength, jitter);
    physics.addBehavior(a);
    behaviors.add(a);

    //add spring!!
    Spring springNew = new Spring(pStart, pEnd, len, springStrength, len);

    springs.add(springNew);

    physics.addParticle(pEnd);
    physics.addSpring(springNew);
  }
}


