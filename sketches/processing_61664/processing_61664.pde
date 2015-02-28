
import traer.physics.*;


ParticleSystem system;
Particle mid;
Particle[] otherPlanets; 

PImage img;

void setup() {
  size(1000, 1000);
  frameRate(20);
  background(255);
  system = new ParticleSystem(10, 0.1);
  mid = system.makeParticle(500, 100, 100, 0);
  mid.makeFixed();
  
  img = loadImage("pluto.jpg");
  
  otherPlanets = new Particle[10];
  otherPlanets[1] = system.makeParticle( 100, random(width), random(height), 0);
  system.makeAttraction( mid, otherPlanets[1], otherPlanets[1].mass(), 50);
 
}    
void draw() {
  system.tick();
  background(0);
  background(255);
  system.tick();
  
  ellipse(width/2, height/2, 100, 100);
  Particle theOne = otherPlanets[1];
  image(img, theOne.position().x() - img.width/2, theOne.position().y() - img.height/2);
}



