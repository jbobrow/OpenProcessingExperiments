
//create a new class call Agent
class Agent {

  //create the variable date for the Agent: location, velocity, size and color
  PVector location = new PVector();
  PVector velocity = new PVector();
  float agentSize;
  color c;
  
  //define the construtor for the variables
  Agent(PVector _loc, PVector _vel, float _s, color _c) {

    location = _loc;
    velocity = _vel;
    agentSize = _s;
    c = _c;
  }
  
  //the command which will execute all the functionality written
  void run() {

    render();
    updatePos();
    flock();
  }
  
  /*define the appearences of the agent. It is an ellipse fill with color c and
  size specified in the setup. Its location is dependent on the resultant vector
  after it runs through all its functionality*/
  void render() {
    fill(c);
    ellipse(location.x, location.y, agentSize, agentSize);
  }
  
  /*to confine the agents within the screen so that when they move out of the
    screen, they give the illusion that they are coming out again from the other
    direction*/
  void updatePos() {

    location.add(velocity);

    if (location.x < 0) {
      location.x = width;
    }
    if (location.x > width) {
      location.x = 0;
    }
    if (location.y < 0) {
      location.y = height;
    }
    if (location.y > height) {
      location.y = 0;
    }
  }
  
  //define how the agents interact with each others
  void flock() {

    float minDist = 1000000;

    for (int i = 0; i < agentPop.size(); i++) {
      Agent a = (Agent) agentPop.get(i);

      float agentDist = location.dist(a.location);
      if (agentDist > 0) {
        if (agentDist < minDist) {
          minDist = agentDist;
        }

        if (agentDist < align) {
          PVector addVec = a.velocity.get();
          addVec.mult(falloff/agentDist);
          velocity.add(addVec);
          velocity.normalize();
          agentSize = agentSize - 0.1;
        }

        if (agentDist < avoid) {
          PVector addVec = a.location.get();
          addVec.sub(location);
          addVec.mult(falloff/agentDist);
          velocity.sub(addVec);
          velocity.normalize();
        }
      }
    }

    agentSize = agentSize + 0.2;
    agentSize = constrain (agentSize, 2, 25);
  }
}


