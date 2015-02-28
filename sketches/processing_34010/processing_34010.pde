
class Leaf {

  int numParticles;
  float px, py;
  float a, freq = 0.9;
  float killDist, killMax = .1, killMin = .01;
  float averageX, averageY;
  PVector sum = new PVector(0, 0);
  Particle[] p; 

  Leaf() {
    numParticles = int(random(50, 100));
    p = new Particle[numParticles];
    for (int i = 0; i < numParticles; i++) {
      p[i] = new Particle(random(0, width*.04), random(0, height*.04));
    }
  }

  void update(float cX, float cY) {
    pushMatrix();
    translate(cX, cY);
    a += freq;
    killDist();
    updateParticles();
    popMatrix();
  }


  void updateParticles() {
    sum.x = 0;
    sum.y = 0;
     for (Particle _p : p) {
     _p.drawMe(px, py, averageX, averageY, killDist);
     px = _p.x;
     py = _p.y;
     sum.x += _p.x;
     sum.y += _p.y;
     }
    averageX = sum.x/p.length;
    averageY = sum.y/p.length;
  }
  
  void killDist() {
    killDist = pow(abs(sin(radians(a))), 3) * killMax + killMin;
  }
}


