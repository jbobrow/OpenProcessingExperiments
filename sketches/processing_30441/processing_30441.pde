
//import ddf.minim.*;
//import ddf.minim.signals.*;
//import ddf.minim.analysis.*;
//import ddf.minim.effects.*;
//
//Minim minim;
//AudioOutput out;

import processing.opengl.*;
import javax.media.opengl.GL;
PGraphicsOpenGL pgl;
GL gl;

ArrayList particles;
ArrayList hits;

int xRes = 600;
int yRes = 400;
boolean hitMade = false;

PVector [] pts = {
    new PVector(0,0,0),
    new PVector(xRes,0,0),
    new PVector(0,yRes,0),
    new PVector(xRes,yRes,0)
  };
  
  
void setup() {
//  size(xRes,yRes,OPENGL);
  size(xRes,yRes);
//  pgl = (PGraphicsOpenGL) g; //processing graphics object  
//  gl = pgl.beginGL(); //begin opengl
//  gl.setSwapInterval(1); //set vertical sync on
//  pgl.endGL(); //end opengl
  smooth();
  background(50);
  particles = new ArrayList();
  hits = new ArrayList();
  
//  minim = new Minim(this);
//  out = minim.getLineOut(Minim.STEREO);  
}

void draw() {
  background(50);
  hitMade = false;
  
  for(int i = 0; i < particles.size(); i++) {
    Particle particle = (Particle) particles.get(i);
    PVector loc = (PVector) particle.getPos();
    for (int p = 0; p < 4; p++) {
      if (loc.dist(pts[p]) < 5) {
        particle.Kill(); 
        if(hits.size() < 1) {
//          hits.add(new Hit(pts[p],float(frameCount),out));
//          hits.add(new Hit(pts[p],float(frameCount)));
        }
      }
    }
    if (particle.Dead()) particles.remove(i);
    for (int j = 0; j < 4; j++) {
      particle.Orient(field2(particle.getPos(),pts[j]));
    } 
    particle.Move();
  }
  
  for (int i = 0; i < hits.size(); i++) {
    Hit hit = (Hit) hits.get(i);
    if (hit.Dead()) hits.remove(i);
    hit.Grow();
  }
  
  strokeWeight(1);
  noFill();
  for(int i = 0; i < particles.size(); i++) {
    Particle particle = (Particle) particles.get(i);
    stroke(255*(1 - particle.getAge()/particle.death));
    line(
        particle.getPos().x,
        particle.getPos().y,
        particle.getPos().x + 5 * particle.getDir().x,
        particle.getPos().y + 5 * particle.getDir().y        
        );
  }  
  //noFill();
  for(int i = 0; i < hits.size(); i++) {
    Hit hit = (Hit) hits.get(i);
    float age = hit.getAge()/hit.death;
    fill(255,100);
    strokeWeight(2+(age*10));
    stroke(lerp(255,200,age));
    ellipse(hit.getPos().x,hit.getPos().y,hit.getRadius(),hit.getRadius());
  }  
}

void mouseMoved() {
  //float make = random(0.0,1.0);
  float make = 0;
  PVector curPos = new PVector(float(mouseX),float(mouseY),0.0);
  while (make++ < 25) particles.add(new Particle(curPos,float(frameCount)));
}

PVector field1(PVector pos) {  
  PVector weight = new PVector();  
  float wX = pos.x/width;
  float wY = pos.y/height;  
  weight.set((wX*2)-1,(wY*2)-1,1);  
  weight.mult(0.1);
  return weight;
}

PVector field2(PVector pos,PVector corner) {
  PVector loc = (PVector) pos.get();
//  PVector dir = new PVector(width/2,height/2,0.0);
  PVector dir = (PVector) corner.get();
  dir.sub(loc);
  //dir.normalize();
  //dir.mult(1);
  return dir;
}

