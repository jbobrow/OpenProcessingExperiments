

class Agent {


  //CONSTRUCTOR

  PVector location;
  PVector velocity;
  float agentSize = 5;
  int col = 255;
  
  float r = random(151);
  float g = random(135);
  float b = random(253);

  Agent (PVector LOCATION, float AGENTSIZE, int AGENTCOLOUR, PVector VELOCITY) {

    location = LOCATION;
    velocity = VELOCITY;
    col = AGENTCOLOUR;
    agentSize = AGENTSIZE;
  }

  void run() {

    render();
  //  aaa();
    updatePos();

    flock();
  //  cohesion(0.001);
  }


  void render() {

    fill(151,135,253 );
    ellipse(location.x, location.y, agentSize, agentSize);
    
    fill(255);
    ellipse(location.x-40, location.y-30, agentSize-10, agentSize-10);
    

  }


  void updatePos() {

    location.add(velocity);

    if ( location.x < 0) {
      location.x = width;
    }
    else if (location.x > width) {
      location.x = 0;
    }

    if (location.y < 0) {
      location.y = height;
    }

    else if (location.y > height) {
      location.y = 0;
    }
  }

  void flock() {
    float minDist = 1000000;

    for (int k = 0; k < agentPop.size(); k = k + 2) {

      Agent a = (Agent) agentPop.get(k);

      float agentDist = PVector.dist(location, a.location);

      if (agentDist> 0) {

        if (agentDist < minDist) {

          minDist = agentDist;
        }

        if (agentDist < align) {

          PVector addVec;
          addVec = a.velocity;

          addVec.mult(falloff/agentDist);

          velocity.add (addVec);

          velocity.normalize();

          agentSize = agentSize - 0.1 ;
        }

        if (agentDist < avoid) {

          PVector addVec = a.location;

          addVec.sub(location);

          addVec.mult(falloff/agentDist);

          addVec.sub(velocity);

          velocity.normalize();
        }
      }
    }

    agentSize = agentSize + 0.2;

    if (agentSize <10) {
      agentSize=10;
    }

    if (agentSize > 12) {
      agentSize= 12;
    }
  }
 // void cohesion(float magnitude) {



 //   Vec3D sum = new Vec3D();
  //  int count = 0;

   // for (int i = 0; i < agentPop.size();i++) {
   //   Agent a = (Agent) agentPop.get(i);

   //   float distance = loc.distanceTo(a.loc);

    //  if (distance > 0 && distance < 60) {

      //  sum.addSelf(a.loc);
     //   count++;//
  //    }
 //   }
 // }
   // void aaa() {

    //  speed.addSelf(acc);

    //  speed.limit(2);

    //  loc.addSelf(speed);

     /// acc.clear();//
    }




