
//--------------------------------------------CLASS PROPERTIES
class Agent {

  // properties of our agent. We dont assign values yet!
  PVector location;
  PVector velocity;
  float agentSize;
  int r;
  int g;
  int b;
  //--------------------------------------------CLASS CONSTRUCTOR
  Agent (PVector LOCATION, float AGENTSIZE, int AGENTCOLOUR, PVector VELOCITY) {

    //assign the values of our objects properties
    location = LOCATION;
    agentSize = AGENTSIZE;
    velocity = VELOCITY;
    r =AGENTCOLOUR;
    g =AGENTCOLOUR;
    b =AGENTCOLOUR;
  }
  //--------------------------------------------CLASS METHODS

  void run () {
    render();
    updatePos();
  }
  //draw the agent
  void render() {
    //set the fill to the agentColour and draw an ellipse
    fill(r, g, b, 50);
    ellipse(location.x, location.y, agentSize, agentSize);
  }

  //update the position of the agent
  void updatePos() {
    location.add(velocity);

    if (location.x <0) {
      //agent off the left side of screen
      location.x = width;
    }
    if (location.x >width) {
      //agent off the right side of screen
      location.x = 0;
    }
    if (location.y >height) {
      //agent off the bottom side of screen
      location.y = 0;
    }
    if (location.y <0) {
      //agent off the top side of screen
      location.y = height;
    }
  }

  //loop through all other agents
  void flock() {

    float minDist =10000;

    //loop through the agents
    for (int i =0; i<agentPop.size(); i++) {
      Agent a = (Agent) agentPop.get(i);

      //create a float to store the distance between this agent and the
      //one we are currently looping through
      float agentDist = location.dist(a.location);

      //check if distance is 0, if it is we might be finding the current agent,
      //so lets skip this case.
      if (agentDist > 0) {

        if (agentDist<minDist) {
          minDist = agentDist;
        }

        //if we are quite close to another agent change the size
        if (agentDist < align) {
          PVector addVec =a.velocity.get();
          addVec.mult(falloff/agentDist);
          velocity.add(addVec);
          velocity.normalize();
          agentSize-=0.1;
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

    //changing the properties back to normal if not close to other agents
      agentSize+=0.2;
    //limit to min 4 pixels and max 8 pixels in size
    if (agentSize<4) {
      agentSize=4;
    }
    if (agentSize>8) {
      agentSize=8;
    }
  }
}


