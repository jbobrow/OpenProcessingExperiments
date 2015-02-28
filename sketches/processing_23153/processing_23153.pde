
class Attractor{
  
  float mass;
  float G;
  PVector loc;
  boolean dragging=false;
  boolean rollover=false;
  PVector drag;
  
  
  Attractor(PVector l_, float m_, float g_){
    loc=l_.get();
    mass=m_;
    G=g_;
    drag=new PVector (0.0,0.0);
  }
  
  void go(){
    display();
    drag();
  }
    
   void mass(){
     mass=+1;
   }
   
  PVector attract(Fly f){
    PVector dir=PVector.sub(loc,f.location);
    float d=dir.mag();
    d=constrain(d,5.0,25.0);
    dir.normalize();
    float force=(G*mass*f.getMass())/(d*d);
    dir.mult(force);
    return dir;
  }
  void display(){
    ellipseMode(CENTER); 
    stroke(0);
    if(dragging)fill(random(0,50));
    else if(rollover)fill(100);
    else fill(random(100,200));
    ellipse(loc.x,loc.y,mass*2, mass*2);
  }
  void clicked(int mx, int my){
    float d=dist(mx,my,loc.x,loc.y);
    if(d<mass){
      dragging=true;
      drag.x=loc.x-mx;
      drag.y=loc.y-my;
    }
  }
  void rollover(int mx, int my){
    float d=dist(mx,my,loc.x,loc.y);
    if(d<mass){
      rollover=true;
    }else{
      rollover=false;
    }
  }

  void stopDragging() {
    dragging = false;
  }
  
 

  void drag() {
    if (dragging) {
      loc.x = mouseX + drag.x;
      loc.y = mouseY + drag.y;
    }
  }

}

