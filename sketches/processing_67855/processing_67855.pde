
// Agent Superclass

class Agent {
  
  PVector loc;
  PVector vel;
  PVector acc;
  int agentIndex;
  int closestAnchorID;
  int pCount;
  String  agentType = "Agent";

  // Constructor
  Agent(float x, float y) {
    acc = new PVector(0,0);
    vel = new PVector(random(-1,1),random(-1,1));
    loc = new PVector(x,y);
    agentIndex=0;
    closestAnchorID=0;
    pCount = 0;

  }

 // calculates new location
 void step(AgentSystem world, int index){
 }
 
 
  // applies repeller force
  void applyForce(PVector force) {
  float mass = 1; // We aren't bothering with mass here
  force.div(mass);
  acc.add(force);
  }
 
    // world (bounding box)
    void borders() {

    if(loc.x<0+margin){
      vel.x *= -1;
      loc.x = 0+margin;
     }else if(loc.x>width-margin){
      vel.x *= -1;
      loc.x = width-margin;
     }
    if(loc.y<0+margin){
      vel.y *= -1;
      loc.y = 0+margin;
    }else if(loc.y>height-margin){
      vel.y *= -1;
      loc.y = height-margin;
    }  
  }


} // end of class


