
Bird[] birds = new Bird[5];
Fly[] flies = new Fly[10];

void setup(){
 size(600, 600);
 background(0);
 for(int i=0; i<birds.length; i++){
   birds[i] = new Bird();
 } 
 for(int i=0; i<flies.length; i++){
   flies[i] = new Fly();
 } 
}

void draw(){
  background(0);
  
  for(int i=0; i<flies.length; i++){
   flies[i].update();
   flies[i].checkEdges();
   flies[i].display();
  }
  
  for(int i=0; i<birds.length; i++){
   birds[i].update();
   birds[i].checkEdges();
   birds[i].display();
  }
}

class Bird {
  PVector location;
  PVector velocity;
  PVector acceleration;


  Bird() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update() {
    for (Fly fl : flies) {
      if (location.dist(fl.location) < 30) {
        PVector dir= PVector.sub(fl.location, location);
        dir.normalize();
        dir.mult(0.5);
        acceleration = dir;
        break;
      }
      else {
        acceleration.x = random(-0.2, 0.2);
        acceleration.y = random(-0.2, 0.2);
      }
    }

    velocity.add(acceleration);
    velocity.limit(5);
    location.add(velocity);
  }

  void display() {
    stroke(0);
    fill(150);
    ellipse(location.x, location.y, 16, 16);
  }

  void checkEdges() {
    if ((location.x > width) ||(location.x < 0)) {
      velocity.x *= -1;
    } 
    if ((location.y > height) ||(location.y < 0)) {
      velocity.y *= -1;
    }
  }
}

class Fly {
  PVector location;
  PVector velocity;
  PVector acceleration;
  Random accx = new Random();
  Random accy = new Random();

  Fly() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update() {
    if(random(100) <100){
    acceleration.x = random(-1, 1);
    acceleration.y = random(-1, 1);
    }
    else {
    acceleration.x = 0;
    acceleration.y = 0;
    }
    velocity.add(acceleration);
    velocity.limit(3);
    location.add(velocity);
  }
  

  void display() {
    stroke(0);
    fill(255);
    ellipse(location.x, location.y, 7, 7);
  }

  void checkEdges() {
    if ((location.x > width) ||(location.x < 0)) {
      velocity.x *= -1;
    } 
     if ((location.y > height) ||(location.y < 0)) {
      velocity.y *= -1;
    } 
  }
}
