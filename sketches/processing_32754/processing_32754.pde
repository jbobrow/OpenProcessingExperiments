
//--------------------------------------------CLASS PROPERTIES
class Agent {

  //properties of agents
  PVector location;
  PVector velocity;
  float agentSize;
  int r=10;
  int g=10;
  int b=10;

  //--------------------------------------------CLASS CONSTRUCTOR
  Agent (PVector LOCATION, float AGENTSIZE, int AGENTCOLOUR, PVector VELOCITY) {

    //assign the values of objects properties
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
    changeColour();
  }

  //draw the agent
  void render() {
    //set the fill to the agentColour and draw an ellipse
    fill(r,g,b,20);
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

  //loop through all other agents and change colour based on proximity
  void changeColour() {

    float minDist =10000;

    //loop through the agents
    for (int i =0; i<agentPop.size(); i++) {
      Agent a = (Agent) agentPop.get(i);

      //create a float to store the distance between this agent and the
      float agentDist = location.dist(a.location);

      //check if distance is 0, if it is we might be finding the current agent,
      //so lets skip this case.
      if (agentDist > 0) {

        if (agentDist<minDist) {
          minDist = agentDist;
        }

        //change Colour
        if (agentDist < 10) {
          if(r>80){
          r-=1;
          }
          agentSize+=0.1;
        }
        if (agentDist < 5) {
          if(g<5){
            r+=1;
          }
        }
      }
    }

    //start changing the properties back to normal if not close to other agents
    if (minDist>10 ) {
      //add to r channel if less than 255
      if(r>0){
        r-=1;
      }
      //subtract from green channel
      if(g>0){
        g-=1;
      }
      //shrink the agent
      agentSize-=0.05;
    }
    
    //limit to min 2 pixels and max 8 pixels in size
    if (agentSize<2) {
      agentSize=2;
    }
    if (agentSize>8) {
      agentSize=8;
    }
  }
}


