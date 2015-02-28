
class ParticleManager { 

  int numParticles = 5;  
  Particle[] particle = new Particle[numParticles];  

  void instantiatePrts() {  
    for(int i=0; i < numParticles; i++) {  
      particle[i] = new Particle(new Vector3D(0,.1), new Vector3D(random(-2,2), random(-2,2)), new Vector3D(random(width), random(height)));  
    }
  }

  void setTouching() {

  }

  void collision() {
    for (int i=0; i < numParticles;i++) {
      for (int j=0; j<i; j++) {
        if (dist(particle[i].loc.x, particle[i].loc.y, particle[j].loc.x, particle[j].loc.y) <= (30))
        {
          // swap velocity
          Vector3D vi = new Vector3D();
          Vector3D vj = new Vector3D();
          
          vi = particle[i].vel;
          vj = particle[j].vel;
   
          particle[i].vel = vj;
          particle[j].vel = vi;

          particle[i].touch();
          particle[j].touch();


          //particle[j].vel.y *= -1;


        }
        else {
          particle[i].touching = false;
          particle[j].touching = false;
        }
      }
    }
  }

  void drawPrts() {  
    for(int i = 0; i < numParticles; i++) { 
      particle[i].go();
    }
  } 
}

