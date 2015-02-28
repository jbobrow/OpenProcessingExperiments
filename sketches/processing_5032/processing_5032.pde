
import traer.physics.*;

  ParticleSystem physics;
  Particle ten1;
  Particle ten2;
  
  Particle mouse;
  Spring spring;
 
 void setup(){
   
  size(640,480);
  background(#6CA5D6);
  smooth();
  colorMode(HSB);
  
  physics = new ParticleSystem( 0, 0.1);
  
  ten1 = physics.makeParticle(1.0, 0, 0, 0);
  ten2 = physics.makeParticle(1.0, 0, 0, 0);
  mouse = physics.makeParticle();
  mouse.makeFixed();

  physics.makeSpring( ten1, ten2, 0.4, 0.2, 2.0 );
  physics.makeAttraction( ten1, ten2, -1000, 2.0 );
  physics.makeAttraction( ten1, mouse, 1000, 50 );
  physics.makeAttraction( ten2, mouse, 1000, 50 );
 }
 
 void draw(){
   physics.tick( 1.0 );
   mouse.position().set( mouseX, mouseY, 0);
   stroke(#000000);
   line( ten1.position().x(), ten1.position().y(), ten2.position().x(), ten2.position().y());
   
   
 }
 
 void mouseClicked(){
 //  saveFrame("p" + month() + day() + hour() + minute() + second() + ".png");
}

