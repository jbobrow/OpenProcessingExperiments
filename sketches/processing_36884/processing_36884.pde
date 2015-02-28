

class Agent {


  PVector pubTransDisVector;
  float pubTransDist;
  //public transport spot

  PVector prvtCarDisVector;
  float prvtCarDist;
  PVector location;
  PVector velocity;
  float agentSize;
  PVector locAgent, velAgent, turn, dir, mouseLoc;
  float agentDist, sensitivity, pastDist;
  int agentColour;


  Agent (PVector OBJECTALOCATION, PVector OBJECTAVELOCITY, float AGENTSIZE, int AGENTCOLOUR) {

    location = OBJECTALOCATION;
    velocity =  OBJECTAVELOCITY;
    agentSize = AGENTSIZE;
    agentColour = AGENTCOLOUR;
  }


  void run () {
    //     repel();
    updatePos();

    // get the mouse location
    PVector mouseLoc = new PVector(mouseX, mouseY);
    dir = PVector.sub(mouseLoc, location); //direction of Agent to You


    //get the agent distance to public transport
    pubTransDisVector = PVector.sub(pubTransLoc, location);
    pubTransDist = pubTransDisVector.mag();
    //get the agent distance to public transport

    prvtCarDisVector = PVector.sub(prvtCarLoc, location);
    prvtCarDist = prvtCarDisVector.mag();
    //get the agent distance to public transport


    publicTransport();


    privateCar ();

    agentDist = dir.mag();
    // calculate();
    render();
  }
  void render () {
    noStroke ();

    
    if (pubTransDist < publicTransportRadius) {
   // color green 
    fill (97, 255, 3, 20);}
    
    
    else if (prvtCarDist < carPrice) {
      
  fill (255, 97, 3, 20);}
  else {
   fill (0, 0,0);}
    ellipse(location.x, location.y, agentSize, agentSize);

    // public transport point
    //fill( 1, 255, 255, 20);
    // ellipse(200, 200, 50, 50);
  }
  void updatePos () {
    location.add(velocity);


    if (location.x <0) {
      location.x= width;
      pastDist = width + height;
    }
    if (location.x >width) {
      location.x = 0;
      pastDist = width + height;
    }
    if (location.y <0) {
      location.y = height;
      pastDist = width + height;
    }
    if (location.y >height) {
      location.y = 0;
      pastDist = width + height;
    }
  }
  /*
   void repel(){
   // this to make the agent repel itself
   
   agentLocationDistMag = AgentLocation.mag();
   if (agentLocationDistMag <1) {
   AgentVelocity.set (random(-1,1), random(-1,1),0);} 
   }
   */
  void publicTransport () {

    float publicTransportRadius2 = publicTransportRadius-1; // to repel some agent out
    // more comfor the public transport, more agents coming in
    float ComfortPercent = publicTransportComfort/100*publicTransportRadius;
    float inverseComfort2 = publicTransportRadius-ComfortPercent;

    if (pubTransDist < publicTransportRadius) {

      float attraction = random(0, 1);  // how well they respend to you when moving closer
      turn = PVector.mult(pubTransDisVector, attraction/pubTransDist);
      velocity.add(turn);
      fill (1, 1, 255);

      if (pubTransDist < publicTransportRadius2) {
        turn = PVector.mult(pubTransDisVector, attraction/pubTransDist);
        velocity.sub(turn);
        if (pubTransDist < inverseComfort2) {
          turn = PVector.mult(pubTransDisVector, attraction/pubTransDist);
          velocity.sub(turn);
        }
      }
    }

    velocity.normalize();
  }
  
  void privateCar () {
    float carPrice2 = carPrice-1; // to repel some agent out
    // more comfor the public transport, more agents coming in
    // give mark out of 100
  
    float ComfortPercent = fuelPrice/100*carPrice;
    float inverseComfort2 = carPrice-ComfortPercent;


    if (prvtCarDist < carPrice) {

      float attraction = random(0, 1);  // how well they respend to you when moving closer
      turn = PVector.mult(prvtCarDisVector, attraction/prvtCarDist);
      velocity.add(turn);

      if (prvtCarDist < carPrice2) {
        turn = PVector.mult(prvtCarDisVector, attraction/prvtCarDist);
        velocity.sub(turn);

        if (prvtCarDist < ComfortPercent) {
          turn = PVector.mult(prvtCarDisVector, attraction/prvtCarDist);
          velocity.sub(turn);
        }
      }
    }
    velocity.normalize();
  }

  /*
  void calculate () {
   pastDist = agentDist;
   if (mouseMove <2)
   if (agentDist < align) {
   if (agentDist < avoidance) {
   AgentVelocity.set(random(1,0), random(1,0), 0);
   }
   else {
   turn = PVector.mult(dir, sensitivity/agentDist);
   AgentVelocity.add(turn);
   }
   }
   else if (agentDist > pastDist) {
   turn = PVector.mult(dir, sensitivity/agentDist);
   turn.add(random(0, 0.5), random(0, 0.5), 0);
   AgentVelocity.sub(turn);
   }
   // this is mouse attractor
   else {
   {
   turn = PVector.mult(dir, attraction/agentDist);
   turn.add(random(0.1), random(0.1), 0);
   AgentVelocity.add(turn);
   }}
   AgentVelocity.normalize();
   }
   */
}


