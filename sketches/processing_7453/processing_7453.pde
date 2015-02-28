
class Blade {
  ParticleSystem bladeSystem;
  Particle[] bladeParticles, bladeAxisParticles;
  
  int numPoints;
  color c1, c2;
  
  Blade(float _bladeLength, float _particleDist, PVector _root, color _c1, color _c2) {
    numPoints = (int) (_bladeLength / _particleDist);
    bladeSystem = new ParticleSystem(GRAVITY, DRAG);
    bladeParticles = new Particle[numPoints];
    bladeAxisParticles = new Particle[numPoints];
    c1 = _c1; c2 = _c2;
    
    for(int i=0; i<numPoints; i++) {
      bladeParticles[i]=bladeSystem.makeParticle(1.0, _root.x, (_root.y-i*_particleDist), _root.z);
      bladeAxisParticles[i]=bladeSystem.makeParticle(1.0, _root.x, (_root.y-i*_particleDist), _root.z);
      bladeAxisParticles[i].makeFixed();
      if (i>0)
        bladeSystem.makeSpring(bladeParticles[i-1], bladeParticles[i], SPRING_STRENGTH, 
          SPRING_DAMPING*map(i, 0, numPoints, 1, 0.02), _particleDist);   
   
       bladeSystem.makeSpring(bladeAxisParticles[i], bladeParticles[i], SPRING_STRENGTH*map(i, 0, numPoints, 1, height/_bladeLength*0.2), 
        SPRING_DAMPING*map(i, 0, numPoints, 1, 0.02), 0);    
    }
  }
  
  void update() {
    bladeSystem.tick();
  }
  
 void display() {
   fill(c1);
   beginShape(TRIANGLE_STRIP);
   for(int i=0;i<numPoints;i++){     
     vertex(bladeParticles[i].position().x(), bladeParticles[i].position().y(), bladeParticles[i].position().z());
     vertex(bladeParticles[i].position().x()+(numPoints-i)/12.0,bladeParticles[i].position().y(), bladeParticles[i].position().z());
   }
   endShape();
   
   fill(c2);
   beginShape(TRIANGLE_STRIP);
   for(int i=0;i<numPoints;i++){     
     vertex(bladeParticles[i].position().x(), bladeParticles[i].position().y(), bladeParticles[i].position().z());
     vertex(bladeParticles[i].position().x()-(numPoints-i)/12.0,bladeParticles[i].position().y(), bladeParticles[i].position().z());
   }
   endShape();
  }

  void setWind(PVector wind) {
    for (int i=0; i<numPoints; i++)
      bladeParticles[i].velocity().add(map(i, 0, numPoints, 0.01, wind.x), 
      0, map(i, 0, numPoints, 0.01, wind.z));
  }
}

