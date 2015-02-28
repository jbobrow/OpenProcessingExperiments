
//////////////////////////////////////////////////////////////////////////////////////////
/////////////////// INSTALLATION DESIGN: PROJECT PROPOSAL     ////////////////////////////
/////////////////// NAME: MUHAMAD FIRADAUS KHAZIS ISMAIL      ////////////////////////////
/////////////////// STUDENT ID: 275827                        ////////////////////////////
/////////////////// PERFORMATIVE ARCHITECTURE STUDIO          ////////////////////////////
/////////////////// UNIVERSITY OF MELBOURNE                   ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
/* This sketch is the extension of the first task. The idea is to get the mouse as an
attractor point. The mouse is representing the audience.

Next task : 
1. To get the mouse delayed so that in real situation, an audience need to
stand for a few second, in order to get the agent allocated at a point for a certain duration
(depending on how long does the audience stand)
2. To get the colour attractor point working as mouse.

Pseudocode by Gwill.
Agent attracted to mouse created with much help from Mani.
Comment format referred from Viet
*/


//////////////////////////////////////////////////////////////////////////////////////////
/////////////////// INSTALLATION DESIGN: PROJECT PROPOSAL     ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

/* Declare ArrayList. This is a dynamic array with no set length - this way we can create
as many or as little agents as we want. All our little agents will be created and stored
here.
*/

ArrayList agentAPop = new ArrayList ();
ArrayList agentBPop = new ArrayList ();

float numAgentA = 4000;                   // -> Maximum number of agents for two classes
float numAgentB = 500;                   // -> Maximum number of agents for two classes

  float sensitivity; //how fast agents run away
  float attraction;  //how fast agents drawn to you

//Constants
float agentSize = 10;
float align = 50;
float avoidance = 4;

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////// SETUP ///////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

void setup () {
  float s = 5;
  int cA = 255;

  size (700, 400, P3D);
  background(0);


  for (int k = 0; k <numAgentA; k++) {
    PVector locA = new PVector(random(0, width), random(0, height), 0);
    PVector velA = new PVector(random(-0.0002, 0.0002), random(-0.0002, 0.0002), 0);
    // create a new instance of agentA class
    attraction = random(0, 1);  // how well they respend to you when moving closer
    sensitivity = random(0, 1);  // how badly they respend to you when moved away
    agentA newagentA = new agentA(locA, velA, s, cA, attraction, sensitivity);
    agentAPop.add(newagentA);
  }

 for (int k = 0; k <numAgentB; k++) {
  PVector locB = new PVector(random(width), random(height), 0);
  // direction of agentA switch from x to y direction if it hits agent B
  PVector velB = new PVector(random(-1, 1), random(-1, 1), 0);

  agentB newagentB = new agentB(locB, velB, s, cA, attraction, sensitivity);
  // add newagentA in agentAPop arralist
  agentBPop.add(newagentB);
 }
}

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////// DRAW  ///////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

void draw () {
  fill( 0,2);
  rect (0, 0, width, height);
  
  // looping through the population of agentA and 
  // running the run () from class agentA
  for (int i= 0 ; i < agentAPop.size (); i++) {
    agentA a = (agentA) agentAPop.get(i);
    // assigning the location onto individual a location
    PVector agentALocation = a.agentALocation;
    PVector agentAVelocity = a.agentAVelocity;
    a.run();


  }

    // looping through the population of agentB and 
    // running the run () from class agentB
    for (int j= 0 ; j < agentBPop.size (); j++) {
      agentB b = (agentB) agentBPop.get(j);
      PVector agentBLocation = b.agentBLocation;
      PVector agentBVelocity = b.agentBVelocity;
      b.run();

      // assigning agent A with behavior to avoid agent B
      // agentA is rectangle
      //agentB is ellipse



/*
      //making agentB follow mouse
      PVector mouseLoc = new PVector(mouseX, mouseY);
      PVector dir, turn;
      float distAgent, pastDist;
      float attraction = random(0, 1);  // how well they respend to you when moving closer
      float sensitivity = random(0, 1);  // how badly they respend to you when moved away

      //distAgent = pastDist;
      dir = PVector.sub(mouseLoc, b.agentBLocation); //direction of Agent to You
      distAgent = dir.mag();
      turn = PVector.mult(dir, attraction/distAgent);
      turn.add(random(0.1), random(0.1), 0);
      b.agentBVelocity.add(turn);
      b.agentBVelocity.normalize();
      */
    
  }
}




