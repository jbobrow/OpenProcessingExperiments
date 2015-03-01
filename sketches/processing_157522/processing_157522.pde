
Mover[] movers = new Mover[20];


void setup() {
  size(600, 500);
  background(255);
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  background(255);

  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();


    
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector force;//adding force
  PVector gravity;
  PVector wind;
  
  //float topspeed;
  
  //for baloon
  float mass;
  float xoff;
  int timeLoops;
  float maxSpeed;
  int r,g,b;
  float randomNoise;

  Mover() {
    location = new PVector(random(width), random(height-20));
    velocity = new PVector(0, random(0,0.3));
    //acceleration = new PVector(-0.001, 0.01);
    //topspeed = 5;
    
    acceleration = new PVector(0,random(0,0.3));
    
    mass = 1;
    xoff = 0.0;
    timeLoops = 0;
    maxSpeed = 8;
    randomNoise = random(0.0,0.5);
    r = round(random(255));
    g = round(random(255));
    b = round(random(255));
    
  }

  void update() {
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);
    
    dir.normalize();
    dir.mult(0.05);
    acceleration = dir;
    
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(random(200),random(100),random(200));
    strokeWeight(0.1);
    fill(random(0),random(200),random(255), 50);
    ellipse(location.x, location.y, 40, 40);
  }

  void checkEdges() {

    if (location.x > width) {
      //location.x = 0;
      velocity.x = velocity.x * -1;
    }
    else if (location.x < 0 ) {
      //location.x = width;
      velocity.x = velocity.x * -1;
    }

    if (location.y > height) {
      velocity.y = velocity.y * -1;
      location.y = 0;
    } 
    else if (location.y < 0) {
      velocity.y = velocity.y * -1;
      location.y = height;
    }
  }
  
  //adding force according Newton's second law
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  int ceilingCollision() {
    if (location.y < 40) {
      return timeLoops = 4;
    }else{
      return timeLoops = 0;
    }
  }
}



