
float topspeed = random(3, 8);
float affectdistance;
float attractionrange;

class Agent {
  PVector location;
  PVector velocity = new PVector(1, 1);
  float agentcolor = random(20, 50);
  float agentsize = random(1, 3);
  Agent (PVector LOCATION) {
    location = LOCATION;
  }
  void attract() {
    PVector movement;
    PVector mousepos = new PVector(mouseX, mouseY);
    // Step 1: direction
    PVector attraction = PVector.sub(mousepos, location);
    float attractionrange = mousepos.dist(location);
    if (attractionrange < affectdistance) {
      attraction.normalize();
      attraction.mult(closeradius);
      velocity.add(attraction);
      velocity.limit(topspeed);
      location.add(velocity);
    }
  }
  void avoid() {
    PVector movement;
    PVector mousepos = new PVector(mouseX, mouseY);
    PVector attraction = PVector.sub( location, mousepos);
    attraction.normalize();
    attraction.mult(closeradius);
    attractionrange = mousepos.dist(location);
    velocity.limit(topspeed);
    location.add(velocity);
    if (attractionrange < affectdistance) {
      velocity.add(attraction);
    }
  } 
  void display() {
    noStroke();
    fill(agentcolor);
    ellipse(location.x, location.y, agentsize, agentsize);
  }
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } 
    else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } 
    else if (location.y < 0) {
      location.y = height;
    }
  }
}




