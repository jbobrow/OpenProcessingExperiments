
ArrayList particles;
int rotation = 0;

import processing.opengl.*;
void setup(){
  
  size(500, 500, OPENGL);
  
  noStroke();
  smooth();
  particles = new ArrayList();

  for( int i = 0; i < 1000; i++ ){
    particles.add( new Particle( 3 ) );
  };
};

void draw(){
  background( color( 0,0,0,99));
  for( int i = 0; i < particles.size(); i++){
   
    Particle particle = (Particle) particles.get(i);
    particle.update();
    pushMatrix();
    particle.render();
    fill(particle.location.z + 100);
    translate( particle.location.x, particle.location.y, particle.location.z );
 
     box(particle.size);
    popMatrix();
  } 
};

void mousePressed(){
  for( int i = 0; i < particles.size(); i++){
   Particle particle = (Particle) particles.get(i);
   particle.scatter();
  }
};

