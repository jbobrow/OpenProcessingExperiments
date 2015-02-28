
class ParticleSystem{
  ArrayList parts;
  PVector origin;
  
  //Constructor
  ParticleSystem(int num, PVector v, float r, float mass, float grav, float timer){
    parts = new ArrayList();
    origin = v.get();
    for(int i=0; i<num; i++){
      parts.add(new Particle(origin, r, mass, grav, timer));
    }
  }

  void run(){
    for(int i=parts.size()-1; i>=0; i--){ 
      Particle p = (Particle) parts.get(i);
      p.run(parts); //run all the main actions for every particle in the ArrayList
      if(p.dead()){ //if particle p timer is = 0, remove it from the ArrayList
        parts.remove(i);
      }
    }
    
    //display how many particles are alive
    fill(0);
    rect(width-120, height-40, width, height);
    fill(255);
    text("Particles: "+parts.size(), width-100, height-16);
  }

  //Add a new particle
  void addParticle(float x, float y, float r, float mass, float grav, float timer){
    parts.add(new Particle(new PVector(x, y), r, mass, grav, timer));
  }
}


