
import traer.physics.*;

ParticleSystem psys;
Particle p1,p2,p3,p4;
Spring s,t,u;
float centerx,centery;

void setup()
{
  colorMode(HSB);
  size (600,600);
  smooth();
  background(230);
  stroke(0,20);
  strokeWeight(1);
  psys= new ParticleSystem(0.0035,0.00001);
  p1=psys.makeParticle(10*random(0.6,1.4),50,height,0);
  p2=psys.makeParticle(10*random(0.6,1.4),200,height,0);
  p3=psys.makeParticle(10*random(0.6,1.4),400,height,0);
  p4=psys.makeParticle(10*random(0.6,1.4),550,height,0);
  s=psys.makeSpring(p1,p2,0.001,0.001,100+random(-20,20));
  t=psys.makeSpring(p2,p3,0.001,0.001,100+random(-20,20));
  u=psys.makeSpring(p4,p3,0.001,0.001,100+random(-20,20));
  p1.makeFree();
  p2.makeFree();
  p3.makeFree();
  p4.makeFree();
  p1.velocity().set(random(-0.6,0.6),-random(0.3,0.8),0);
  p2.velocity().set(random(-0.6,0.6),-random(0.5,0.8),0);
  p3.velocity().set(random(-0.6,0.6),-random(0.5,0.8),0);
  p4.velocity().set(random(-0.6,0.6),-random(0.3,0.8),0);
  noFill();
}

void draw(){
  psys.tick();
  stroke(abs(p2.position().x()-p3.position().x()), constrain(0.3* abs(p3.position().x()-p4.position().y()),30,100),  constrain(abs(p3.position().x()-p4.position().y()),0,150),20);

  curve(0,height/2,p1.position().x(),p1.position().y(),p2.position().x(),p2.position().y(),p3.position().x(),p3.position().y());

  curve(p1.position().x(),p1.position().y(),p2.position().x(),p2.position().y(),p3.position().x(),p3.position().y(),p4.position().x(),p4.position().y());

  curve(p2.position().x(),p2.position().y(),p3.position().x(),p3.position().y(),p4.position().x(),p4.position().y(),width,height/2);


  handleBoundaryCollisions(p1);
  handleBoundaryCollisions(p2);
  handleBoundaryCollisions(p3);
  handleBoundaryCollisions(p4);
}
void mouseReleased(){
  setup();
}
void handleBoundaryCollisions( Particle p )
{
  if ( p.position().x() < 0 || p.position().x() > width )
    p.velocity().set( -0.95*p.velocity().x(), p.velocity().y(), 0 );
  if ( p.position().y() < 0 || p.position().y() > height )
    p.velocity().set( p.velocity().x(), -0.95*p.velocity().y(), 0 );
  p.position().set( constrain( p.position().x(), 0, width ), constrain( p.position().y(), 0, height ), 0 ); 
}






