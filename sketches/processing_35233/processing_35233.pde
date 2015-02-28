
/* REPELLED AGENT CLASS
 
 
 AAgent is attracted by mouse.
 
 
 */



class AAgent {

  //--------------------------------------------CLASS PROPERTIES




  PVector agentALocation;
  PVector agentAVelocity;
  float agentSize;
  int col;


  PVector locAgent, velAgent, turn, dir, mouseLoc;
  float distAgent, sensitivity, attraction, pastDist;

  //--------------------------------------------CLASS CONSTRUCTOR


  //refer to the Class syntax, and define the Agent Constructor.


  AAgent (PVector LOCATION, PVector VELOCITY, float AGENTSIZE, int AGENTCOLOUR, float ATTRACTION, float SENSITIVITY) {

    agentALocation = LOCATION;
    agentAVelocity = VELOCITY;
    agentSize = AGENTSIZE;

    col = AGENTCOLOUR;
    attraction = ATTRACTION;
    sensitivity = SENSITIVITY;
  }

  //--------------------------------------------CLASS METHODS



  void run () {
   
    //run render
    render();
    //run updatePos
    updatePos();
    //mouse location
    PVector mouseLoc = new PVector(mouseX, mouseY);
    dir = PVector.sub(mouseLoc, agentALocation); //direction of Agent to You
    distAgent = dir.mag();
 
    flocktowards();
    Collision();
  }

void Collision() {


    for (int j = 0; j <RagentPop.size(); j++) {
      RAgent R = (RAgent) RagentPop.get(j);
      float distance = R.agentRLocation.dist(agentALocation);

      if (distance < 5) {
        col = color(random(255),random(255),random(255));
        
      }
    }
  }

  void render () {
    //set the fill to the agentColour and draw an ellipse
    fill(col);
    //at the coordinates of our location Pvector, with width
    ellipse (agentALocation.x, agentALocation.y, agentSize, agentSize);

  }



  void updatePos () {

    agentALocation.add(agentAVelocity);

    //Now lets do our checks. Hint - these are done with if statements
    //http://processing.org/learning/basics/conditionals1.html

    //check if the x coordinate of location is less than 0
    //(this means we are off the left hand side of the screen)
    //if it is, make the x coordinate of location equal to
    //the width of the screen.
    if ( agentALocation.x < 0) {
      agentALocation.x = width;
    }

    if (agentALocation.x > width) {
      agentALocation.x = 0;
    }

    if (agentALocation.y < 0) {
      agentALocation.y = height;
    }

    if (agentALocation.y > height) {
      agentALocation.y = 0;
    }


  }


  void flocktowards () {

    pastDist = distAgent;
    if (distAgent < align) {
      if (distAgent < avoidance) { 
        agentAVelocity.set(random(1.0), random(1.0), 0);
      } 
      else { 
        turn = PVector.mult(dir, sensitivity/distAgent);
        agentAVelocity.add(turn);
      }
    } 
    else if (distAgent > pastDist) { 
      turn = PVector.mult(dir, sensitivity/distAgent);
      turn.add(random(0, 0.5), random(0, 0.5), 0);
      agentAVelocity.sub(turn);
    } 

    else {
      turn = PVector.mult(dir, attraction/distAgent);
      turn.add(random(0.1), random(0.1), 0);
      agentAVelocity.add(turn);

    }

    agentAVelocity.normalize();



    agentSize = agentSize + 0.5;
   

    if (agentSize <6) {
      agentSize=6;
    }

    if (agentSize > 13) {
      agentSize= 13;
    }
  }

  
}





