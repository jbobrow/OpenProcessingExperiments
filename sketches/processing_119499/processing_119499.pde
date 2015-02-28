
void setup()
{
  size(640, 480);
  background(0);
  smooth();  
  
  BlackHole bh = new BlackHole();
  
  for (int i = 0; i < (width + height); i = i+1) {
    new Blip(randomColor(), bh);
  }
  
  bh.display();
  
  //save("blackhole.jpg");
}

color randomColor() {
  int a = 55;
  int r = (int)random(50,255);
  int g = (int)random(180,255);
  int b = (int)random(50,255);
  
  return color(r,g,b,a);
};


class BlackHole {
  float mass;
  PVector location;
  float G;
  float size;
  float grippyness;
  
  BlackHole () {    
    location = new PVector(random(width),random(height));
    size = random(width/10,width/7);  
    mass = size/3;
    G = 1;        
    grippyness = 0.99; // multiplier of velocity to slow down Blips
  }
  
  void display() {
//    stroke(255,255,255,255);
//    strokeWeight(0.5);
    noStroke();
    fill(0,0,0,255);
    ellipse(this.location.x, this.location.y, size, size);
  }
  
  PVector attract(Blip b) {    
    // What’s the force’s direction?
    PVector force = PVector.sub(location,b.location);
    float distance = force.mag();
      
    distance = constrain(distance,3,10.0);
    
    force.normalize();
    float strength = (G * mass * b.mass) / (distance * distance);
    force.mult(strength);
       
    return force;
  }
  
  void grip(Blip b) {    
    PVector force = PVector.sub(b.location,location);
    float distance = force.mag();    
    if (distance < size) {      
      b.velocity.mult(grippyness);
    } 
  }
}


class Blip {
  int MAX_LENGTH = 1000; // number of steps incase it hits orbit
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  BlackHole bh;
  
  Blip (color c, BlackHole bh) {    
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-4,4), random(-4,4));
    
//    location = new PVector(100, 100);
//    velocity = new PVector(0, 0.8);
    
    acceleration = new PVector(0,0);
    mass = 1;
    
    this.bh = bh;
    
    // DRAWING
    stroke(c);    
    int i = 0;
    while (i < MAX_LENGTH) {
      if (isOnScreen()) {
        point(location.x, location.y);
      }      
      this.move();
      i++;
      
//      if (i == MAX_LENGTH) {
//        stroke(255);
//        point(location.x,location.y);
//      }
    } 
  }
  
  boolean isOnScreen () {
    if (location.x < 0)       return false;
    if (location.x > width)   return false; 
    if (location.y < 0)       return false; 
    if (location.y > height)  return false;
    return true;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void move () {            
    PVector force = bh.attract(this);
    this.applyForce(force);
    
    bh.grip(this);    
    
    velocity.add(acceleration);    
    location.add(velocity);
    acceleration.mult(0); // reset forces
  }
}


