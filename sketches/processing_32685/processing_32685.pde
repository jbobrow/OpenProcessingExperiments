
/* AGENT CLASS
 In this tab we are defining all of the properties and
 functions (also called methods) of our Agent object.
 To do this in processing you need to follow some quite
 strict syntax, be sure to have watched the genware videos
 and reffered to the processing reference - 
 http://processing.org/learning/objects/ - and tutorial 
 material before attempting to create this code. Try making 
 modifications or adding additional functions to demonstrate 
 an understanding of object oriented programming.*/




class Agent {

  //--------------------------------------------CLASS PROPERTIES


  PVector location;
  PVector velocity;
  float agentSize;
  int col;
  float r = random(255);
  float g = random(255);
  float b = random(255);


  //--------------------------------------------CLASS CONSTRUCTOR

  Agent(PVector LOCATION, float AGENTSIZE, int AGENTCOLOUR, PVector VELOCITY) {

    location = LOCATION;
    agentSize = AGENTSIZE;
    velocity = VELOCITY;
    col = AGENTCOLOUR;
  }

  //--------------------------------------------CLASS FUNCTIONS/METHODS

  void run() {

    render();
    updatePos();
    flock();
  }

  void render() {

    fill(r, g, b, 80);
    ellipse(location.x, location.y, agentSize, agentSize);
  }

  void updatePos() {

    location.add(velocity);

    if (location.x < 0) {
      location.x = width;
    }
    if (location.y < 0) {
      location.y = height;
    }
    if (location.x > width) {
      location.x = 0;
    }
    if (location.y > height) {
      location.y = 0;
    }
  }

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

          agentSize = agentSize-0.1;
        }


        if (agentDist < avoid) {

          PVector addVec = a.location.get();

          addVec.sub(location);

          addVec.mult(falloff/agentDist);

          velocity.sub(addVec);

          velocity.normalize();
        }
      }
      agentSize += 0.2;
    }  

    if (agentSize <2) {
      agentSize = 2;
    }

    if (agentSize >20) {
      agentSize = 20;
    }
  }
}


