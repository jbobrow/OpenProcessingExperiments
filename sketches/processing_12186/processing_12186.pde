
/**
Strings

Made this as a part of some visuals i did in copenhagen at the royal library. 
I modyfied one of the examples given by toxilibs (http://toxiclibs.org/). 

Frederik Krogh
www.krogh.ws
*/

import toxi.physics2d.constraints.*;
import toxi.physics2d.*;
import toxi.geom.*;
import toxi.math.*;
ArrayList list;

void setup() {
  size(800, 600, P2D);
  smooth();
  frameRate(25);
  
  list = new ArrayList();
  for(int i = 0; i < 10; i++) {
    SoundString s = new SoundString(height/10*i);
    list.add(s);
  }
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(10);
  noFill();
  
  if(random(50) > 49) {
    SoundString ss = (SoundString) list.get(floor(random(list.size())));
    ss.beat();
  }
  
  int il = list.size();
  for(int i = 0; i < il; i++) {
    SoundString s = (SoundString) list.get(i);
    s.draw();
  }
}

class SoundString {
  VerletPhysics2D physics;
  VerletParticle2D head,tail;
  
  float posY, easePosY;
  
  SoundString(float posY) {
    this.posY = posY;
    easePosY = posY;
    
    physics=new VerletPhysics2D();
    Vec2D stepDir=new Vec2D(1,1).normalizeTo(10);
    ParticleString2D s=new ParticleString2D(physics, new Vec2D(), stepDir, 100, 1, 0.1);
    head=s.getHead();
    head.lock();
    tail=s.getTail();
    tail.lock();
    
    head.set(0,posY);
    tail.set(width, posY);
  }
  
  void beat() {
    easePosY = posY + random(-200, 200);
  }
  
  void draw() {
    easePosY += (posY - easePosY)/5;
    head.set(0,easePosY);
    tail.set(width, posY);
    
    physics.update();
    
    beginShape();
    for(Iterator i=physics.particles.iterator(); i.hasNext();) {
      VerletParticle2D p=(VerletParticle2D)i.next();
      vertex(p.x,p.y);
    }
    endShape();
  }
}

