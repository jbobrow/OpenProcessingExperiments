
class Particle {
  //Vector qualities
  Vec3D position;
  Vec3D velocity;
  Vec3D force;
  Vec3D acceleration;
  
  //Scalar qualities
  float mass;
  
  //Default constructor
  Particle() {
    mass = 1; //Default mass
    velocity = new Vec3D(0,0,0);
    force = new Vec3D(0,0,0);
    randomizePos();
  }
  
  //Particle(mass)
  Particle(float _mass) {
    velocity = new Vec3D(0,0,0);
    force = new Vec3D(0,0,0);
    randomizePos();
    mass = _mass;
  }
  
  //Particle(mass, position, velocity, force)
  Particle(float _mass, Vec3D _pos, Vec3D _vel, Vec3D _force) {
    mass = _mass;
    position = _pos;
    velocity = _vel;
    force = _force;
  }
  
  //Reset position by randomizing new starting point
  void randomizePos() {
   position = Vec3D.randomVector();
   position.scaleSelf(random(0, spawnRadius));
   acceleration = new Vec3D(0,0,0);   
  }
  
  //Draw point at position
  void draw() {
    strokeWeight(2);
    
    //generate color as a function of radius
    float dist = position.distanceTo(new Vec3D(0,0,0));
    //float green = map(abs(dist), spawnRadius/2, spawnRadius, 255, 0);
    //float red = map(abs(dist), 0, spawnRadius/2, 255, 0);
    //int c = color(red, green, 153);
    int c;
    
    if(dist < spawnRadius/3) { 
     float blue = map(abs(dist), 0, spawnRadius/2.5, 0, 255);
     c = color(255, 0, blue);
    } else {
     float white = map(abs(dist), spawnRadius/2.5, spawnRadius, 225, 255);
     c = (int)white;
    }
    stroke(c);
    point(position.x, position.y, position.z);
  }
  
  //Overwrite current force with new one
  void applyForce(Vec3D _force) {
    force = _force;
  }
  
  void addForce(Vec3D _force) {
    force.addSelf(_force);
  }

  //Accel = Force/Mass, reset acceleration to zero after every frame
  void update() {
    //applyAttractiveForce();
    acceleration.x = force.x/mass;
    acceleration.y = force.y/mass;
    acceleration.z = force.z/mass;
    
    velocity.addSelf(acceleration);
    position.addSelf(velocity);
    
    acceleration = new Vec3D(0,0,0);
    force = new Vec3D(0,0,0);
  }
    
}
class Gravity {
  //Gravitational Constant
  final float G = .9;
  
  //min distance
  final float minDistance = 13;
  
  Gravity() {
    
  }
  
  //Using Fg = Gm1m2/r^2
  void applyGravity(Particle p1, Vector particles) {
    Vec3D force = new Vec3D(0,0,0);
    float f = 0;
    float r = 0;
    Particle p2; //Used for m2
    
    //Stop calculating particles that have already clumped to increase FPS
    if(p1.velocity.magnitude() > 0.001 || frameCount < 1000) {
      for(int i = 0; i < particles.size(); i++) {
        p2 = (Particle)particles.get(i);
        r = p1.position.distanceTo(p2.position);
        
        if(r > minDistance) {
          f = (G * p1.mass * p2.mass)/sq(r);
          
          force = p2.position.sub(p1.position);
          force.normalizeTo(f);
          
          p1.addForce(force);
         ((Particle)particles.get(i)).addForce(force.scaleSelf(-1));
        } else {
           p1.velocity.scaleSelf(.95);
           
        }
      
      }
    }
  
  }

}
/* Stellar Cloud by Waleed Qawasmi (wqawasmi)
 * Originally intended to simulate an interstellar cloud clumping together
 * but it just ended up looking cool so I rolled with it.
 * Also my first attempt at Processing, so excuse any slop.
 * Feel free to do as you wish with the code, just leave this header :P
 *
 * Email: w.qawasmi@rutgers.edu
 */

import peasy.*;
import toxi.geom.*;
import java.util.Vector;

PeasyCam cam;
float spawnRadius;

//Forces
float gravity; 
float friction;
Gravity grav;

//World vars
Vector world;
float numParticles;

void setup() {
  size(1280, 720, P3D);
  cam = new PeasyCam(this, 1000);
  grav = new Gravity();
  world = new Vector();
  
  spawnRadius = 400;
  numParticles = 600;
  
  for(int i = 0; i < numParticles; i++) {
    world.add(new Particle());
  }
}

void draw() {
  background(18);
  hint(DISABLE_DEPTH_TEST);
  
  for(int i = 0; i < numParticles; i++) {
    Particle temp = (Particle)world.get(i);
    temp.update();
    temp.draw();
    grav.applyGravity((Particle)world.get(i), world);
  }
  
  println("FPS: " + frameRate);
}


