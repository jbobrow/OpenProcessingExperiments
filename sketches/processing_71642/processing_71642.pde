
//inherit properties for Particle class from VerletParticle 2D

class Particle extends VerletParticle2D{
  float rad;
  
  Particle(float x,float y, float rad_){
  super(x,y);//so take from verletparticle class
  rad=rad_;
  }

  void display(){
    fill(0);
    stroke(0);
    ellipse(x,y,rad,rad);
  }
}


