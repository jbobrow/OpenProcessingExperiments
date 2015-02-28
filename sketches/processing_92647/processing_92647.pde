
import java.util.*;

class ParticleSystem3 {
  ArrayList<Particle3> particles3;
  PVector origin;
  boolean systemIsDead;

  ParticleSystem3(float x, float y) {
    origin = new PVector(x,y);
    particles3 = new ArrayList<Particle3>();
    systemIsDead = false;
  }

  void addParticle() {
    if(particles3.size() < 30 && systemIsDead == false){
    particles3.add(new Particle3(origin));
    }
    if(particles3.size() > 29){
      systemIsDead = true;
    }
  }
  
 //A function to apply a force to all Particles
  void applyForce(PVector f) {
    for (Particle3 p: particles3) {
      p.applyForce(f);
    }
  }
  
  void run() {
    
   for (int i = particles3.size()-1; i > 0; i--) {

      Particle3 p = particles3.get(i);
      p.run();
      
      if (p.isDead()) {
        particles3.remove(p); 
      }
    }
  }
 
}






