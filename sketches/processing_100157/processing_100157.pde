
class Particle {
  
  PVector current;
  PVector previous;
    
 
  float speed;
  float phi;
  float theta;
    
 
  float gravity = 0;
 
  Particle(float x, float y) {
    
    theta = random(0,628) * 0.01;
    phi = random(0,314) * 0.01;
    speed = random(1,40);
    current = new PVector(x, y, 0);
    previous = current.get();
  }
    
 
  void update() {
 
    previous = current.get();
      
 
    float sctheta = speed * cos(theta);
      
    
    PVector next = new PVector(sctheta * cos(phi) - 0.035 * current.z, speed * sin(theta) - gravity, sctheta * sin(phi) + 0.035 * current.x);
    current.add(next);
  
  
 
    gravity += 0.3;
    speed *= 0.98;
      
 
    isoLine(current,previous);
  }
}
 void isoLine(PVector begin, PVector end) {
  
  PVector newBegin = new PVector(int(begin.x - begin.z), int((begin.x + begin.z)/2 - begin.y));
  PVector newEnd = new PVector(int(end.x - end.z), int((end.x + end.z)/2 - end.y));
    
   
  stroke(begin.x + 300);
    
 
  line (newBegin.x, newBegin.y, newEnd.x, newEnd.y);
}


