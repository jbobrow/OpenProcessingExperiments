
import processing.opengl.*;

import toxi.physics2d.constraints.*;
import toxi.physics.*;
import toxi.physics.constraints.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;

import toxi.math.conversion.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.geom.mesh2d.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.math.noise.*;

int padding = 5;
float particleSize = 35;
int numParticles;
VerletPhysics2D phys;
Vec2D mousePos = new Vec2D(mouseX,mouseY);
Vec2D mouseVel = new Vec2D();
VerletParticle2D selectedP;

void setup(){
  smooth();
  size(960,450,OPENGL);
  numParticles = floor(width/(particleSize+padding));
  phys = new VerletPhysics2D();
  phys.addBehavior(new GravityBehavior(new Vec2D(0,.91)));
  phys.setWorldBounds(new Rect(0,0,width,height));
  //noStroke();
  ellipseMode(CENTER);
  for(int i = 0 ; i < numParticles ; i++){
    VerletParticle2D p = new VerletParticle2D(i*(particleSize + padding),height*.5);
    if(i > 0) {
      VerletParticle2D q = (VerletParticle2D)phys.particles.get(i-1);//previous particle
      VerletSpring2D s = new VerletSpring2D(p,q,5.0,.61803399);
      phys.addSpring(s);
    }
    phys.addParticle(p);
  }
  //lock first and last
  phys.particles.get(0).lock();
  phys.particles.get(phys.particles.size()-1).lock();
}

void draw(){
  //update
  phys.update();
  mouseVel.set(mouseX-pmouseX,mouseY-pmouseY).scale(-1);
  mousePos.set(mouseX,mouseY);
  for(int i = 1 ; i < numParticles-1 ; i++){
    VerletParticle2D p = phys.particles.get(i);
    if(mousePos.distanceTo(p) < particleSize) {
      selectedP = p;
      if(keyPressed) selectedP.addForce(mouseVel);
      else           selectedP.addVelocity(mouseVel);
    }
  }
  //draw
  background(255);
  stroke(0,128,0);
  for(VerletParticle2D p: phys.particles){
    ellipse(p.x,p.y,particleSize,particleSize);
  }
  for(VerletSpring2D s: phys.springs){
    line(s.a.x,s.a.y,s.b.x,s.b.y);
  }
  stroke(128,0,0);
  line(pmouseX,pmouseY,mouseX,mouseY); 
  println(mouseVel);
}

