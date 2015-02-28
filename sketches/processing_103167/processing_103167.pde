
Mover[] movers = new Mover[200];

float g = 0.4;

void setup() {
  size(800,800);
  smooth();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1,1.5),random(width),random(height)); 
  }
}

void draw() {
  //background(255);
  fill(255,5);
  rect(0,0,width,height);
  
  if(mousePressed)
    {
      for(int i=0;i<movers.length;i++)
        {
          PVector force = movers[i].mouse();
          movers[i].applyForce(force);
        }
    }
  else
    {
      for (int i = 0; i < movers.length; i++) {
        for (int j = 0; j < movers.length; j++) {
          if (i != j) {
              PVector force = movers[j].attract(movers[i]);
              movers[i].applyForce(force);
        }
    }}
    for(int i=0;i<movers.length;i++)
        {
          movers[i].update();
    movers[i].display();
          
        }
    
  }

}

class Mover {

  PVector location;
  PVector p_location;
  PVector velocity;
  PVector acceleration;
  float mass;
  

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    p_location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    
    velocity.add(acceleration);
    p_location.set(location);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0,100);
    strokeWeight(2);
    //fill(100, 200);
    line(p_location.x,p_location.y,location.x,location.y);
    //ellipse(location.x, location.y, mass*24, mass*24);
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 5.0, 10.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

    float strength = (g * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
  }
  
  PVector mouse()
    {
      PVector m=new PVector(mouseX,mouseY);
      PVector force=PVector.sub(location,m);
      float distance=force.mag();
      distance=constrain(distance,5.0,10.0);
      force.normalize();
      
      float strength=(g*mass*mass)/(distance*distance);
      force.mult(strength);
      return force;
    }


}
