
class ParticleManager { 
   
  int numParticles = 10;  
  Particle[] particle = new Particle[numParticles];  
   
  void instantiatePrts() {  
    for(int i=0; i < numParticles; i++) {  
      particle[i] = new Particle(new Vector3D(0.01, 0.01), new Vector3D(random(0,1),random(0,1)), new Vector3D(random(0,1),random(0,1)));  
    } 
  }  
    
  void drawPrts() {  
    for(int i = 0; i < numParticles; i++) { 
      particle[i].go(); 
    } 
  } 
}

