
/* Blob Family - v1.0.0 - 2014/11/21
   - by Future Data Lab | www.futuredatalab.com */

final int RIGID = 1; // Rigid constraint
final int SEMI_RIGID = 2; // Semi-Rigid constraint

float t_size = 0.03; // Time step
float f_friction = 0.5; // Friction force
float f_max = 5000.0; // Max force
float f_jump = -60.0; // Jumping force

int relax_iter = 4; // Relaxation iteration
int[] metabox; // Metaball bounding box
int screen_size; // Cache screen size
int ground_h; // Ground height

boolean DEBUG = false; // Enable debug view
boolean show_fps = false; // Toggle FPS
boolean enable_metaball = true; // Toggle metaballs
boolean enable_gravity = true; // Toggle gravity
boolean enable_ai = false; // Toggle blob AI
boolean follow_m = false; // Blob will follow mouse pointer
boolean[] keys = new boolean[4]; // Check key press
boolean d_lock1 = false; // DEBUG: lock first particle

PVector gravity = new PVector(0, 80.0, 0); // Gravity vector
ArrayList<ParticleSystem> blobs;

void setup()
{
  size(600, 400);
  background(255, 255, 255);
  screen_size = width*height;
  ground_h = floor(height*0.2);
  metabox = new int[screen_size];
  blobs = new ArrayList<ParticleSystem>();
  
  initBlobs();
}

