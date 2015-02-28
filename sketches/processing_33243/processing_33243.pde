
/* AGENT CLASS */
class Agent {
  //proporties - local variables
  PVector locYou, dir, turn;
  //distance between agent and the mouse
  float distAgent;
  //internal handles   
  PVector locAgent, velAgent;
  float sensitivity, attraction, pastDist; 
    
  
  
  //constructor
  Agent (PVector LOCATION, PVector VELOCITY, float PASTDIST, float SEN, float ATTRACT) {
    locAgent = LOCATION;
    velAgent = VELOCITY;
    pastDist = PASTDIST;
    sensitivity = SEN;
    attraction = ATTRACT;
  }
  
  //order of functions;
  void run(){
//    //noFill();
    stroke(125,125,255); // draw a crosshair for current mouse location
    //ellipse(mouseX,mouseY,agentSize,agentSize);
    
    line(mouseX,mouseY-agentSize,mouseX,mouseY+agentSize);
    line(mouseX-agentSize,mouseY,mouseX+agentSize,mouseY);
    noStroke();
    
    // get the mouse location
    locYou = new PVector(mouseX,mouseY);
    dir = PVector.sub(locYou,locAgent); //direction of Agent to You
    distAgent = dir.mag();
    
    render();
    //if (frameCount%5 ==1) { //option of decrease calculation rate
      calculate();
    //}
    update();
    
  }
  
  // draws the agents
  void render(){
    //noFill();
    noStroke();
    // colour sepends on the agent's sensitivity and attraction
    // more purple is less sensitive - more likely to remain your friend if you moved
    // green is less attracted - they will come to you slower and run away first
    fill(255*attraction,255*sensitivity, 255,80); 
    ellipse(locAgent.x,locAgent.y,agentSize,agentSize);
    //fill(0,80);
    //stroke(255*sensitivity, 255*attraction,0,80);
    //line(locAgent.x,locAgent.y,locAgent.x+agentSize*velAgent.x,locAgent.y+agentSize*velAgent.y);
  }
  
  //calculate the movement of the agent
  void calculate(){
    
       if (distAgent < align) { 
        if (distAgent < avoidance) { // closest friend some times just wanted to move away
//          turn = PVector.mult(locAgent, sensitivity/distAgent);
//          turn.add(random(0.5),random(0.5),0);
//          velAgent.sub(turn);    
            velAgent.set(random(1.0),random(1.0),0);
        } else { // others want to get close to you
          turn = PVector.mult(dir, sensitivity/distAgent);
          //turn.add(random(0.1),random(0.1),0);
          velAgent.add(turn);
        }
      } else if (distAgent > pastDist) { //moved away
        
        turn = PVector.mult(dir, sensitivity/distAgent);
        turn.add(random(0.5),random(0.5),0);
        velAgent.sub(turn);
      } else {// if (distAgent <= pastDist) { //moved closer
          turn = PVector.mult(dir, attraction/distAgent);
          turn.add(random(0.1),random(0.1),0);
          velAgent.add(turn);
        } 
//    //other agents
//    for (int i = 0; i<agentPop.size(); i++){
//      // 'a' equal to the current object in the agentPop list.
//      Agent a = (Agent) agentPop.get(i);
//      float agentsDist = PVector.dist(locAgent,a.locAgent);
//      
//      if (agentsDist < avoidance) {
//        PVector addVec;
//        addVec = a.locAgent;
//      }
//    }
    velAgent.normalize();
  }
  
 
  //update the position of the agent
  void update(){
    pastDist = distAgent;
    locAgent.add(velAgent);
    // check if it's running out of bound
    // if they are their position is then randomly
    // assigned, memory is also reset
    if (locAgent.x > width) {
      locAgent.x = 0;
      locAgent.y = random(1,height);
      pastDist = width + height;
    } else if (locAgent.x < 0 ) {
      locAgent.x = width;
      locAgent.y = random(1,height);
      pastDist = width + height;
    }
    if (locAgent.y > height) {
      locAgent.y = 0;
      locAgent.x = random(1,width);
      pastDist = width + height;
    } else if (locAgent.y < 0) {
      locAgent.y = height;
      locAgent.x = random(1,width);
      pastDist = width + height;
    } 
  }
}

  
    

