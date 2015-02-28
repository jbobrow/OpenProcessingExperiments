
particle [] Particle = new particle [1300];
particle p;

void setup () {
  size (800,800);
  frameRate (30);
  smooth();
  
  for (int i = 0; i <Particle.length; i++){
    Particle [i] = new particle (random(10,360));
  }
}

void draw () { 
  background (255);
  
 
  for (int i = 0; i <Particle.length; i++) {
    Particle [i].gyrate();
    Particle [i].render();
  }
}

