
// Creating an array of objects.
Mover[] movers = new Mover[10];
Mover[] movers2 = new Mover[50];

void setup() {
  size(800,500);
  smooth();
  background(0,100,200);
  // Initializing all the elements of the array
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(); 
  }
  for (int i = 0; i < movers2.length; i++) {
    movers2[i] = new Mover(); 
  }
}

void draw() {
  noStroke();
  fill(0,100,200,10);
  rect(0,0,width,height);

  // Calling functions of all of the objects in the array.
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display(); 
  }
    for (int i = 0; i < movers2.length; i++) {
    movers2[i].update2();
    movers2[i].checkEdges();
    movers2[i].display2(); 
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 4;
  }

  void update() {

    // Our algorithm for calculating acceleration:
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);  // Find vector pointing towards mouse
    PVector rand = new PVector(random(100)-50, random(100)-50);
    dir.add(rand);
    dir.normalize();     // Normalize
    dir.mult(0.5);       // Scale 
    acceleration = dir;  // Set to acceleration

    // Motion 101!  Velocity changes by acceleration.  Location changes by velocity.
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void update2() {

    // Our algorithm for calculating acceleration:
    Boolean doit = false;
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);  // Find vector pointing towards mouse
    if ((abs(dir.x) < 200)&&(abs(dir.y)<200)){doit = true;};
    PVector rand = new PVector(random(20)-10, random(20)-10);
    dir.normalize();     // Normalize
    dir.mult(0.5);       // Scale 
    acceleration = dir;  // Set to acceleration

    // Motion 101!  Velocity changes by acceleration.  Location changes by velocity.
    if(doit){velocity.sub(acceleration);};
    rand.mult(0.2);
    velocity.add(rand);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    stroke(100, 50, 0);
    fill(200, 100, 0);
    ellipse(location.x,location.y,13,13);
  }

  void display2() {
    stroke(100, 100, 50);
    fill(250, 150, 50);
    ellipse(location.x,location.y,20,20);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }

  }

}
