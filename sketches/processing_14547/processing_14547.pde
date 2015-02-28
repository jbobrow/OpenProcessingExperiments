
class Bullet extends Particle {
  
  // basic bullet 
  
  float damage;
  
  Bullet (PVector l) {
    loc = l.get();  
    life = 40;
  }        
  
  void run() {
    loc.add(vel);
    checkForCreeps();
    render();
    life--;
  }
  
  void checkForCreeps() {
    for (int i = creeps.particles.size()-1; i >= 0; i--) {      
      Creep a = (Creep) creeps.particles.get(i);
      float dst = loc.dist(a.loc);
      if (!a.dead() & dst < 12) {
        a.damage(damage);
        renderExplode();
        life = 0;
        break;
      }
    }
  }
  
  void renderExplode() {    
    efps.origin = loc;
    efps.addParticles(30);
  }
    
  void render() {
    noStroke();
    fill(0);
    ellipseMode(CENTER);
    ellipse(loc.x, loc.y, 2, 2);
  }
  
}


