
//--------------------------------------------CLASS PROPERTIES
class Agent extends VerletParticle2D{

  //some properties of our agent. We dont assign values yet!
  float agentSize;
  int r, g, b;

  //--------------------------------------------CLASS CONSTRUCTOR
  Agent (Vec2D LOCATION, float AGENTSIZE, int AGENTCOLOUR, Vec2D VELOCITY) {

    super(LOCATION);
    this.addVelocity(VELOCITY);
    //assign the values of our objects properties
    agentSize = AGENTSIZE;
    r =AGENTCOLOUR;
    g =AGENTCOLOUR;
    b =AGENTCOLOUR;
  }
  //--------------------------------------------CLASS METHODS

  void run () {
    render();
    updateVel();
    flock();
  }

  //draw the agent
  void render() {
    //set the fill to the agentColour and draw an ellipse
    fill(r, g, b, 50);
    ellipse(this.x, this.y, agentSize, agentSize);
  }

  //update the position of the agent
  void updateVel() {
    //check screen position
    if (x <=0 || x>=width || y>=height || y<=0) {
      //push agent back towards the centre of the screen
      scaleVelocity(-1);
      addVelocity(new Vec2D((width/2)-x, (height/2)-y).normalize());
    }

  }

  //loop through all other agents and change colour based on proximity
  void flock() {
    //loop through the agents
    for (Agent a:agentPop) {
       //dont use self
      if (a!=this) {
      //check distance
      float agentDist = this.distanceTo(a.copy());
      
        //if we are quite close to another agent change the size and the colour
        if (agentDist < align) {
          Vec2D addVec =a.getVelocity();
          addVec.scaleSelf(falloff/agentDist);
          addVelocity(addVec);
          scaleVelocity(1/getVelocity().magnitude());
          agentSize-=0.1;
        }
      }
    }
    //start changing the properties back to normal if not close to other agents
      agentSize+=0.2;
    //limit to min 4 pixels and max 100 pixels in size
    if (agentSize<4) {
      agentSize=4;
    }
    if (agentSize>50) {
      agentSize=50;
    }
  }
}


