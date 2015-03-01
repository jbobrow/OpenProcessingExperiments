
 
Mover[] movers = new Mover[500]; 

 
void setup(){
  size(800, 600);
  smooth();  
  noStroke();
  background(255);
   
  for(int i=0; i<movers.length; i++){
    movers[i] = new Mover(new PVector(random(0, width), random(0, height)), 5, 10, 20);
  }
}
 

void draw(){
//  background(255);
  fill(255, 55);
  rect(0, 0, width, height);
   
  for(int i=0; i<movers.length; i++){
    movers[i].run(mouseX, mouseY);
  }
    for (int i = 0; i < movers.length; i++) {
    
      for (int j = 0; j < movers.length; j++) {
      
        if (i != j) {
        
          PVector repel = movers[j].antiattract(movers[i]);
        
        movers[i].applyRepel(repel);
 
        }
}
}
}
 


class Mover{

  PVector loc; 
  PVector vel; 
  PVector acc;
  int sz; 
  float gravity;
  float mass; 
  int velocityLimit = 2;  
  float d;
  int repelLimit = 3;
 
  
  Mover(PVector _loc, int _sz, float _gravity, float _mass){
    loc = _loc.get();  
    vel = new PVector(0, 0);  
    acc = new PVector(0, 0);
    sz = _sz;
    gravity = _gravity;
    mass = _mass;
  }
   

  void display(){
    ellipseMode(CENTER);
    fill(random(255));
    ellipse(loc.x, loc.y, sz, sz);
  }

  void attraction (float tx, float ty){
    PVector targetLoc = new PVector(tx, ty);  
    PVector dir = PVector.sub(loc, targetLoc);  
    d = dir.mag();  
    dir.normalize();
    dir.mult(-1);
   
    float force = (gravity*mass*mass) / (d);
     
    applyForce(dir);
  }
   

  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acc.add(f);
  }
  
  void applyRepel(PVector repel) {
    PVector r = PVector.div(repel,mass*mass/2);
    acc.add(r);
  }
  
  PVector antiattract(Mover movers) {
    PVector repel = PVector.sub(loc, movers.loc);             
    float distance = repel.mag();                                                             
    repel.normalize();       
    repel.limit(repelLimit);
  

    float strength = (-gravity * mass) / (distance * distance); 
    repel.mult(strength);                                        
    return repel;
    
  }
  
   void bounds(){
    if(loc.y > height || loc.y < 0){
      vel.y *= -1;
    }
    if(loc.x > width || loc.x < 0){
      vel.x *= -1;
    }
  }
   
  void update(){
    vel.add(acc);
    vel.limit(velocityLimit);
    loc.add(vel);
    acc.mult(0);
  }
   
  void run(float tx, float ty){
    attraction(tx, ty);
    display();
    bounds();
    update();
  }
}



