
//import processing.opengl.*;
import toxi.processing.*;
import toxi.geom.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;
import toxi.physics.constraints.*;
import peasy.*;
import volatileprototypes.Panel4P.*;

PeasyCam cam;
Panel4P panel;

public float boxSize = 300;
public boolean showBox = true;
public float springLength = 40;
VerletPhysics physics;
GravityBehavior gravity;

void setup(){
  size(600,600,P3D);
  //initializing camera
  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(500);
  cam.setMaximumDistance(1200);
  //initializing panel
  
  panel = new Panel4P(this);
  panel.addButton("showBox","Box",1);
  panel.addSlider("springLength","Spring Length",10,100,springLength);
  //panel.autoSize();
  
  
  physics = new VerletPhysics();
  physics.setWorldBounds(new AABB(boxSize/2));
  gravity = new GravityBehavior(new Vec3D(0,0,-1));
  physics.addBehavior(gravity);
  
  
  for(int i = 0; i<=10; i++){
    VerletParticle p = new VerletParticle(0,
                        -boxSize/2+boxSize/10*i,
                        boxSize/2);
    if(i == 0 || i == 10){
      p.lock();
    }
    physics.addParticle(p);
  }
  
}

void draw(){
  background(50);
  
  
  
  physics.springs.clear();
  
  for(int i = 0; i<physics.particles.size()-1; i++){
    VerletParticle p1 = (VerletParticle)physics.particles.get(i);
    VerletParticle p2 = (VerletParticle)physics.particles.get(i+1);
    VerletSpring s = new VerletSpring(p1,p2,springLength,1);
    physics.addSpring(s);
  }
  
  
  
  for(int i = 0; i<physics.particles.size(); i++){
    VerletParticle p = (VerletParticle)physics.particles.get(i);
    strokeWeight(5);
    stroke(255,0,0);
    point(p.x,p.y,p.z);
  }
  
  for(int i = 0; i<physics.springs.size(); i++){
    VerletSpring s = (VerletSpring)physics.springs.get(i);
    strokeWeight(1);
    stroke(0,255,0);
    line(s.a.x,  s.a.y,  s.a.z,  s.b.x,  s.b.y,  s.b.z);
  }
  
  
  physics.update();
  
  if(showBox){
    drawBox();
  }
}


//draw box
void drawBox(){
  stroke(200);
  strokeWeight(1);
  noFill();
  box(boxSize);
  fill(100);
  pushMatrix();
  translate(0,0,-boxSize/2);
  rect(-boxSize/2,-boxSize/2,boxSize,boxSize);
  popMatrix();
}

