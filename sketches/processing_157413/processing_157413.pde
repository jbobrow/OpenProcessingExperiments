

Mover[] movers = new Mover[5000];

PVector center;

void setup() {
  size(300,300);
  smooth();
  
  textSize(10);
  textAlign(CENTER,CENTER);
  center = new PVector(width/2, height/2);
  for(int i = 0; i < movers.length ; i ++ ) {
    movers[i] = new Mover(random(width), random(height), 1);
  }
}

void draw() {
  fill(255);
  text("dist: " +distC,20,20);
  background(0);
  for(int i = 0; i < movers.length; i ++ ) {
    movers[i].applyForce(gravity(movers[i]));
    movers[i].display();
  }
}

 int distC = 10;
 PVector gravity(Mover mov) {
    
      PVector force = PVector.sub(center, mov.position);
      float distance = force.mag();
      distance = constrain(distance,distC,distC);
      float m = (mov.mass) / (distance * distance);
      force.normalize();
      force.mult(m);
      return force;
  }
  
  void keyPressed() {
    if(key == '=') {
      distC++;
    } else if(key== '-') {
      distC--;
    }
  }

class Mover {
   PVector position;
   PVector velocity;
   PVector acceleration;
   float mass;
   float size;
  
  Mover(float x, float y, float m) {
    position = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
    mass = m;
    size = 1;
    
  }
 
  void applyForce(PVector force) {
    PVector f = force.get();
    f.mult(1/mass);
    acceleration.add(f);
  } 
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    
    update();
    //checkEdges();
    
    pushStyle();
    noStroke();
    //strokeWeight(1);
    fill(255);
    ellipse(position.x, position.y, size, size);
    popStyle();
  }

}


