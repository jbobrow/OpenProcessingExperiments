
int scene_w = 500;
int scene_h = 500;

float n_m = 200;
ArrayList<Mob> mobs;

void setup() {
  size(500,500);
  colorMode(HSB,100);
  noStroke();
  background(0,100,0);
  
  mobs = new ArrayList<Mob>();
  for(int i = 0 ; i < n_m ; i++) {
    float x = random(0,500);
    float y = random(0,500);
    float vx = random(-2.0,2.0);
    float vy = random(-2.0,2.0);
    float ax = 0.0;
    float ay = 0.0;
    float w = random(0.1,5.0);
    mobs.add(new Mob(x,y,vx,vy,ax,ay,w));
  }
}

void draw() {
  fill(0,0,100,1);
  rect(0,0,width,height);
  for(int i = 0 ; i < mobs.size() ; i++) {
    Mob m = mobs.get(i);
    Mob m2 = (Mob)m.closest(mobs);
    if(m2 != null && dist(m.location.x,m.location.y,m2.location.x,m2.location.y) < 50.0) {
      if(m2.getSize() < m.getSize()) {
        m.arrive(m2.getLocation());
        /*if(dist(m.location.x,m.location.y,m2.location.x,m2.location.y) < 3.0) {
          mobs.remove(m2);
          m.w += 1.0;
        }*/
      } else {
        m.flee(m2.getLocation());
      }
    }
    m.update();
    m.display(); 
  }
}
class Mob extends Mover {
  
  float w;
  
  Mob(float x, float y, float vx, float vy, float ax, float ay,float w) {
    super(x,y,vx,vy,ax,ay);
    this.w = w;
  }
  
  void display() {
    fill(0,100,0);
    ellipse(location.x,location.y,w,w);
    //line(location.x,location.y,location.x-velocity.x*w,location.y-velocity.y*w);ation.x,location.y,w,w);    
  }
  
  float getSize() {
    return w; 
  }
}
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;
  float maxspeed;
 
  Mover(float x, float y, float vx, float vy, float ax, float ay) {
    acceleration = new PVector(ax,ay);
    velocity = new PVector(vx,vy);
    location = new PVector(x,y);
    r = 3.0;
    maxspeed = 2;
    maxforce = 0.1;
  }

  void update() {
     if(location.x < 0) {
      applyForce(new PVector(velocity.mag(),0.0));
    }
    if(location.x > scene_w ) {
      applyForce(new PVector(-velocity.mag(),0.0));
    }
    if(location.y < 0) {
      applyForce(new PVector(0.0,velocity.mag()));
    }
    if(location.y > scene_h) {
      applyForce(new PVector(0.0,-velocity.mag()));
    }
    
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void arrive(PVector target) {
    PVector desired = PVector.sub(target,location);
    float d = desired.mag();
    desired.normalize();
    if (d < 50) {
      float m = map(d,0,10,0,maxspeed);
      desired.mult(m);
    } else {
      desired.mult(maxspeed);
    }
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void flee(PVector target) {
    PVector desired = PVector.sub(target,location);
    desired.mult(-1.0);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  Mover closest(ArrayList<? extends Mover> movers) {
    int index = 0;
    float d = MAX_FLOAT;
    for(int i = 0 ; i < movers.size() ; i++) {
      Mover m = movers.get(i);
      float distance = dist(m.location.x,m.location.y,location.x,location.y);
      if(distance < d && m != this) {
        d = distance;
        index = i; 
      }
    }
    if(movers.size() > 0) {
      return movers.get(index);
    } else {
      return null; 
    }
  }
  
  PVector getLocation() {
    return location; 
  }
  
  PVector getVelocity() {
    return velocity;
  }
  
  String toString() {
     return "x is "+location.x+" y is "+location.y+" vx is "+velocity.x+" vy is "+velocity.y; 
  }
}


