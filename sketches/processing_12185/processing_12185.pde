
/**
Wave

Made this as a part of some visuals i did in copenhagen at the royal library. 
I modyfied one of the examples given by toxilibs (http://toxiclibs.org/). 

Frederik Krogh
www.krogh.ws
*/

import toxi.physics2d.constraints.*;
import toxi.physics2d.*;
import toxi.geom.*;
import toxi.math.*;

VerletPhysics2D physics;
VerletParticle2D head,tail;

float posY, easePosY;

void setup() {
  size(800, 600, P2D);
  frameRate(25);
  
  this.posY = height/3*2;
  easePosY = posY;
  
  physics=new VerletPhysics2D();
  Vec2D stepDir=new Vec2D(1,1).normalizeTo(5);
  ParticleString2D s=new ParticleString2D(physics, new Vec2D(), stepDir, 100, 1, 0.1);
  
  head=s.getHead();
  head.lock();
  
  tail=s.getTail();
  tail.lock();
  
  head.set(0,posY);
  tail.set(width, posY);
}

void draw() {
  if(random(200) > 199)
    easePosY = posY + random(-height/4, height/4);
  easePosY += (posY - easePosY)/3;
  
  head.set(0,easePosY);
  tail.set(width, posY);
  
  physics.update();
  
  background(255);
  noStroke();
  fill(color(12,107,255));
  
  beginShape();
  vertex(0,height);
  
  for(Iterator i=physics.particles.iterator(); i.hasNext();) {
    VerletParticle2D p=(VerletParticle2D)i.next();
    vertex(p.x,p.y);
  }
  
  vertex(width,height);
  endShape(CLOSE);
}

