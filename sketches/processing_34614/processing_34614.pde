
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////// AGENT CLASS OBJECT //////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////// AGENT CLASS OBJECT //////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

class agentA {

  PVector agentALocation;
  PVector agentAVelocity;
  float agentASize;
  int agentAColour;



  PVector locAgent, velAgent, turn, dir, mouseLoc;
  float agentDist, sensitivity, attraction, pastDist;

  agentA (PVector OBJECTALOCATION, PVector OBJECTAVELOCITY, float OBJECTASIZE, int OBJECTACOLOUR, float ATTRACTION, float SENSITIVITY) {
    agentALocation = OBJECTALOCATION;
    agentAVelocity =  OBJECTAVELOCITY;
    agentASize = OBJECTASIZE;
    agentAColour =   OBJECTACOLOUR;
    attraction = ATTRACTION;
    sensitivity = SENSITIVITY;
  }
  void run () {

    updatePos();

    // get the mouse location
    PVector mouseLoc = new PVector(mouseX, mouseY);
    dir = PVector.sub(mouseLoc, agentALocation); //direction of Agent to You
    agentDist = dir.mag();
    calculate();
    render();
  }
  void render () {
    noStroke ();
    // fill (255, 97, 3);

    fill (255, 97, 3, 800*1/agentDist);

    ellipse(agentALocation.x, agentALocation.y, agentASize, agentASize);
  }
  void updatePos () {
    agentALocation.add(agentAVelocity);

    if (agentALocation.x <0) {
      agentALocation.x= width;
      pastDist = width + height;
    }
    if (agentALocation.x >width) {
      agentALocation.x = 0;
      pastDist = width + height;
    }
    if (agentALocation.y <0) {
      agentALocation.y = height;
      pastDist = width + height;
    }
    if (agentALocation.y >height) {
      agentALocation.y = 0;
      pastDist = width + height;
    }
  }


  void calculate () {
    pastDist = agentDist;
 if (mouseMove <2) 
    if (agentDist < align) {
      if (agentDist < avoidance) {
        agentAVelocity.set(random(1,0), random(1,0), 0);
      }
      else {
        turn = PVector.mult(dir, sensitivity/agentDist);
        agentAVelocity.add(turn);
      }
    }
    else if (agentDist > pastDist) {
      turn = PVector.mult(dir, sensitivity/agentDist);
      turn.add(random(0, 0.5), random(0, 0.5), 0);
      agentAVelocity.sub(turn);
    }
    // this is mouse attractor
    else {
      {
      turn = PVector.mult(dir, attraction/agentDist);
      turn.add(random(0.1), random(0.1), 0);
      agentAVelocity.add(turn);
    }}
    agentAVelocity.normalize();
  }
}


