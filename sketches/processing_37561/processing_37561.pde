

// random flocking boids
class Agent {

  //--------------------------------------------CLASS PROPERTIES


  PVector location;
  PVector velocity;
  float agentSize = 8;
  int col = 50;
  Boolean running;

  //--------------------------------------------CLASS CONSTRUCTOR


  Agent (PVector LOCATION, float AGENTSIZE, int AGENTCOLOUR, PVector VELOCITY) {

    location = LOCATION;
    agentSize = AGENTSIZE;
    velocity = VELOCITY;
    col = AGENTCOLOUR;
    running = true;
  }



  void run () {

    //run render
    render();
    
    //run update and flock, with boolean true
    if(running == true){
    updatePos();
    flock();
    }
    
    
    
    //new function, to stop agent from moving and connect the agent to the node
    connect();
  }


  void render () {

    fill(col);
    ellipse (location.x, location.y, agentSize, agentSize);
  }


  //updates the position of the agents
  void updatePos () {


    location.add(velocity);

    if ( location.x < 0) {
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




  //function to stop agent from moving when it gets close to a node, connect the agent to the node with a new spring/line

  void connect() {
   //if the agent is less than 100 units away from ANY node, at the moment we are stopping it.
   //What we want to do is create a check, so that if the agent is more than 100 units away from
   //every single node, then we start running the agent again. So we create a boolean value
   //that by default is false. And then we only make this value true if we are close to some node.
   //Then after the loop if this false is still true we know we are far away from all the nodes.
    Boolean closeToNode = false;
 
    //loop through all the nodes in the list
    for (int i = 0 ; i < nodes.length; i++) {
      Node checkNode = nodes[i];
      float distance = dist(location.x, location.y, checkNode.x, checkNode.y);

      if (distance < 50) {  
        //activates the drawing of springs if float distance is less than integer
        closeToNode = true;
        //stops updatePos and flock with false boolean
        running = false;

        // draw springs
        stroke(100);
        strokeWeight(0.5);
          line(checkNode.x, checkNode.y, location.x, location.y);
      }
    }
    
    //now lets see if we are not close to any nodes
    if(closeToNode == false){
     //if agents are not close to nodes, they resume random flocking
      running = true;
    }
  }



  void flock () {

    float minDist = 1000000;

    for (int k = 0; k < agentPop.size(); k++) {

      Agent a = (Agent) agentPop.get(k);

      float agentDist = PVector.dist(location, a.location);

      if (agentDist > 0) {


        if (agentDist < minDist) {
          minDist = agentDist;
        }

        if (agentDist < align) {


          PVector addVec;
          addVec = a.velocity.get();

          addVec.mult(falloff/agentDist);


          velocity.add(addVec);

          velocity.normalize();

          agentSize = agentSize - 0.1;
        }

        if (agentDist < avoid) {

          PVector addVec = a.location.get();

          addVec.sub(location);
          addVec.mult(falloff/agentDist);
          addVec.sub(velocity);
          velocity.normalize();
        }
      }
    }
  
    if (agentSize < 8) {
      agentSize=8;
    }

    if (agentSize > 8) {
      agentSize= 8;
    }
  }
}

//now you can end your loop through the agent population


