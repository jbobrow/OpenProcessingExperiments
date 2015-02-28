
/*
 * Diffusion Limited Aggregation in 3D
 * Based on work by Paul Bourke
 * http://local.wasp.uwa.edu.au/~pbourke/fractals/dla3d/
 */

static final float PARTICLE_RADIUS = 5f;
static final float STICKINESS = .9f;
static final float SIZE_FACTOR = .25f;
ArrayList points = new ArrayList();
float currentRadius = 15f;
Wanderer wanderer;
long lastTime = System.currentTimeMillis();
float currentRotation = 0;

void setup() {
  size(640, 480, P3D);
  frameRate(30);
  smooth();
  initDLA();
}

void draw() {

  background(10);
  translate(width / 2, height / 2, 250 - currentRotation);

  long curTime = System.currentTimeMillis();
  float deltaTime = (curTime - lastTime) / 1000f;
  lastTime = curTime;
  if ( deltaTime > .15f ) {
    initDLA();    // It's taking too long to draw, start again...
  }
  currentRotation += deltaTime * .25f;
  rotateY(currentRotation);

  for (int i = 0; i < 100; i++) {
    wanderer.wander(currentRadius);
    checkCollisions(wanderer);   
  }

  resetRenderScene();
  
  for( int i=0; i < points.size(); i++ ) {
    DLAParticle part = (DLAParticle)points.get(i);
    renderPath(part);
  }

}

void keyPressed() {
  if ( key == ' ' ) {
    initDLA();
  }
}

public void initDLA() {
  currentRadius = 15f;
  points.clear();
  points.add(new DLAParticle(new PVector(0, 0, 0)));       // initial seed
  wanderer = new Wanderer(pointOnSphere(currentRadius));
}


public void calcParticleSizes(DLAParticle particle) {
  float curWeight = SIZE_FACTOR;
  DLAParticle curParticle = particle;
  if (curWeight > curParticle.size) {
    curParticle.size = curWeight;
  }
  while (curParticle.parent != null) {
    curParticle = curParticle.parent;
    curWeight += SIZE_FACTOR;
    if (curWeight > curParticle.size) {
      curParticle.size = curWeight;
    }
  }
}

public void resetRenderScene() {
  for( int i=0; i < points.size(); i++ ) {
    DLAParticle particle = (DLAParticle)points.get(i);
    particle.rendered = false;
  }
}

public void renderPath(DLAParticle particle) {
  ArrayList path = new ArrayList();

  // build the path from this particle to it's root
  DLAParticle curParticle = particle;
  path.add(curParticle);
  while (curParticle.parent != null) {
    curParticle = curParticle.parent;
    path.add(curParticle);
  }
  
  // Need at least 4 points for curveVertex
  if (path.size() >= 4) {
    // Trim down the path to only particles that haven't been rendered yet
    ArrayList renderPath = new ArrayList();
    for (int i = 0; i < path.size(); i++) {
      DLAParticle part = (DLAParticle)path.get(i);
      part.rendered = true;
      renderPath.add(part);
      if (i >= 4 && part.rendered == true) {
        break;
      }
    }

    // Let draw 'em
    stroke(200, 0, 0, 40);
    noFill();            
    beginShape();
    DLAParticle p1 = (DLAParticle)renderPath.get(0);
    strokeWeight(p1.size);
    curveVertex(p1.pos.x, p1.pos.y, p1.pos.z);
    for( int i=0; i < renderPath.size(); i++ ) {
      DLAParticle p = (DLAParticle)renderPath.get(i);
      strokeWeight(p.size);
      curveVertex(p.pos.x, p.pos.y, p.pos.z);
      p1 = p;
    }
    strokeWeight(p1.size);
    curveVertex(p1.pos.x, p1.pos.y, p1.pos.z);
    endShape();
  }
}


public PVector pointOnSphere(float radius) {
  float z = random(-radius, radius);
  float radius_sq = radius * radius;
  float zsq = z * z;
  float theta = random(0, TWO_PI);
  float x = sqrt(radius_sq - zsq) * cos(theta);
  float y = sqrt(radius_sq - zsq) * sin(theta);
  PVector v = new PVector(x, y, z);
  return v;
}

public void checkCollisions(Wanderer w) {

  for( int i=0; i < points.size(); i++ ) {
    DLAParticle part = (DLAParticle)points.get(i);
    PVector pnt = part.pos;
    float distance = w.v.dist(pnt);
    if (distance < PARTICLE_RADIUS + PARTICLE_RADIUS && random(1) < STICKINESS) {
      DLAParticle newp = new DLAParticle(part, new PVector(w.v.x, w.v.y, w.v.z));
      points.add(newp);
      calcParticleSizes(newp);
      float distFromOrigin = w.v.dist(new PVector(0, 0, 0));
      if (distFromOrigin > currentRadius - PARTICLE_RADIUS) {
        currentRadius = distFromOrigin + PARTICLE_RADIUS;
      }
      w.v = pointOnSphere(currentRadius);
      break;
    }
  }
}

class Wanderer {

  public PVector v;

  public Wanderer(PVector v) {
    this.v = v;
  }

  // random brownian motion, constrained by current radius
  public void wander(float maxDistance) {
    PVector dir = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
    dir.normalize();
    dir.mult(PARTICLE_RADIUS);
    v.add(dir);
    if (v.dist(new PVector(0, 0, 0)) > maxDistance + 5) {   // we're outside the sphere, change direction
      dir.mult(-1);
      v.add(dir);
    }
  }
}

class DLAParticle {

  public PVector pos;
  public DLAParticle parent = null;
  public float size = 0f;
  public boolean rendered = false;

  public DLAParticle(PVector pos) {
    this.pos = pos;
  }

  public DLAParticle(DLAParticle parent, PVector pos) {
    this.parent = parent;
    this.pos = pos;
  }
}



