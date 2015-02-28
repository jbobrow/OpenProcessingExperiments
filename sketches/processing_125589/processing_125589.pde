
ArrayList<DroneSystem> dsystem;
float w1=random(5), w2=random(5);
PVector target;
float r=.003;
void setup(){
  frameRate(60);
  size(1200,600);
  noStroke();
  dsystem = new ArrayList<DroneSystem>();
}


void draw(){
   
   target = new PVector(noise(w1)*width,noise(w2)*height);
   fill(0,255,0);
   w1+=r;
   w2+=r;
   ellipse(target.x,target.y,20,20);
    
  fill(0,60);
  rect(0,0,width,height);
  for (DroneSystem ds : dsystem){
    ds.separate(dsystem);
    ds.rund();
  }
}

void mousePressed() {
  dsystem.add(new DroneSystem(new PVector(mouseX,mouseY)));
}



class Drone{
  PVector location, velocity, acceleration, qloc, qvel;
  float maxspeed=15;
  float lifetime;
  int gathered;
  
  Drone(PVector loc){
    location = loc.get();
    velocity = new PVector(random(-7,7),random(-7,7));
    acceleration = new PVector(0,0);
    qloc= loc.get();
    qvel = new PVector(0,0);
    lifetime = random(180,240);
  }
  void run(){
orbit();
    display();
    seek(target);
  }
  void seek(PVector target){
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.div(1.5);
    desired.div(desired.magSq());
    velocity.add(desired);
    lifetime --;
   
  }
  
  void orbit(){
     acceleration.x=qloc.x-location.x;
     acceleration.y=qloc.y-location.y;
  }
  void display(){
    PVector gathercheck = location.get();
    gathercheck.sub(target);
    if(gathercheck.mag()<10){
      gathered+=15;
    }
    acceleration.normalize();
    acceleration.mult(2);
    velocity.add(acceleration);
    location.add(velocity);
    fill(255-gathered,255,255-gathered); 
    ellipse(location.x,location.y,5,5);
    if(velocity.mag()>maxspeed){
      velocity.mult(.95);
    }
    acceleration.mult(0);
  }
  
  boolean isDead() {
    if (lifetime < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
class DroneSystem {

  ArrayList<Drone> drones;
  PVector origin, PositionQ1, VelocityQ1, AccelerationQ1;
  int dronecount=0;

  DroneSystem(PVector d) {
    drones = new ArrayList<Drone>();
    origin = d.get();
    for (int i = 0; i < 6; i++) {
      drones.add(new Drone(origin));
      dronecount++;
    }
    VelocityQ1= new PVector(0,0);
    AccelerationQ1 = new PVector(0,0);
  }
  

  void rund(){
    count();
    if(dronecount<5){
      addDrone();
      dronecount ++;
    }
    wander(target);
  }
  
  void wander(PVector target){
    PVector desired = PVector.sub(target, origin);
    desired.normalize();
    desired.div(1);
    desired.div(desired.magSq());
    VelocityQ1.add(desired);
    
    fill(255,0,0);
     ellipse(origin.x, origin.y, 15, 15);
     if(origin.x>width){
        VelocityQ1.x=-15;
      }
      if(origin.x<0){
      VelocityQ1.x=15;
      }
      if(origin.y>height){
        VelocityQ1.y=-15;
      }
      if(origin.y<0){
        VelocityQ1.y=15;
      }
    VelocityQ1.normalize();
    VelocityQ1.div(10);
    origin.add(VelocityQ1);;
  }
  
  void separate (ArrayList<DroneSystem> dsystem) {
    float desiredseparation = 65;
    PVector sum = new PVector();
    int count = 0;
    for (DroneSystem other : dsystem) {
      float d = PVector.dist(origin, other.origin);
      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(origin, other.origin);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++;        
      }
    }
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(15);
      PVector steer = PVector.sub(sum, VelocityQ1);
      steer.limit(.1);      
      VelocityQ1.add(steer);
      origin.add(VelocityQ1);
    }
  }
  
  void count() {
    for (int i = drones.size()-1; i >= 0; i--) {
      Drone dr = drones.get(i);
      dr.run();
      if (dr.isDead()) {
        drones.remove(i);
        dronecount--;
      }
    }
  }

  void addDrone() {
      drones.add(new Drone(origin));
      
  }
}


