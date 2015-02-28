
/////////////////////////////////////////////////////////////////////////////////////////
//////////////////////// AGENT CLASS OBJECT /////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////

/* This class will contain all the functions (tasks) that the object will perform when
 called upon - this is done in the functions section. It will also outline the inputs 
 that the class will accept - this is done in the constructor section. We will write
 in the attributes and behaviour of the Agents in here, which includes how they will
 interact with each other, how they will move, and simply how they will be drawn and
 appear. 
 
 Pseudo-code by Gwyll.
 Written by Viet. */


/////////////////////////////////////////////////////////////////////////////////////////
//////////////////////// AGENT CLASS OBJECT /////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////

/* This class will be called Agent. */
class Agent {
  /* The properties or attributes of the class follow, aka class global variables. */
  PVector agentlocation;
  PVector agentvelocity;
  float agentsize;
  color agentcolour;

  /////////////////// CONSTRUCTOR ////////////////////////////////////  
  /* Constructor! Here we define what inputs the class will accept. */
  Agent(PVector _agentlocation, PVector _agentvelocity, float _agentsize, color _agentcolour) {
    /* So, let's push these inputs to their global variables equivalents, so that 
     they can be used globally. */
    agentlocation = _agentlocation;
    agentvelocity = _agentvelocity;
    agentsize = _agentsize;
    agentcolour = _agentcolour;
  }


  /////////////////// FUNCTIONS /////////////////////////////////////////////////// 
  /* Now to create the functions of the Agent. We can define its behaviour here. */
  void run() {
    /* When we create the Agent in the main code, and then call its associated 'run'
     function, it will perform the following things. */
    if(agentrender == 1){
    render();    // -> This will draw the actual agent if turned on.
    }
    updatePos(); // -> This will move the agent to the opposite border if it falls off the edge.
    flock();     // -> This will dictate the behaviour of agents when they gather close.
  }

  /* Defining the render function. Draws the actual agent. */
  void render() {
    fill(agentcolour);                                                // -> Sets the agent colour.
    ellipse(agentlocation.x, agentlocation.y, agentsize, agentsize);  // -> Draws agent at the agentlocation and at the agentsize.
  }

  /* Defining the updatePos function. Moves the agent, and keeps it on screen. */
  void updatePos() {
    agentlocation.add(agentvelocity);     // -> Moves agent. The updated position remains in location.
    /* The following ifs check if the agent has moved offscree. If so, it will moved to the 
     other side and continue its trajectory. The effect is like a torus plane. */
    if (agentlocation.x < 0) {                 
      agentlocation.x = width;
    }
    if (agentlocation.x > width) {
      agentlocation.x = 0;
    }
    if (agentlocation.y < 0) {
      agentlocation.y = height;
    }
    if (agentlocation.y > height) {
      agentlocation.y = 0;
    }
  }

  /* Defining the flock function. The interaction of agents as they approach each other. */
  void flock() {
    float minDist = 10000;

    for (int j = 0; j < agentPop.size(); j++) {
      Agent a = (Agent) agentPop.get(j);

      float agentdist = PVector.dist(agentlocation, a.agentlocation);

      if (agentdist > 0) {
        if (agentdist < minDist) {
          minDist = agentdist;

            /* Causes agents to align and move parallel with each other when they get close. */
          if (agentdist < align) {
            PVector addVec = a.agentvelocity/*.get()*/;
            addVec.mult(falloff/agentdist);
            agentvelocity.add(addVec);
            agentvelocity.normalize();
          }
            /* Causes agents to keep a minimum distance between each other. */
          if (agentdist < avoid) {
            PVector addVec = a.agentlocation/*.get()*/;
            addVec.sub(agentlocation);
            addVec.mult(falloff/agentdist);
            agentvelocity.sub(addVec);
            agentvelocity.normalize();
          }
        }
      }
    }
  }
}