void draw()
{
  background(255, 255, 255);
  stroke(#555555);
  fill(#c4bd96);
  rect(0, height - ground_h, width, ground_h);

  // Reset metaball bounding box
  for (int i = 0; i < screen_size; i++) {
    metabox[i] = 0;
  }
  
  int bsize = blobs.size();
  for (int i = 0; i < bsize; i++) {
    ParticleSystem ps = blobs.get(i);
    ps.update();
    ps.render();
  }
  
  // Render metaball
  if (enable_metaball) metaBall();
  
  // Display framerate
  if (DEBUG || show_fps) {
    fill(0, 102, 153);
    text(frameRate, 10, 25);
    fill(0, 0, 0);
  }
}

// Render blob using metaball 
void metaBall() {
  loadPixels();
  // Render blob metaball for each blob
  int bsize = blobs.size();
  for (int i = 0; i < bsize; i++) {
    ParticleSystem ps = blobs.get(i);
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        int index = x + y*width;
        // If within metaball bounding box, draw blob
        if (metabox[index] == 1 && !DEBUG) {
          float sum = 0.0;
                      
          int psize = ps.particles.size();
          // Render particles
          for (int j = 0; j < psize; j++) {
            Particle p = ps.particles.get(j);
      
            float xx = p.pos.x - x;
            float yy = p.pos.y - y;
      
            //sum += p.rad / sqrt(xx * xx + yy * yy); // Optimization: Get rid of the sqrt()
            sum += p.rad*ps.mb_size / (xx * xx + yy * yy);
          }
          
          //float col = 255 - sum*sum*sum/metaball_band;
          float col = 255 - sum;
          color argb = pixels[index];
          int a = (argb >> 24) & 0xFF;
          int r = (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
          int g = (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
          int b = argb & 0xFF;          // Faster way of getting blue(argb)
          if (sum > ps.mb_thresh) pixels[index] = color(0.8*r + col, 0.8*g + col, 0.8*b + col);
          else if (sum < ps.mb_thresh && sum > ps.mb_thresh - 30) pixels[index] = color(150, 150, 150); // Grey border
        }
      }
    }
  }
  updatePixels();
}

// Initialize some blobs
void initBlobs()
{
  enable_ai = true;
  addVerletBlob(10, 20, 30, 40, 10, width/2, height/2, 1, 140, 300, 300); // Big verlet
  addBracedBlob(10, 10, 15, 18, 10, width/2, height/2, 1, 40, 300, 300); // Small braced
}

// Some math functions
PVector vmin(PVector v1, PVector v2) { return new PVector(min(v1.x, v2.x), min(v1.y, v2.y), min(v1.z, v2.z)); }
PVector vmax(PVector v1, PVector v2) { return new PVector(max(v1.x, v2.x), max(v1.y, v2.y), max(v1.z, v2.z)); }
float dist2(PVector v1, PVector v2) { return ((v1.x - v2.x)*(v1.x - v2.x) + (v1.y - v2.y)*(v1.y - v2.y) + (v1.z - v2.z)*(v1.z - v2.z)); }


class Constraint
{
  Particle p1; // Connected particle 1
  Particle p2; // Connected particle 2
  int type; // Type of constraint
  
  // For semi-rigid constraint
  float min; // Compressed length
  float max; // Stretched length
  float mid; // Relaxed length
  float kspring; // Spring elasticity
  
  color d_color; // Debug constraint color
  PVector d_pt; // Debug constraint point
  
  Constraint() {}

  void initRigid(Particle particle1, Particle particle2, float len) {
    p1 = particle1;
    p2 = particle2;
    type = 1;
    min = len;
    mid = len;
    max = len;
    kspring = 1.0;
    d_color = color(0, 0, 0);
    d_pt = new PVector(0, 0, 0);
  }

  void initSemiRigid(Particle particle1, Particle particle2, float mn, float md, float mx, float ks) {
    p1 = particle1;
    p2 = particle2;
    type = 2;
    min = mn;
    mid = md;
    max = mx;
    kspring = ks;
    d_color = color(0, 0, 0);
    d_pt = new PVector(0, 0, 0);
  }

  PVector getForce(Particle p) {
    PVector forcetotal = new PVector();
    switch(type) {
      case RIGID: { forcetotal = getRigidForce(p); break; }
      case SEMI_RIGID: { forcetotal = getSemiRigidForce(p); break; }
      default: { forcetotal.set(0, 0, 0); }      
    }
    return forcetotal;    
  }
  
  void satisfyConstraint() {
    switch(type) {
      case RIGID: { satisfyRigid(); break; }
      case SEMI_RIGID: { satisfySemiRigid(); break; }
      default: { break; }      
    }
  }

  PVector getRigidForce(Particle p) {
     // Rigid constraint exerts no force
    return new PVector(0, 0, 0);
  }
  
  PVector getSemiRigidForce(Particle p) {
    // Determine current particle
    Particle neighbor;
    if (p == p1) neighbor = p2;
    else neighbor = p1;
    // Obeys Hook's law: f = k * (x - x0)
    // Vector from neighbor to self
    PVector it2me = PVector.sub(p.pos, neighbor.pos);
    // Vector from neighbor to rest position
    it2me.normalize();
    PVector it2mid = PVector.add(neighbor.pos, PVector.mult(it2me, mid));
    // Vector from current postition to rest position
    PVector me2mid = PVector.sub(it2mid, p.pos);
    // Apply spring force
    me2mid.mult(kspring);
    return me2mid;
  }
  
  void satisfyRigid() {
    // Vector from neighbor to self
    PVector it2me = PVector.sub(p1.pos, p2.pos);
    // Length of spring
    float dist = it2me.mag();
    // Constraint to rigid length
    if (dist != mid) {
      it2me.normalize();
      float diff = dist - mid;
      // Apply constraint
      p1.pos.set(PVector.sub(p1.pos, PVector.div(PVector.mult(it2me, diff), 2.0)));
      p2.pos.set(PVector.add(p2.pos, PVector.div(PVector.mult(it2me, diff), 2.0)));
    }
    // Debug color and point
    if (DEBUG) {
      d_color = color(255, 0, 255);
      d_pt.set(PVector.div(PVector.add(p1.pos, p2.pos), 2.0));
    }
  }
  
  void satisfySemiRigid() {
    // Vector from neighbor to self
    PVector it2me = PVector.sub(p1.pos, p2.pos);
    // Length of spring
    float dist = it2me.mag();
    // Calculate constraint debug color
    if (DEBUG) {
      float delta = dist - mid;
      float r = (delta < 0) ? map(delta, mid, (min - mid), 0, 255) : 0; // Less than rest length is red
      float b = (delta > 0) ? map(delta, mid, (max - mid), 0, 255) : 0; // More than rest length is blue
      d_color = color(r, 0, b);
    }
    // Constraint to min/max
    if (dist < min || dist > max) {
      if (dist < min) dist = min;
      if (dist > max) dist = max;
      // Scale to length
      it2me.normalize();
      it2me = PVector.mult(it2me, dist);
      // Find midpoint
      PVector midpt = PVector.div(PVector.add(p1.pos, p2.pos), 2.0);
      // Apply constraint
      p1.pos.set(PVector.add(midpt, PVector.div(it2me, 2.0)));
      p2.pos.set(PVector.sub(midpt, PVector.div(it2me, 2.0)));
    }
    // Debug point
    if (DEBUG) d_pt.set(PVector.div(PVector.add(p1.pos, p2.pos), 2.0));
  }
}

void mousePressed() {
  // Get mouse position
  PVector m = new PVector(mouseX, mouseY);  
  // Look for a particle the mouse is in
  int bsize = blobs.size();
  for (int i = 0; i < bsize; i++) {
    ParticleSystem ps = (ParticleSystem) blobs.get(i);    
    int psize = ps.particles.size();
    for (int j = 0; j < psize; j++) {
      Particle p = (Particle) ps.particles.get(j);      
      // If the mouse is close to the particle
      if (dist2(p.pos, m) < sq(p.mass + 20)) {
        if (mouseButton == LEFT) p.drag = true;
        break; // Break out of the loop because we found our particle
      }
    }
  }
  // When mouse is pressed, blob will move toward the mouse
  if (!follow_m) follow_m = true;
}

void mouseReleased() {
  // User is no-longer dragging
  int bsize = blobs.size();
  for (int i = 0; i < bsize; i++) {
    ParticleSystem ps = (ParticleSystem) blobs.get(i);
    int psize = ps.particles.size();
    for (int j = 0; j < psize; j++) {
      Particle p = (Particle) ps.particles.get(j);
      if (p.drag) {
        p.drag = false;
        break;
      }
    }
  }
  follow_m = false;
}

void keyPressed() {
  // Movements
       if (key == CODED && keyCode == UP) keys[0] = true;
  else if (key == CODED && keyCode == LEFT) keys[1] = true;
  else if (key == CODED && keyCode == DOWN) keys[2] = true;
  else if (key == CODED && keyCode == RIGHT) keys[3] = true;
  
  if (key == CODED && enable_ai) enable_ai = !enable_ai; // User move overrides AI
  
  if (key == 'g') enable_gravity = !enable_gravity; // Enable gravity
  if (key == 'l') d_lock1 = !d_lock1; // Lock first particle
  if (key == 'd') DEBUG = !DEBUG; // Debug view
  if (key == 'm') enable_metaball = !enable_metaball; // Lock first particle
  if (key == 'a') for (int i = 0; i < blobs.size(); i++) { blobs.get(i).mb_size -= 10; }
  if (key == 's') for (int i = 0; i < blobs.size(); i++) { blobs.get(i).mb_size += 10; }
  if (key == 'z') for (int i = 0; i < blobs.size(); i++) { blobs.get(i).mb_thresh -= 10; }
  if (key == 'x') for (int i = 0; i < blobs.size(); i++) { blobs.get(i).mb_thresh += 10; }
  if (key == 'f') show_fps = !show_fps;
  if (key == 'q') enable_ai = !enable_ai;
  if (key == ' ') blobs = new ArrayList(); // Reset blobs
  
  if (key == '1') addVerletBlob(10, 10, 15, 20, 10, width/2, height/2, 1, 40, 300, 300); // Small verlet
  if (key == '2') addVerletBlob(10, 20, 30, 40, 10, width/2, height/2, 1, 140, 300, 300); // Big verlet
  if (key == '3') addBracedBlob(10, 10, 15, 18, 10, width/2, height/2, 1, 40, 300, 300); // Small braced
  if (key == '4') addBracedBlob(10, 20, 30, 35, 10, width/2, height/2, 1, 140, 300, 300); // Big braced
  if (key == '5') addTarBlob(10, 5, 20, 40, 10, width/2, height/2, 1, 60, 300, 300); // Small tar
  if (key == '6') addTarBlob(10, 10, 40, 80, 10, width/2, height/2, 1, 240, 300, 300); // Medium tar
  if (key == '7') { enable_metaball = false; addVerletBlob(30, 80, 120, 150, 10, width/2, height/2, 1, 40, 300, 300); } // BIG verlet
  if (key == '8') { enable_metaball = false; addBracedBlob(20, 80, 120, 150, 10, width/2, height/2, 1, 40, 300, 300); } // BIG braced
  if (key == '9') { enable_metaball = false; addSkinnedBlob(60, 100, 120, 10, 10, width/2, height/2, 1, 40, 300, 300); } // BIG skinned
  if (key == '0') { enable_metaball = false; addTarBlob(40, 20, 100, 300, 10, width/2, height/2, 1, 40, 300, 300); }
  //if (key == 'asd') addSkinnedBlob(40, 50, 60, 10, 100, width/2, height/2, 1, 40, 300, 300);
  //if (key == 'asd') addSkinnedBlob(40, 50, 65, 10, 10, width/2, height/2, 1, 40, 300, 300);
  //if (key == 'asd') addSkinnedBlob(40, 50, 65, 10, 20, width/2, height/2, 1, 40, 300, 300);
}

void keyReleased() {
       if (key == CODED && keyCode == UP) keys[0] = false;
  else if (key == CODED && keyCode == LEFT) keys[1] = false;
  else if (key == CODED && keyCode == DOWN) keys[2] = false;
  else if (key == CODED && keyCode == RIGHT) keys[3] = false;
}


// Factory of things

void addTest1P()
{
  ParticleSystem test = new ParticleSystem(t_size, 30, 30);
  
  Particle t1 = test.addParticle(200, 300, 100, 40);
  
  // Create constraints for surrounding particles
  test.addConstraint(t1, t1, 100, 150, 200, 10);
  
  test.setSize(100);
  
  blobs.add(test);
}

void addTest2P()
{
  ParticleSystem test = new ParticleSystem(t_size, 30, 30);
  
  Particle t1 = test.addParticle(200, 300, 100, 40);
  Particle t2 = test.addParticle(400, 300, 100, 40);
  
  // Create constraints for surrounding particles
  test.addConstraint(t1, t2, 100, 150, 200, 10);
  
  test.setSize(100);
  
  blobs.add(test);
}

void addTest3P()
{
  ParticleSystem test = new ParticleSystem(t_size, 30, 30);
  
  Particle t1 = test.addParticle(300, 300, 20, 40);
  Particle t2 = test.addParticle(340, 300, 20, 40);
  Particle t3 = test.addParticle(320, 330, 20, 40);
  
  // Create constraints for surrounding particles
  test.addConstraint(t1, t2, 40, 80, 100, 10);
  test.addConstraint(t1, t3, 40, 80, 100, 10);
  test.addConstraint(t3, t2, 40, 80, 100, 10);
  
  test.setSize(100);
  
  blobs.add(test);
}

// Simple spherical blob with a center particle and a circle of particles around it
void addVerletBlob(int segments, float min, float mid, float max, float kspring, float x, float y, float mass, float rad, int mb_size, int mb_thresh)
{
  float angle_step = 2.0 * PI / float(segments);
  float seg_length = 2.0 * mid * sin(angle_step/2.0);
  ParticleSystem verlet = new ParticleSystem(t_size, mb_size, mb_thresh);
  
  // Center particle
  Particle center = verlet.addParticle(x, y, mass, rad);
  
  Particle[] pa = new Particle[segments];
  // Create surrounding particles
  for (int i = 0; i < segments; i++) {
    float angle = i * angle_step;
    float bx = x + mid * cos(angle);
    float by = y + mid * sin(angle);
    pa[i] = verlet.addParticle(bx, by, mass, rad);
  }
  
  // Create constraints for surrounding particles
  for (int i = 0; i < segments; i++) {
    int next = (i + 1) % segments;
    // To next point
    verlet.addConstraint(pa[i], pa[next], seg_length*0.9, seg_length, seg_length*1.1, kspring);
    // To center point
    verlet.addConstraint(pa[i], center, min, mid, max, kspring);
  }
  
  verlet.setSize(0.5*min + max);
  
  blobs.add(verlet);
}

// Same as simple blob with extra braces on every other point
void addBracedBlob(int segments, float min, float mid, float max, float kspring, float x, float y, float mass, float rad, int mb_size, int mb_thresh)
{
  float angle_step = 2.0 * PI / float(segments);
  float seg_length = 2.0 * mid * sin(angle_step/2.0);
  float seg_length2 = 2.0 * mid * sin(angle_step*2.0/2.0);
  float seg_length3 = 2.0 * mid * sin(angle_step*3.0/2.0);
  ParticleSystem braced = new ParticleSystem(t_size, mb_size, mb_thresh);
  
  // Center particle
  Particle center = braced.addParticle(x, y, mass, rad);
  
  Particle[] pa = new Particle[segments];
  // Create surrounding particles
  for (int i = 0; i < segments; i++) {
    float angle = i * angle_step;
    float bx = x + mid * cos(angle);
    float by = y + mid * sin(angle);
    pa[i] = braced.addParticle(bx, by, mass, rad);
  }
  
  // Create constraints for surrounding particles
  for (int i = 0; i < segments; i++) {
    int next = (i + 1) % segments;
    int next2 = (i + 3) % segments;
    // To next point
    braced.addConstraint(pa[i], pa[next], seg_length*0.1, seg_length, seg_length*2.1, kspring);
    // To next next point
    braced.addConstraint(pa[i], pa[next2], seg_length*0.1, seg_length3, seg_length3*2.1, kspring);
    // To center point
    braced.addConstraint(pa[i], center, min, mid, max, kspring);
  }
  
  braced.setSize(0.5*min + max);
  
  blobs.add(braced);
}

// A blob with thick structural skin
void addSkinnedBlob(int segments, float inner, float outer, float outer_spring, float inner_spring, float x, float y, float mass, float rad, int mb_size, int mb_thresh)
{
  float angle_step = 2.0 * PI / float(segments);
  float outer_length = 2.0 * outer * sin(angle_step/2.0);
  float inner_length = 2.0 * inner * sin(angle_step/2.0);
  float ring_gap = outer - inner;
  ParticleSystem skinned = new ParticleSystem(t_size, mb_size, mb_thresh);
  
  // Center particle
  Particle center = skinned.addParticle(x, y, mass, rad);

  Particle[] pa = new Particle[segments*2];
  // Create outer circle particles
  for (int i = 0; i < segments; i++) {
    float angle = i * angle_step;
    float bx = x + inner * cos(angle);
    float by = y + inner * sin(angle);
    float cx = x + outer * cos(angle);
    float cy = y + outer * sin(angle);
    // i*2 is outer
    pa[i*2] = skinned.addParticle(cx, cy, mass, rad);
     // i*2+1 is inner
    pa[i*2 + 1] = skinned.addParticle(bx, by, mass, rad);
  }
  
  // Create constraints for surrounding particles
  for (int i = 0; i < segments; i++) {
    int next = (i + 1) % segments;
    // Outer ring
    skinned.addConstraint(pa[i*2], pa[next*2], outer_length*0.9, outer_length, outer_length*1.1, outer_spring);
    // Inner ring
    skinned.addConstraint(pa[i*2 + 1], pa[next*2 + 1], inner_length*0.9, inner_length, inner_length*1.1, outer_spring);
    // Join rings with structural springs
    skinned.addConstraint(pa[i*2], pa[i*2 + 1], ring_gap*0.9, ring_gap, ring_gap*1.1, outer_spring);
    // Cross brace
    skinned.addConstraint(pa[i*2], pa[next*2 + 1], ring_gap*0.9, ring_gap, ring_gap*1.1, outer_spring);
    // Inner ring to center point, with mid point of the spring to be greater than radius for internal pressure
    skinned.addConstraint(pa[i*2 + 1], center, inner*0.2, inner*1.5, inner*2.1, inner_spring);
  }
  
  skinned.setSize(0.2*segments*outer_length);
  
  blobs.add(skinned);
}

// Similar construction as Gish, same as Braced but also connected to opposite particle
void addTarBlob(int segments, float min, float mid, float max, float kspring, float x, float y, float mass, float rad, int mb_size, int mb_thresh)
{
  float angle_step = 2.0 * PI / float(segments);
  float seg_length = 2.0 * mid * sin(angle_step/2.0);
  float seg_length2 = 2.0 * mid * sin(angle_step*2.0/2.0);
  ParticleSystem tar = new ParticleSystem(t_size, mb_size, mb_thresh);

  Particle[] pa = new Particle[segments];
  // Create surrounding particles
  for (int i = 0; i < segments; i++) {
    float angle = i * angle_step;
    float bx = x + mid * cos(angle);
    float by = y + mid * sin(angle);
    pa[i] = tar.addParticle(bx, by, mass, rad);
  }
  
  // Create constraints for surrounding particles
  for (int i = 0; i < segments; i++) {
    int next = (i + 1) % segments;
    int next1 = (i + 2) % segments;
    // To next point
    tar.addConstraint(pa[i], pa[next], seg_length*0.8, seg_length, seg_length*1.2, kspring);
    // To next next point
    tar.addConstraint(pa[i], pa[next1], seg_length*0.1, seg_length2, seg_length2*2.1, kspring);
    // To opposite point
    if (i < segments/2) { 
      tar.addConstraint(pa[i], pa[i + segments/2], min, mid*2.0, max, kspring);
    }
  }
  
  tar.setSize(seg_length*8);
  
  blobs.add(tar);
}


class Particle
{
  PVector pos0; // Previous position
  PVector pos; // Current position
  PVector force;
  float mass; // Size of particle
  float rad; // Radius
  ArrayList<Constraint> links; // Constraint between particles
  boolean drag; // Mouse drag

  Particle(float m, float r) {
    pos0 = new PVector(0, 0, 0);
    pos = new PVector(0, 0, 0);
    force = new PVector(0, 0, 0);
    mass = m;
    rad = r;
    links = new ArrayList<Constraint>();
    drag = false;
    f_jump = -60;
  }

  // Set particle position
  void setPos(float x, float y) {
    pos0.set(x, y);
    pos.set(x, y);
  }

  // Add semi-rigid constraint
  void addLink(Constraint c) {
    links.add(c);
  }
  
  // Gather forces acting on the particle
  void accumulateForces(ParticleSystem ps) {
    force.set(0, 0, 0); // Reset force

    // Apply gravity if enabled
    if (enable_gravity) force.add(PVector.mult(gravity, mass));

    // Keyboard input
    if (keys[0]) force.add(new PVector(0, ps.f_jump, 0)); // Up
    if (keys[1]) force.add(new PVector(-100.0, 0, 0)); // Left
    if (keys[2]) force.add(new PVector(0, 60.0, 0)); // Down
    if (keys[3]) force.add(new PVector(60.0, 0, 0)); // Right
    
    // Move randomly
    if (enable_ai) {
      PVector dir = updateMovement(ps.target.x, ps.target.y);
      force.add(dir);
      
      // Jump randomly
      if (ps.rand_jump) {
        force.add(new PVector(0, ps.f_jump, 0)); // If jumping
      }
    }
    
    // Blob moves towards the mouse
    if (follow_m) {
      PVector dir = updateMovement(mouseX, mouseY);
      force.add(dir);
      
      if (DEBUG) {
        stroke(255, 0, 255, 50);
        line(pos.x, pos.y, mouseX, mouseY);
      }
    }

    // Gather forces from all connected constraints
    int lsize = links.size();
    for (int i = 0; i < lsize; i++) {
      Constraint c = links.get(i);
      force.add(c.getForce(this));
    }
    
    force.limit(f_max); // Limit force in case of emergency

    // Dragged around by mouse
    if (drag) {
      PVector m = new PVector(mouseX, mouseY);
      force.add(PVector.mult(PVector.sub(m, pos), 500));
      //pos.set(m);
    }

    if (DEBUG) {
      // Project force
      stroke(0, 204, 0);
      line(pos.x, pos.y, pos.x + force.x*0.1, pos.y + force.y*0.1);
    }
  }

  // Verlet integration
  void integrateVerlet(float t) {
    // posT = pos1
    PVector temp = new PVector();
    temp = pos.get();
    // pos1 += (pos1 - pos0) + force/mass*t*t
    pos = PVector.add(pos, PVector.add(PVector.sub(pos, pos0), PVector.mult(PVector.div(force, mass), (t*t))));
    // pos0 = posT
    pos0 = temp.get();
  }

  // Returns a movement vector based on input current and new position
  PVector updateMovement(float x1, float y1)
  {
    // Obtain x and y component of new direction
    float dx = abs(x1 - pos.x) > 100 ? (x1 - pos.x)*0.1 : (x1 - pos.x); // If x is too large, limit it
    float dy = (y1 - pos.y) > 0 ? (y1 - pos.y) : 0; // If y is negative, set it to 0
    return new PVector(dx, dy, 0);
  }
}


class ParticleSystem
{
  ArrayList<Particle> particles; // Particles
  ArrayList<Constraint> constraints; // Constraint between particles
  float totalmass; // Total mass
  float timestep; // Time step
  float size; // Blob size
  PVector target; // Random target to wander towards
  float f_jump; // Jumping force
  boolean rand_jump; // Random jump flag
  int mb_size; // Metaball size
  int mb_thresh; // Metaball threshold

  // Initialize system of particles
  ParticleSystem(float t, int mbs, int mbt) {
    particles = new ArrayList<Particle>();
    constraints = new ArrayList<Constraint>();
    totalmass = 0;
    timestep = t;
    size = 1;
    target = new PVector(random(width), random(height - ground_h), 0);
    f_jump = -60.0;
    rand_jump = false;
    mb_size = mbs;
    mb_thresh = mbt;
  }

  // Add particle to the blob
  Particle addParticle(float x, float y, float m, float r) {
    Particle p = new Particle(m, r);
    p.setPos(x, y); // Set particle position
    particles.add(p);
    totalmass += m; // Accumulate blob mass
    return p;
  }

  // Create rigid constraint between two particles
  void addConstraint(Particle p1, Particle p2, float len) {
    Constraint c = new Constraint();
    c.initRigid(p1, p2, len);
    constraints.add(c);
    
    // Store constraints acting on the particle
    p1.addLink(c);
    p2.addLink(c);
  }

  // Create semi-rigid constraint between two particles
  void addConstraint(Particle p1, Particle p2, float min, float mid, float max, float force) {
    Constraint c = new Constraint();
    c.initSemiRigid(p1, p2, min, mid, max, force);
    constraints.add(c);
    
    // Store constraints acting on the particle
    p1.addLink(c);
    p2.addLink(c);
  }
  
  void setSize(float s) {
    size = s;
  }

  // Step through time iteration
  void update() {
    updateJsZ(); // PVector.set() fix for JS mode
    updateForce(); // Force Accumulator
    updateVerlet(); // Verlet Integration
    updateCollision(); // Collision Detection
    updateConstraint(); // Satisfy Constraints
  }

  // In JS mode PVector.set() sets z to NaN if it's 0, this fixes it   
  void updateJsZ() {
    int psize = particles.size(); // Cache arraylist size
    for (int i = 0; i < psize; i++) {
      Particle p = particles.get(i);
      p.pos.z = 0;
    }
  }

  void updateForce() {
    PVector movement = new PVector(0, 0, 0);
    // Move randomly
    if (enable_ai) target = updateTarget();
    
    if (DEBUG && enable_ai) {
      stroke(255, 0, 0);
      fill(255, 0, 0);
      ellipse(target.x, target.y, 10, 10);
    }
    
    int psize = particles.size(); // Cache arraylist size
    for (int i = 0; i < psize; i++) {
      Particle p = particles.get(i);      
      p.accumulateForces(this);
    }
  }

  // Returns a new random wandering direction
  PVector updateTarget()
  {
    PVector vel = new PVector(random(-10, 10), random(-2, 2), 0); // Random velocity vector
    PVector steer = PVector.add(target, vel); // Determine new movement
  
    // If out-of-bound
    if (steer.x < 0) steer.x += width;
    else if (steer.x > width) steer.x -= width;
    if (steer.y < 0) steer.y += height - ground_h;
    else if (steer.y > height - ground_h) steer.y -= height - ground_h;
    
    return steer;
  }

  void updateVerlet() {
    int psize = particles.size(); // Cache arraylist size
    for (int i = 0; i < psize; i++) {
      Particle p = particles.get(i);
      p.integrateVerlet(timestep);
    }
  }

  void updateConstraint() {
    int csize = constraints.size(); // Cache arraylist size
    // Relaxation loop to avoid collapse of the spring mass structure
    for (int iter = 0; iter < relax_iter; iter++) {
      // Iterate through all connected constraints
      for (int i = 0; i < csize; i++) {
        Constraint c = constraints.get(i);
        c.satisfyConstraint();
      }
    }
    
    // lock particle 0
    if (DEBUG && d_lock1) {
      Particle p1 = particles.get(0);
      p1.pos.set(p1.pos0.x, p1.pos0.y);
    }
  }

  void updateCollision() { 
    f_jump = -60.0; // Update jump force
       
    int n = particles.size(); // Cache arraylist size
    for (int i = 0; i < n; i++) {
      Particle p = particles.get(i);
      // Project points outside of obstacle during border collision
      detectCollision(p);
    }
    
    // Jump randomly
    if (enable_ai) {
      rand_jump = false;
      if (int(random(100)) < 1) {
        rand_jump = true;
        f_jump = -800;
      }
    }
  }
  
  // Simple world collision detection 
  void detectCollision(Particle p)
  {
    float half_mass = p.mass*0.5;
    
    if (checkCollision(p.pos, half_mass)) {
      PVector normal = getNormal(p.pos, half_mass);    
      PVector movement = PVector.sub(p.pos, p.pos0);
      float perp = movement.dot(normal);    
      PVector parallel = PVector.sub(movement, PVector.mult(normal, perp));
      
      if (!checkCollision(PVector.add(p.pos0, parallel), half_mass)) {
        p.pos = PVector.add(p.pos0, PVector.mult(parallel, f_friction));
      }
      else {
        // If all else fails, just move to collision point
        if (normal.x < 0.0) p.pos.x = half_mass;
        else if (normal.x > 0.0) p.pos.x = width - half_mass;
        if (normal.y < 0.0) p.pos.y = half_mass;
        else if (normal.y > 0.0) p.pos.y = height - ground_h - half_mass;
      }
    }
  }
  
  // Check if a collision has occured
  boolean checkCollision(PVector pos, float half_mass)
  {
    // Check x/y component of particle coordinate
    if (pos.x < half_mass || pos.x > width - half_mass ||
        pos.y < half_mass || pos.y > height - ground_h  - half_mass) return true;
    return false;  
  }
  
  // Obtain normal of current movement direction
  PVector getNormal(PVector pos, float half_mass)
  {
    PVector normal = new PVector(0.0, 0.0, 0.0);
    // Obtain x component of current movement
    if (pos.x < half_mass) { normal.x = -1.0; f_jump = -60; }
    else if (pos.x > width - half_mass) { normal.x = 1.0; f_jump = -60; }
    // Check y component of current movement, only when on the ground can jump force be large
    if (pos.y < half_mass) { normal.y = -1.0; f_jump = 0; }
    else if (pos.y > height - ground_h  - half_mass) { normal.y = 1.0; f_jump = -500; }
    return normal;  
  }

  void render() {
    int psize = particles.size();
    // Render particles
    for (int i = 0; i < psize; i++) {
      Particle p = particles.get(i);
      
      // Find local box for rendering metaball
      if (enable_metaball) {
        for (int x = floor(p.pos.x - size); x < ceil(p.pos.x + size); x++) {
          for (int y = floor(p.pos.y - size); y < ceil(p.pos.y + size); y++) {
            int index = x + y*width;
            
            if (index >= 0 && index < screen_size) {
              metabox[index] = 1; 
            }
          }
        }
      
        if (DEBUG) {
          noFill();
          stroke(#cccccc);
          rect(p.pos.x - size*0.5, p.pos.y - size*0.5, size, size);
        }
      }
      
      if (DEBUG && enable_ai) {
        stroke(255, 0, 255, 50);
        line(p.pos.x, p.pos.y, target.x, target.y);
      }
      
      // Mouse drag force
      if (p.drag) {
        PVector m = new PVector(mouseX, mouseY);
        stroke(255, 0, 0);
        line(p.pos.x, p.pos.y, m.x, m.y);
      }
      else stroke(0, 102, 153);  
      // Particle
      noFill();
      strokeWeight(2);
      ellipse(p.pos.x, p.pos.y, p.mass*5, p.mass*5);
      strokeWeight(1);
    }
    
    int csize = constraints.size();
    // Render constraints
    for (int i = 0; i < csize; i++) {
      // Iterate through all connected constraints
      stroke(0, 0, 0);
      Constraint c = constraints.get(i);
      // Constraint pressure
      if (DEBUG) {
        PVector normal = new PVector(c.p1.pos.y - c.p2.pos.y, c.p2.pos.x - c.p1.pos.x);
        normal.mult(0.1);
        stroke(c.d_color);
        line(c.d_pt.x + normal.x, c.d_pt.y + normal.y, c.d_pt.x + -1*normal.x, c.d_pt.y + -1*normal.y);
      }
      // Constraint between particles
      stroke(#666666);
      line(c.p1.pos.x, c.p1.pos.y, c.p2.pos.x, c.p2.pos.y);
    }
  }
}



