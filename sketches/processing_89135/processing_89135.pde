
ParticleSystem ps;

void setup() {  //setup function called initially, only once
  size(400, 300);
  smooth();  //set background white
 ps = new ParticleSystem(new PVector(width/2, height/2); 
}

void draw() {  //draw function loops 
  background();
  if(random(1) < 0.01) { 
    ps.addParticle(); 
    }
    
    ps.run();
  
  
  }
