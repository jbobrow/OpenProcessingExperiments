
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
    PVector classlocation;
    PVector classvelocity;
    float classsize;
    color classcolour;
    
      /////////////////// CONSTRUCTOR ////////////////////////////////////  
      /* Constructor! Here we define what inputs the class will accept. */
    Agent(PVector _classlocation, PVector _classvelocity, float _classsize, color _classcolour) {
        /* So, let's push these inputs to their global variables equivalents, so that 
           they can be used globally. */
      classlocation = _classlocation;
      classvelocity = _classvelocity;
      classsize = _classsize;
      classcolour = _classcolour;
    }
    
      
      /////////////////// FUNCTIONS /////////////////////////////////////////////////// 
      /* Now to create the functions of the Agent. We can define its behaviour here. */
    void run() {
        /* When we create the Agent in the main code, and then call its associated 'run'
           function, it will perform the following things. */
      render();    // This will draw the actual agent.
      updatePos(); // This will move the agent.
      flock();     // This will dictate the behaviour of agents when they gather close.
    }
       
      /* Defining the render function. Draws the actual agent. */
    void render() {
      fill(classcolour);                                                // Sets the agent colour.
      ellipse(classlocation.x, classlocation.y, classsize, classsize);  // Draws agent at the classlocation and at the classsize.
    }
      
      /* Defining the updatePos function. Moves the agent, and keeps it on screen. */
    void updatePos() {
      classlocation.add(classvelocity);     // Moves agent. The updated position remains in location.
        /* The following ifs check if the agent has moved offscree. If so, it will moved to the 
           other side and continue its trajectory. The effect is like a torus plane. */
      if(classlocation.x < 0) {                 
        classlocation.x = width;                 
      }
      if(classlocation.x > width) {
        classlocation.x = 0;
      }
      if(classlocation.y < 0) {
        classlocation.y = height;
      }
      if(classlocation.y > height) {
        classlocation.y = 0;
      }
    }
    
      /* Defining the flock function. The interaction of agents as they approach each other. */
    void flock() {
      float minDist = 10000;
      
      for(int j = 0; j < agentPop.size(); j++) {
        Agent a = (Agent) agentPop.get(j);
        
        float classDist = PVector.dist(classlocation, a.classlocation);
        
        if(classDist > 0) {
          if(classDist < minDist) {
            minDist = classDist;
            
            if(classDist < align) {
              PVector addVec = a.classvelocity.get();
              addVec.mult(falloff/classDist);
              classvelocity.add(addVec);
              classvelocity.normalize();
              //classsize -= 0.1;
            }
            if(classDist < avoid) {
              PVector addVec = a.classlocation.get();
              addVec.sub(classlocation);
              //classlocation.sub(addVec);
              addVec.mult(falloff/classDist);
              //addVec.sub(classvelocity);    //// <<< maybe swap addVec and velocity?
              classvelocity.sub(addVec);
              classvelocity.normalize();
            }
          }
        }
      
      /*classsize += 0.2;
      
      if (classsize < 2) {
        classsize = 2;
      }
      if (classsize > 10) {
        classsize = 10;
      }*/
      
      }
    }
  }
  

