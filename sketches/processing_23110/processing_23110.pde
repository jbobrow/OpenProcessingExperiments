
//WRITEN BY JOSE SANCHEZ BASED ON WORK DONE BY KNITECTONICS

import toxi.physics.*;
import toxi.geom.*;
import peasy.*;
import toxi.physics.behaviors.*;

PeasyCam cam;

//declare
VerletPhysics physics;
VerletParticle particles;

Creator darwin;

void setup() {
  size(600,600,P3D);

  cam = new PeasyCam(this,100);

  //initialize
  physics = new VerletPhysics();

  Vec3D v = new Vec3D(0,0,-0.01);
  GravityBehavior g = new GravityBehavior(v);
  physics.addBehavior(g);


  //BUILD PARTICLES:

//  for(int i = 0; i < 40; i ++) {
//    VerletParticle p = new VerletParticle(0,i * 10,0);
//    if(i == 0) {
//      p.lock();
//    }
//    physics.addParticle(p);
//
//
//    //BUILD THE SPRING
//    if(i > 0) {
//      VerletParticle p2 = physics.particles.get(i-1);
//
//      VerletSpring sp = new VerletSpring( p, p2, 10, 0.1);
//
//      physics.addSpring(sp);
//    }
//  }
  
  
  //INITIALIZE CREATOR:
  Vec3D vec = new Vec3D (0,0,0);
  darwin = new Creator(vec);
  
  
}


void draw() {
  background(0);

  noFill();
  stroke(255);
  strokeWeight(1);
  box(600);
  
  darwin.run();



  //DRAW ALL PARTICLES
  for(int i = 0 ; i < physics.particles.size(); i ++) {
    VerletParticle p1 = physics.particles.get(i);
    if(p1.isLocked()) {
      stroke(255,0,0);
      strokeWeight(5);
    }
    else {
      stroke(0,255,169);
      strokeWeight(5);
    }
    point(p1.x,p1.y,p1.z);
  }


  //DRAW ALL SPRINGS
  for(int i = 0 ; i < physics.springs.size(); i ++) {  
    VerletSpring sp = physics.springs.get(i);   
    stroke(255);
    strokeWeight(1);
    line(sp.a.x, sp.a.y, sp.a.z, sp.b.x, sp.b.y, sp.b.z);
  }



  physics.update();
}


