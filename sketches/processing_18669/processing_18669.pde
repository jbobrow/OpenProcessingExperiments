
import toxi.geom.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;

int NUM_PARTICLES = 100;

VerletPhysics physics;
AttractionBehavior mouseAttractor;
GravityBehavior gravity;

Vec3D mousePos;
Vec3D theCenter; 
float weight = 3;
int g = 1;

void setup() {
  size(400, 400, P3D);
  // setup physics with 5% drag
  
  physics = new VerletPhysics();
  physics.setDrag(0.05f);
  theCenter = new Vec3D(0, 0, 0);
  physics.setWorldBounds(new AABB(200));
  gravity = new GravityBehavior(new Vec3D(0, 0.1f,0.0f));
  physics.addBehavior(gravity);
   
  for (int i=0; i< NUM_PARTICLES;i++) {
  addParticle(weight);
  }
}

void addParticle(float w) {
  VerletParticle p = new VerletParticle(random(-5,5), random(-5,5), random(-5,5), w);
  
  physics.addParticle(p);
  // add a negative attraction force field around the new particle
  physics.addBehavior(new AttractionBehavior(p, 50, -.10-.2*w, 0.00f));
  physics.addBehavior(new AttractionBehavior(p, 1000, 0.001f, 0.00f));
}

void removeParticle() {
  physics.particles.remove(physics.particles.size()-1);
}

void draw() {
  background(255,0,0);
  lights();
  noStroke();
  fill(255);
  
  pushMatrix();
  pushStyle();
  translate(0,202,0);
  fill(255,100);
  box(400,1,400);
  popStyle();
  popMatrix();

  physics.update();
  for (VerletParticle p : physics.particles) {
    translate(p.x, p.y, p.z);
    box(p.getWeight()*2);
    translate(-p.x, -p.y, -p.z);
  }  
  
    camera((mouseX-width/2)*2, (mouseY-height/2)*2, mouseX+mouseY, // eyeX, eyeY, eyeZ
         0,100,0,
         0.0, 1.0, 0.0); // upX upY, upZ
}

void mousePressed() {
  mousePos = new Vec3D(0, 0, 0);
  // create a new positive attraction force field around the mouse position (radius=1000px)
  mouseAttractor = new AttractionBehavior(mousePos, 1000, .5f);
  physics.addBehavior(mouseAttractor);

}

void mouseDragged() {
  // update mouse attraction focal point
  mousePos.set(mouseX, mouseY,0);
}

void mouseReleased() {
  // remove the mouse attraction when button has been released
  physics.removeBehavior(mouseAttractor);
}

void keyPressed() {
  
  if (key == ' ') {
    addParticle(weight);}
  
  if (key == 'd') {
    if (physics.particles.isEmpty()==false){
      removeParticle();}}
  
  if (key == 'g') {
    if (g==1){
      physics.removeBehavior(gravity);}
    if (g==-1){
      physics.addBehavior(gravity);}
      g*=-1;
  }
}

