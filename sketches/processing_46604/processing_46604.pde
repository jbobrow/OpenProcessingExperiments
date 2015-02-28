
/*
Hackpact Arte Generativo 2011
Dia 19

Martin Zumaya Hernandez
*/


import toxi.geom.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;

int N = 50;
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

  camera(10, 10*sin(radians(ang)), 80*cos(radians(ang))+width/3+mouseY/2, 
  0.0, 0.0, 0.0, 
  0.0, 0.0, 1.0);

  background(0);
  noFill();
  

    Vec3D vec = new Vec3D(0,0,0);

    if (physics.particles.size() < N) {
      addParticle(  );
    }
    
    attractor = new AttractionBehavior(vec, 10, 10f);
    physics.addBehavior(attractor);
    physics.update();
    for (VerletParticle p : physics.particles) {
      
      stroke(200,50);
      point(random(width),random(height),random(width+height));
                  
      pushMatrix();
      stroke(100+45*sin(radians(ang)), 200, 200, 50);
      translate(p.x,p.y,p.z);      
      sphere(10);
      stroke(100+45*sin(radians(ang)), 200, 200, 100);
      rotateX(radians(ang*40));
      line(p.x, p.y, p.z, vec.x, vec.y, vec.z);
      popMatrix();
      
      pushMatrix();
      stroke(200+45*sin(radians(ang)), 200, 200, 50);
      translate(p.x+200*cos(radians(ang*5)),p.y,p.z+200*sin(radians(ang*5)));
      sphere(10);
      stroke(200+45*sin(radians(ang)), 200, 200, 100);
      rotateZ(radians(ang*10));
      line(p.x, p.y, p.z, vec.x, vec.y, vec.z);
      popMatrix();
      
    }
    physics.removeBehavior(attractor);  
    
  ang += 1;
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

