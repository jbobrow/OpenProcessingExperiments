
/**
 Mock of of some 2D physics using boxes. 
 
 The rotation isn't quite there for toxilib version, and the constraints aren't quite what I want
Explains why physics library's are very important as it seems non-trivial to add constraints to all
(at least with removeAllConstraints not working)
 
 Ryan Mills
 
 Note: js version of toxiclibs does not implement 3D version of physics
 */


import toxi.physics2d.VerletPhysics2D;
import toxi.physics2d.VerletParticle2D;
import toxi.physics2d.constraints.RectConstraint; 
import toxi.physics2d.behaviors.GravityBehavior; 
import toxi.physics2d.behaviors.AttractionBehavior; 
import toxi.geom.Rect;
import toxi.geom.Vec2D;  
import toxi.processing.ToxiclibsSupport; 

// BEGIN JS
var VerletPhysics2D = toxi.physics2d.VerletPhysics2D, 
VerletParticle2D = toxi.physics2d.VerletParticle2D, 
RectConstraint = toxi.physics2d.constraints.RectConstraint, 
GravityBehavior = toxi.physics2d.behaviors.GravityBehavior, 
AttractionBehavior = toxi.physics2d.behaviors.AttractionBehavior, 
Rect = toxi.geom.Rect, 
Vec2D = toxi.geom.Vec2D, 
ToxiclibsSupport = toxi.processing.ToxiclibsSupport;
// END JS

VerletPhysics2D physics; 

Rect rect; 
VerletParticle2D recParticle; 
ToxiclibsSupport gfx; 
int recWidth = 10; 
int recHeight = 30; 
float halfWidth = recWidth/2; 
float halfHeight = recHeight/2;
RectConstraint[] rConstraint;
int currentSize = 0; 


public void setup() {
  size(500, 500); 
  frameRate(60); 

  Rect bounds = new Rect(halfWidth, halfHeight, width-recWidth-1, height-recHeight-1);

  gfx = new ToxiclibsSupport(this); 

  physics = new VerletPhysics2D(); 
  physics.setWorldBounds(bounds); 
  physics.setDrag(0.01f); 
  // set gravity
  float g1 = 0.1; 
  GravityBehavior gravity = new GravityBehavior(new Vec2D(0, g1)); 
  physics.addBehavior(gravity); 

  rect = new Rect(50, 0, recHeight, recWidth);
  //box = new AABB(new Vec3D(50,0,-200),new Vec3D(10,50,10)); 
  //boxParticle = new VerletParticle(box, 1);  
  //physics.addParticle(boxParticle); 

  addParticle();
}

void addParticle() {
  //for (int i = 0; i< 700; i++){
  //AABB b = new AABB(box);
  Rect b = rect.copy();
  b.set(random(20), b.y, b.width, b.height); 
  //b.updateBounds(); 
  //b.set(box.x() + frameCount%50 * 5, box.y(), box.z()); 
  //b.updateBounds(); 
  VerletParticle2D p = new VerletParticle2D(b.x+recWidth/2, b.y+recHeight/2, 1);

  physics.addParticle(p);
  physics.addBehavior(new AttractionBehavior(p, 20, -1.2f, 0.01f));
  //}
}

public void draw() {
  background(255);
  lights(); 
  //rotateY(frameCount*.01f); 
  noFill();
  physics.update(); 
  // remove and add all of the constraints
  //box.set(boxParticle);  
  //println("particle:" + boxParticle.x() + "," + boxParticle.y());
  //println("box:" + box.x()); 
  //box.updateBounds(); 
  //gfx.box(box); // why is this not updating to a new location?
  // first make all of the box constraints

  //BoxConstraint[] bC = new BoxConstraint[physics.particles.size()]; 
  
  // can't remake this ever time
 // RectConstraint[] rC = new RectConstraint[currentSize+1];// inefficient

  int i = -1; 
  for (VerletParticle2D p : physics.particles) { 
    currentSize++; 
    i++; 
    try{
      p.removeAllConstraints(); // null pointer exception?
    } catch (Exception e){
     // likely first time 
    }
     
    Rect r = rect.copy(); 
    r.set(p.x-recWidth/2, p.y-recHeight/2, rect.height, rect.width);
    //rC[i] = new RectConstraint(r);  
   
    gfx.rect(r);

    
  }
  
  // now add in the constraints (except self)
  /*
  int z = -1; 
  for (VerletParticle2D p : physics.particles){
      z++; 
      for (int y = z+1; y < rC.length -1;  y++){
          p.addConstraint(rC[i]); // not quite working
      } 
  }
  */
  
  




  // why aren't more being added
  if (frameCount%4==0) {
    addParticle(); 
    //Vector3f pos = new Vector3f(random(30), -150, random(1));
    //reuse the rigidBody of the sphere for performance resons
    //BObject(PApplet p, float mass, BObject body, Vector3f center, boolean inertia)
    //BObject r = new BObject(this, 100, box, pos, true);
    //add body to the physics engine
    //physics.addBody(r);
    //AABB b = new AABB(new Vec3D(0,0,-200),new Vec3D(10,50,10)); // how are these tied together?
    //AABB b = new AABB(box);
    //b.set(box.x() + frameCount%50 * 5, box.y(), box.z()); 
    //b.updateBounds(); 
    //VerletParticle bV = new VerletParticle(box, 1);
    //physics.addParticle(bV);
    // for(VerletParticle p : physics.particles){
    //   VerletSpring s = new VerletSpring(p, bV, 10, .1); 
    //   physics.addSpring(s);  
    // }
  }
}



