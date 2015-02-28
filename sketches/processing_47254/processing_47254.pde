
/*
Hackpact Arte Generativo 2011
 Dia 30
 
 Martin Zumaya Hernandez
 */

import remixlab.proscene.*;
import toxi.geom.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;

VerletPhysics physics;
AttractionBehavior attractor;
Scene scene;

float ang = 0;
float beta = 0;
float inc = 1;

void setup() {  
  size(700, 700, P3D);
  colorMode(HSB);
  scene = new Scene(this);
  scene.toggleGridIsDrawn();
  scene.toggleAxisIsDrawn();
  scene.disableKeyboardHandling();
  
  physics = new VerletPhysics();
  physics.setDrag( 1.5f);

  for ( int i = 0; i < 100; i += 5) {
    for ( int j = 0; j < 100; j += 5) {
      for ( int k = 0; k < 100; k += 5) {
        
        Vec3D vec = new Vec3D(i, j, k);
        VerletParticle p = new VerletParticle(vec);
        physics.addParticle(p);
        
        Vec3D vec1 = new Vec3D(-i, -j, k);
        VerletParticle p1 = new VerletParticle(vec1);
        physics.addParticle(p1);
        
        Vec3D vec2 = new Vec3D(-i, j, k);
        VerletParticle p2 = new VerletParticle(vec2);
        physics.addParticle(p2);
        
        Vec3D vec3 = new Vec3D(i, -j, k);
        VerletParticle p3 = new VerletParticle(vec3);
        physics.addParticle(p3);
        
        Vec3D vec4 = new Vec3D(i, j, -k);
        VerletParticle p4 = new VerletParticle(vec4);
        physics.addParticle(p4);
        
        Vec3D vec5 = new Vec3D(-i, -j, -k);
        VerletParticle p5 = new VerletParticle(vec5);
        physics.addParticle(p5);
        
        Vec3D vec6 = new Vec3D(-i, j, -k);
        VerletParticle p6 = new VerletParticle(vec6);
        physics.addParticle(p6);
        
        Vec3D vec7 = new Vec3D(i, -j, -k);
        VerletParticle p7 = new VerletParticle(vec7);
        physics.addParticle(p7);



      }
    }
  }
}


void draw() {

  lights();

  background(0); 
  
  Vec3D vec = new Vec3D(0,0,0);
    attractor = new AttractionBehavior(vec, 300, 0.04 + sin(radians(ang*10)));
    physics.addBehavior(attractor);
    physics.update();    
    
    for (VerletParticle p : physics.particles) {
      
      stroke(60+60*sin(radians(ang)),200,200,10);
      point(p.x,p.y,p.z);
      physics.removeBehavior(attractor);
 }
 
 stroke(60+60*sin(radians(ang)),200,200, 80);
 bolita();

  beta += inc*0.1;
  ang += 0.1;

  if ( beta >= TWO_PI || beta <= -TWO_PI) {

    inc = -inc;
  }
}

void bolita() {
  pushMatrix();
  for ( int i = 0; i < width; i += 10) {
    rotateY(radians(ang));
    float x= 200*cos(radians(i));
    float y = 200*sin(radians(i));
    noFill();
    beginShape(QUAD_STRIP);
    vertex(x, y, 0);
    vertex(x, y, 50*sin(radians(ang/5)));
    vertex(-x, -y, 0);
    vertex(-x, -y, -50);
    endShape();
  } 
  popMatrix();
}

void keyPressed(){
 
 if( key == ' '){
 saveFrame("  #### imagen.png");
 } 
 }

