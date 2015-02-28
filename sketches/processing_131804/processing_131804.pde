
Mover[] movers = new Mover[15];

float gravConst = 2;

void setup() {
  size(500,500);
  for(int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
}

void draw() {
  background(20);
  
  for(int i = 0; i < movers.length; i++){
    for(int j = 0; j < movers.length; j++){
      if(i != j){
        PVector attraction = movers[i].attract(movers[j]);
        
        movers[j].applyForce(attraction);
      }
    }
    movers[i].update();
    movers[i].display();
  }
  
  if(mousePressed){
    for(int i = 0; i < movers.length; i++){
      movers[i] = new Mover();
    }
  }
}
class Mover {
  
  PVector loc;
  PVector vel;
  PVector acc;
  
  float aAcc;
  float aVel;
  float angle;
  
  float mass;
  float diameter;
  float radius;
  
  float oAmp;
  float oTimer;
  float oTimerRate;
  
  Mover() {
    loc = new PVector(random(width),random(height));
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    aAcc = 0;
    aVel = 0;
    angle = 0;
    mass = random(0.5,2);
    diameter = mass * 10;
    radius = diameter / 2;
    oAmp = radius * 1.5;
    oTimer = 0;
    oTimerRate = 0.01;
  }
  
  PVector attract(Mover m) {
    //target location (This attractor) - "current locaiton" (the mover being acted upon)
    PVector dir = PVector.sub(loc, m.loc);
    float distance = dir.mag();
    dir.normalize();
    
    distance = constrain(distance,5,25);
    
    float strength = gravConst * mass * m.mass / (distance*distance);
    
    dir.mult(strength);
    
    return dir;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    loc.add(vel);
    //aAcc = vel.x * 0.001;
    //aVel += aAcc;
    angle = atan2(vel.y,vel.x);
    //vel.limit(5);
    acc.mult(0);
  }
  
  void checkEdges() {
    if (loc.x > width) {
      vel.x *= -1;
      loc.x = width;
    } else if (loc.x < 0) {
      vel.x *= -1;
      loc.x = 0;
    }
    
    if (loc.y > height) {
      vel.y *= -1;
      loc.y = height;
    } else if ( loc.y < 0 ) {
      vel.y *= -1;
      loc.y = 0;
    }
  }
  
  void display() {
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(angle);
    
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(0,0, diameter,diameter);
    ellipseMode(CENTER);
    ellipse(radius,0, diameter,diameter);
    fill(100,100,255);
    ellipse(radius,radius/2, int(radius/2),int(radius/4));
    ellipse(radius,-radius/2, int(radius/2),int(radius/4));
    
    stroke(255,100,100);
    strokeWeight(int(radius/2));
    fill(255,100,100);
    float x = oAmp * sin(oTimer);
    oTimer += vel.mag()/5;
    line(-radius,0,x-diameter,0);
    ellipse(-radius,0, int(radius/2),int(radius/2));
    ellipse(x-diameter,0, int(radius/6),int(radius/6));
    
    
    popMatrix();
  }
  
}


