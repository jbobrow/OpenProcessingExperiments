
// Declare Mover object
Mover mover;
Mover mover2;
Mover mover3;

void setup() {
  size(500,500);
  smooth();
  background(255);
  // Make Mover object
  mover = new Mover(1); 
  mover2 = new Mover(2); 
  mover3 = new Mover(3);
}

void draw() {
  noStroke();
  fill(255);
  rect(0,0,width,height);
  
  // Call functions on Mover object.
  mover.update();
  mover.checkEdges();
  mover.display(); 
  mover2.update();
  mover2.checkEdges();
  mover2.display();
   mover3.update();
  mover3.checkEdges();
  mover3.display();
  
}

class Mover {

  // Our object has two PVectors: location and velocity
  PVector location;
  PVector velocity;
  int check;

  Mover(int x) {
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2),random(-2,2));
    check = x;
  }

  void update() {
    // Motion 101: Locations changes by velocity.
    location.add(velocity);
  }

  void display() {
    noStroke();
    fill(0);
    ellipse(location.x,location.y,30,30);
    fill(255);
    if(check == 1)
    triangle(location.x+15*cos(radians(-90)),location.y+15*sin(radians(-90)),location.x+15*cos(radians(30)),location.y+15*sin(radians(30)),location.x+15*cos(radians(150)),location.y+15*sin(radians(150)));
    if(check ==2){
    rect(location.x - 10, location.y-5,20, 10);
    rect(location.x - 5, location.y-10,10, 20);
    if(check == 3){
    rect(location.x - 10, location.y, 10, 10);
    rect(location.x - 5, location.y-10, 10, 20);
    }
    }
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = width;
      velocity.x = -velocity.x;
    } else if (location.x < 0) {
      location.x = 0;
       velocity.x = -velocity.x;
    }
    
    if (location.y > height) {
      location.y = height;
      velocity.y = -velocity.y;
    } else if (location.y < 0) {
      location.y = 0;
      velocity.y = -velocity.y;
    }

  }

}
