
class Particle {

  PVector loc;
  PVector vel;
  PVector acc;
  PVector dir;
  PVector up;
  PVector origin;
  
  float timer;
  float maxspeed;
  float maxforce;
  float maxheight; 
  float tor_width;
  float t_x = width/2;
  float t_y = height/2;
  
  int j = 0;
  
  Particle(PVector l, float m, float wid, float hei, float lifetime, float tor_x, float tor_y) {
    
    acc = new PVector(0,0,0);
    vel = new PVector(random(-10,10),random(-10,10),0);
    
    t_x = tor_x;
    t_y = tor_y;
    
    up = new PVector(0,0,10);
    origin = new PVector(t_x,t_y,5);
    
    loc = l.get();
    
    timer = lifetime;
    maxspeed = m;
    maxheight = hei;
    tor_width = wid;
   
    maxforce = 0.5; 

  }

//////////////////////////////////////////////////

  void run(ArrayList particles) {
    
    tornado(particles);
    render(particles);

  }
  
////////////////////////////////////////////////
  
  void tornado(ArrayList particles) {
    
    PVector ali = align(particles);
    PVector tor = spin(particles);
    
    ali.mult(0.1);
    tor.mult(2.0);

    //acc.add(ali);
    acc.add(tor);
    
    update();
    borders();

  }

///////////////////////////////////////////////////

  void update() {
    
    float d = loc.dist(origin);
      
      if(loc.z > 50 && loc.z < 100) vel.add(up);
      
      if(loc.z > 5) {
        
        origin = new PVector(t_x + 25*cos(radians(loc.x)),t_y + 25*sin(radians(loc.y)),loc.z);
        
        dir = PVector.sub(origin,loc);
    
        dir.normalize();
        dir.mult(20);
       
        acc.add(dir);
        
        vel.add(acc);
        vel.limit(maxspeed);
        
      }
      
      else {
        
        dir = PVector.sub(origin,loc);
    
        dir.normalize();
        dir.mult(0.5);
        
        acc.add(dir);
        
        vel.add(acc);
        vel.limit(maxspeed);
      }
    
      if(loc.z >= maxheight  ||  loc.z < 0) {
        vel = new PVector(0,0,0);
        acc = new PVector(0,0,0);
      }
    
    loc.add(vel);
    
    timer -= 1.0;

  }
  
  void borders() {
    
    if(loc.z <= 0) loc.z = 0;
    if(loc.z >= maxheight) {
      timer = 0;
    }
    ////////////////
    if(loc.x >=  width) loc.x = 0;
    if(loc.x <= 0) loc.x = width;
    ///////////////
    if(loc.y >= height) loc.y = 0;
    if(loc.y <= 0) loc.y = height;
    
  }

  PVector spin(ArrayList particles) {
    
    PVector sum = new PVector(0,0,0);
    origin = new PVector(t_x,t_y,loc.z);
    
    for(int i = 0; i < particles.size(); i++) {
      
      float d = loc.dist(origin);
      if((d <= tor_width-25) && loc.z < maxheight/2) {
        
        sum.add(up);
        sum.normalize();
        sum.mult(1);
        
      }
      
    }
    
    return sum;
    
  }
  
  PVector align (ArrayList particles) {
    float neighbordist = 50.0;
    PVector sum = new PVector(0,0,0);

    for (int i = 0; i < particles.size(); i++) {

      Particle other = (Particle) particles.get(i);
      float d = loc.dist(other.loc);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.vel);
      }
    }
    return sum;
  }
        
/////////////////////////////////////////////// 

  void render(ArrayList particles) {

      stroke(timer,timer);
      point(loc.x,loc.y,loc.z);
  
  }

///////////////////////////////////////////////

  boolean dead() {

    if (timer <= 0.0) {
      return true;
    }

    else {
      return false;
    }
  }

}


