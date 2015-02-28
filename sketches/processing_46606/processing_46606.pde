
/*
Hackpact Arte Generativo 2011
Dia 21

Martin Zumaya Hernandez
*/

import toxi.geom.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;

int N = 100;
float ang = 0;
float nx  = 0;

VerletPhysics physics;
AttractionBehavior attractor;

void setup() {
  colorMode(HSB);
  size(600, 600, P3D);
  background(0);
  physics = new VerletPhysics();
  physics.setDrag( 0.1f);
}

void addParticle() {
  VerletParticle p = new VerletParticle(Vec3D.randomVector());
  physics.addParticle(p);
}


void draw() {

  camera(10, 10*sin(radians(ang)), 50*cos(radians(ang))+width/3, 
  0.0, 0.0, 0.0, 
  0.0, 0.0, 1.0);

  background(0);
  noFill();

    Vec3D vec = new Vec3D(0,0,0);

    if (physics.particles.size() < N) {
      addParticle(  );
    }
    
    attractor = new AttractionBehavior(vec, 300, 0.5 + sin(radians(ang)));
    physics.addBehavior(attractor);
    physics.update();
    
    for (VerletParticle p : physics.particles) {
      
      pushMatrix();
      translate(p.x+random(1,5)*0.11,p.y-random(1,5)*0.1,p.z+random(1,5)*0.1);
      rotateX(radians(ang*10));
      rotateY(radians(ang*5));
      stroke(50+45*sin(radians(ang)), 200, 200,50);
      box(10*noise(nx,nx*3));
      popMatrix();
       
      pushMatrix();
      translate(p.x+random(1,5)*0.11,p.y-random(1,5)*0.1,p.z+random(1,5)*0.1);
      rotateX(radians(ang*5));
      stroke(100+45*sin(radians(ang)), 200, 200,50);
      box(40*noise(nx,nx));
      popMatrix();
      
      pushMatrix();
      translate(p.x+random(1,5)*0.11,p.y-random(1,5)*0.1,p.z+random(1,5)*0.1);
      rotateX(radians(-ang*5));
      stroke(100+45*sin(radians(ang)), 200, 200,50);
      box(40*noise(nx,nx));
      popMatrix();
      
      pushMatrix();
      translate(p.x+random(1,5)*0.11,p.y-random(1,5)*0.1,p.z+random(1,5)*0.1);
      rotateZ(radians(ang));
      stroke(150+45*sin(radians(ang)), 200, 200,40);
      box(100*noise(nx,nx*5));
      popMatrix();
      
      pushMatrix();
      translate(p.x+random(1,5)*0.11,p.y-random(1,5)*0.1,p.z+random(1,5)*0.1);
      rotateZ(radians(-ang));
      stroke(150+45*sin(radians(ang)), 200, 200,40);
      box(100*noise(nx,nx*5));
      popMatrix();
            
      pushMatrix();
      translate(p.x+random(1,5)*0.11,p.y-random(1,5)*0.1,p.z+random(1,5)*0.1);
      rotateY(radians(ang/2));
      stroke(200+45*sin(radians(ang)), 200, 200,30);
      box(160*noise(nx,nx*2));
      popMatrix();        
      
      pushMatrix();
      translate(p.x+random(1,5)*0.11,p.y-random(1,5)*0.1,p.z+random(1,5)*0.1);
      rotateY(radians(-ang/2));
      stroke(200+45*sin(radians(ang)), 200, 200,30);
      box(160*noise(nx,nx*2));
      popMatrix();        
           
    physics.removeBehavior(attractor);
  }

  ang += 0.8;
  nx += 0.005;
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

