
/**
 Mock of of some 2D physics using boxes. 
 
 The rotation isn't quite there for toxilib version. 
 
 This uses, gravity, negative attraction, and a box constraint to prevent the boxes overlapping too much. 
 
 Will eventually stop dropping boxes, so the drag will stop all motion eventually. 
 
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
int MAX = 50; 
int count = 0; 
ArrayList<Box2D> boxes; 


public void setup() {
  size(500, 500); 
  frameRate(60); 
  boxes = new ArrayList<Box2D>(); 
  

  Rect bounds = new Rect(halfWidth, halfHeight, width-recWidth-1, height-recHeight-1);

  gfx = new ToxiclibsSupport(this); 

  physics = new VerletPhysics2D(); 
  physics.setWorldBounds(bounds); 
  physics.setDrag(0.01f); 
  // set gravity
  float g1 = 0.1; 
  GravityBehavior gravity = new GravityBehavior(new Vec2D(0, g1)); 
  physics.addBehavior(gravity); 

  addParticle();
}

void addParticle() {
  count++; 
  Box2D b = new Box2D(10, 30); 
  b.setPosition(random(width/2-50, width/2+50), 0); 
  for(Box2D box : boxes){
     box.p.addConstraint(b.c);  
  }
 
  physics.addParticle(b.p); 
  physics.addBehavior(new AttractionBehavior(b.p, 20, -1.2f, 0.01f)); 
  boxes.add(b);
  
}

public void draw() {
  background(255);
  lights(); 
  noFill();
  try{
    physics.update(); 
  }catch(Exception e){
    println("exception on physics update"); 
  }
 
  for(Box2D b : boxes){
    try{
      b.p.applyConstraints();
    }catch(Exception e){
      println("exception on constraint application"); 
    }
    b.updateBoxPosition(); 
    gfx.rect(b.r); 
    
  }
 
  if (frameCount%50==0) {
    if (count < MAX){
      addParticle(); 
    }
    
  }
}


/**
This abstracts the creation and movement of a box, focusing on drawing the box around a verlet particle. 
Only toxic dependencies

TODO: rotation and counter rotation (based on draw); would need gfx passed in
*/

class Box2D{
  Rect r; 
  VerletParticle2D p; 
  RectConstraint c; 
  int width; 
  int height;
  
  public Box2D(int width, int height){
    this.width = width; 
    this.height = height;
    r = new Rect(0,0, this.width, this.height); 
    p = new VerletParticle2D(r.x+this.width/2, r.y+this.height/2, 1);
    c = new RectConstraint(r); // this is a constraint for others, not this
  }
  
  
  /**
  * Set the position of the box based on the particle
  */
  void updateBoxPosition(){
    r.set(p.x-r.width/2, p.y-r.height/2, r.width, r.height);
    this.updateConstraint(); 
    
  }
  
  /**
  * Verlet particles, once in motion, setting x and y change velocity, not position
  */
  VerletParticle2D refreshParticle(){
    VerletParticle2D p0 = new VerletParticle2D(r.x+this.width/2, r.y+this.height/2, 1); 
    p = p0; 
    return p0; 
    
  }
  
  
  
  void updateConstraint(){
    // constraint has to be bigger than the box
    c.setBox(new Rect(r.x-r.width/2, r.y-r.height/2, r.width + r.width/2, r.height + r.height/2)); 
  }
  
  void setPosition(float x, float y){
    r.set(x, y, r.width, r.height); 
    this.refreshParticle(); 
    this.updateConstraint(); 
  }
  
  
  
}


