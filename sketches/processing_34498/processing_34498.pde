
class Agent {
  PVector locAgent, velAgent, turn, dir, mouseLoc;
  float distAgent, sensitivity, attraction, pastDist;
  int count = 0;


  Agent (PVector LOCATION, PVector VELOCITY, float PASTDIST, float SEN, float ATTRACT) {
    locAgent = LOCATION;
    velAgent = VELOCITY;
    pastDist = PASTDIST;
    sensitivity = SEN;
    attraction = ATTRACT;
  }

  void run() {
    render();
    update();

   // objectdelay();




   // calculate();
  } 
  void render() {
    //noFill();
    noStroke();
    // colour sepends on the agent's sensitivity and attraction
    // more purple is less sensitive - more likely to remain your friend if you moved
    // green is less attracted - they will come to you slower and run away first
    fill(255*attraction, 255*sensitivity, 255, 80);
    ellipse(locAgent.x, locAgent.y, agentSize, agentSize);
  }

  void objectdelay () {
     
    mouseLoc = new PVector(mouseX, mouseY);
    dir = PVector.sub(mouseLoc, locAgent); //direction of Agent to You
    distAgent = dir.mag();
  }

/*
  void calculate() {

    if (distAgent < align) {
      if (distAgent < avoidance) { 
        velAgent.set(random(1.0), random(1.0), 0);
      } 
      else { 
        turn = PVector.mult(dir, sensitivity/distAgent);
        velAgent.add(turn);
      }
    } 
    else if (distAgent > pastDist) { 
      turn = PVector.mult(dir, sensitivity/distAgent);
      turn.add(random(0, 0.5), random(0, 0.5), 0);
      velAgent.sub(turn);
    } 
    // this is mouse attractor
    else {
      turn = PVector.mult(dir, attraction/distAgent);
      turn.add(random(0.1), random(0.1), 0);
      velAgent.add(turn);
    }

    velAgent.normalize();
  }
*/

  //update the position of the agent
  void update() {
    pastDist = distAgent;
    locAgent.add(velAgent);
    // check if it's running out of bound
    // if they are their position is then randomly
    // assigned, memory is also reset
    if (locAgent.x > width) {
      locAgent.x = 0;
      locAgent.y = random(1, height);
      pastDist = width + height;
    } 
    else if (locAgent.x < 0 ) {
      locAgent.x = width;
      locAgent.y = random(1, height);
      pastDist = width + height;
    }
    if (locAgent.y > height) {
      locAgent.y = 0;
      locAgent.x = random(1, width);
      pastDist = width + height;
    } 
    else if (locAgent.y < 0) {
      locAgent.y = height;
      locAgent.x = random(1, width);
      pastDist = width + height;
    }
  }
}


