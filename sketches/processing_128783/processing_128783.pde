
// An array of objects
Mover[] movers = new Mover[1];
PVector wind = new PVector(0.05, 0);
PVector windFriction = new PVector(-0.0005, 0);
float t = 0.03;

void drawWind() {
  stroke(150);
  line(0, height/2, 25, height/2-10);
  line(0, height/2, 25+5, height/2);
  line(0, height/2, 25, height/2 +10);
}

void setup() {
  size(300, 200);
  background(#B2B449);
  for (int i = 0; i < movers.length; i++) {
    // Initialize each object in the array.
    movers[i] = new Mover();
  }
}

void draw() {
  background(#B2B449);

  for (int i = 0; i < movers.length; i++) {
    //[full] Calling functions on all the objects in the array
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
    //[end]
  }
  if (mousePressed)
  {
    for (int i = 0; i < movers.length; i++) {
      movers[i].applyForce(wind);
      drawWind();
    }
  }
  t = t + 0.3;
  for (int i = 0; i < movers.length; i++) {
    movers[i].applyForce2(windFriction);
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(random(25, 150), random(height/2.5 - 50, height/2.5 +50));
    velocity = new PVector(random(1, 2), 0);
    acceleration = new PVector(0, 0);
    topspeed = 4;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  // Display the Mover
  void display() {
    float noiseFactor = noise(t)*10/2;
    textSize(25);
    fill(125);
    text("|", location.x-4, location.y+44+noiseFactor);
    stroke(100);
    stroke(125);
    fill(#F1F545); 
    ellipse(location.x, location.y, 50, 56);
    fill(#F3F592);
    noStroke();
    ellipse(location.x+5, location.y, 25, 27);
  }

  void applyForce(PVector force)
  {
    acceleration.add(force);
  }

  void applyForce2(PVector force)
  {
    if (velocity.x < 0)
      acceleration.sub(force);
    else
      acceleration.add(force);
  }

  // What to do at the edges
  void checkEdges() {

    if (location.x > width-25) {
      //location.x = width;
      velocity.x = -1*velocity.x ;
      //windFriction.mult(-1);
    } 
    else if (location.x < 0+25) {
      //location.x = 55;
      velocity.x = -1*velocity.x;
      //windFriction.mult(-1);
    }

    if (location.y > height-25) {
      //location.y = height-55;
      velocity.y = -1*velocity.y;
    }  
    else if (location.y < 0+25) {
      //location.y = 55;
      velocity.y = -1*velocity.y;
    }
  }
}  
