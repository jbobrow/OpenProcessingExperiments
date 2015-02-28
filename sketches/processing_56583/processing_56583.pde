
import traer.physics.*;

Particle mouse, a;
ParticleSystem physics;
ArrayList<Particle> particles;

void setup()
{ 
  size(500,500);
  background(0);
  smooth();
  frameRate(30);
  ellipseMode(CENTER);
  noStroke();
  noCursor();
  
  physics = new ParticleSystem();
  mouse = physics.makeParticle();
  mouse.makeFixed();
  a = physics.makeParticle(1.0, random(0, width), 
    random(0, height), 0);
  
  physics.makeAttraction (mouse, a, 10000, 10);
  
  particles = new ArrayList<Particle>();
}

void draw()
{
  mouse.position().set(mouseX, mouseY, 0);
  for(Particle p : particles) {
    handleBoundaryCollisions(p);
    
  }
  physics.tick();
  
  background(0);
  
  stroke(41,255,0,100);
  strokeWeight(1);
  noFill();
  ellipse(mouse.position().x(), mouse.position().y(), 10, 10);
  
  for(Particle p : particles) {
    fill(41,255,0);
    ellipse(p.position().x(), p.position().y(), 10, 10);
    for(int i = 0; i < particles.size(); i++) {
      if(!(particles.indexOf(p) == i)) {
        line(p.position().x(), p.position().y(), 
          particles.get(i).position().x(), particles.get(i).position().y());
      }
    
  }
}
}

void handleBoundaryCollisions( Particle p )
{
  if ( p.position().x() < 0 || p.position().x() > width )
    p.velocity().set( -0.9*p.velocity().x(), p.velocity().y(), 0 );
  if ( p.position().y() < 0 || p.position().y() > height )
    p.velocity().set( p.velocity().x(), -0.9*p.velocity().y(), 0 );
  p.position().set( constrain( p.position().x(), 0, width ), 
    constrain( p.position().y(), 0, height ), 0 ); 
}

void mousePressed()
{
  Particle p = physics.makeParticle(1.0, mouseX, mouseY, 0);
  physics.makeAttraction(mouse, p, 1000, 10);
  particles.add(p);
  for(int i = 0; i < particles.size(); i ++) {
      if( !(particles.indexOf(p) == i) ) {
        physics.makeAttraction(p, particles.get(i), -1000, 5);
      }
    }
}

