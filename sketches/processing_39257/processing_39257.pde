
class Agent {
  // GLOBAL VARIABLES
  Vec3D loc = new Vec3D (0, 0, 0);
  Vec3D speed = new Vec3D(random(-2, 2), random(-2, 2), 0);
  Vec3D acc = new Vec3D(0, 0, 0);
  color colour;
  String cha;
  float wandertheta;
  float ht = 300;
  boolean perchBool;
  float repeldist;
  ArrayList trailAgentList;


  int timeIntervalFlag = 300;


  //CONSTRUCTOR
  Agent(Vec3D _loc, color _colour, float _repeldist) {
    loc = _loc;
    colour = _colour;
    repeldist = _repeldist;
  }

  //FUNCTIONS
  void runAgent() {
    display(repeldist);
    //perch();
    move();
    //borders();
    bounce();
    seperate(MUagents, 5);
    cohesion(MUagents, 0.001);
    align(MUagents, 0.1);
    repel(MUattractors, 100, repeldist);
    seek(MUagents2, 2, 70, .03);
    //wander(1, .06, 0.25);
    cha = "agent";
    //friction(0.1);
   // seeLine(MUagents, color(255,0,0));
  }

  void runAgent2() {
    display(repeldist);
    // perch();
    move();
    borders();
    //bounce();
    //seperate(MUagents2, 5);                                                 
    //cohesion(MUagents2, 0.001);
    //align(MUagents2, 0.1);
    //attract(14);
    wander(MUagents2, 1, .06, 0.25);
    cha = "agent2";
    //flee(MUagents, 10);
    // trail();
    // friction(.9);
   // seeLine(MUagents2, color(0,255,0));
  }

  void runAttractor() {
    display(repeldist);
    cha = "attractor";
  }

  void trailAgent() {
    display(repeldist);
    cha = "trailAgent";
  }

  void seeLine(ArrayList type, color colour) {
    for ( int i = 0; i < type.size();i++) {
      stroke(colour);
      line(10*speed.x+loc.x, 10*speed.y+loc.y, loc.x, loc.y);
    }
  }

  void wander(ArrayList type, float constant1, float constant2, float constant3) {

    Vec3D circleOffset = new Vec3D();
    float number =  ( random(-(constant3), constant3));
    for (int i = 0; i < type.size();i++) {

      wandertheta += number ;

      Agent Agents = (Agent)type.get(i);

      Vec3D circleloc = new Vec3D(speed);



      circleOffset = new Vec3D(constant1*cos(wandertheta), constant1*sin(wandertheta), 0);
      circleOffset.normalize();
      circleOffset.scaleSelf(constant2);
    }
    acc.addSelf(circleOffset);
  }


  void align(ArrayList type, float magnitude2) {
    Vec3D front = new Vec3D();
    int count = 0;

    for (int i =0; i < type.size(); i++) {
      Agent other = (Agent)type.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 40 && other.cha == "agent") {
        front.addSelf(other.speed);
        count++;
      }
    }
    if (count>0) {
      front.scaleSelf(1.0/count);
    }
    front.scaleSelf(magnitude2);
    acc.addSelf(front);
  }



  void seperate(ArrayList type, float magnitude) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < type.size(); i++) {
      Agent other = (Agent)type.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance >0 && distance < 30 && other.cha == "agent") {
        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(1.0/distance);
        steer.addSelf(diff);
        count++;
      }
    }
    if (count >0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void cohesion(ArrayList type, float magnitude1) {
    Vec3D sum = new Vec3D();
    int count = 0;

    for (int i = 0; i < type.size();i++) {
      Agent other = (Agent)type.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 60 && other.cha == "agent") { 
        sum.addSelf(other.loc);
        count++;
      }
    }
    if (count > 0 ) {
      sum.scaleSelf(1.0/count);
    }
    Vec3D steer = sum.sub(loc);
    steer.scaleSelf(magnitude1);
    acc.addSelf(steer);
  }

  void attract(ArrayList type, float magnitude) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int j = 0; j < type.size(); j++) {
      Agent other = (Agent)type.get(j);

      float distance = loc.distanceTo(other.loc);
      if (distance >0 && distance < 30 && other.cha == "agent2") {

        Vec3D diff = loc.add(other.loc);
        diff.normalizeTo(1.0/distance);
        steer.addSelf(diff);
        count++;
      }
    }
    if (count >0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }





  void repel(ArrayList type, float magnitude, float repeldist) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int j = 0 ; j < type.size(); j++) {
      Agent other = (Agent)type.get(j);
      float distance = loc.distanceTo(other.loc);
      if (distance >0 && distance < repeldist) {
        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(1.0/distance);
        steer.addSelf(diff);
        count++;
      }
    }
    if (count >0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void seek(ArrayList type, float magnitude, float seekRange, float seekRangeAngle) {
    Vec3D steer = new Vec3D();
    Vec3D direction = new Vec3D(acc);
    int count =0;
    for (int i = 0; i < type.size() ; i++) {
      Agent other = (Agent) type.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < seekRange) {
        Vec3D vector = loc.sub(other.loc);
        float lengthDirection = sqrt(direction.x*direction.x+direction.y*direction.y);
        float lengthVector = sqrt(vector.x*vector.x*vector.y*vector.y);
        float dotproduct = (direction.x*vector.x) + (direction.y*vector.y);
        float result = acos(dotproduct / (lengthVector*lengthDirection))-PI/2;
        //println(result);
        float resultmag = sqrt(pow(result, 2));
        if (resultmag >= 0 && resultmag < seekRangeAngle) {
          steer.subSelf(vector);
          count++;
          fill(255, 0, 0);
         // ellipse(loc.x, loc.y, 12, 12);
        }
      }
    }
    if (count>0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void flee(ArrayList type, float magnitude) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < type.size();i++) {
      Agent other = (Agent)type.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance >= 0 && distance < 80) {
        Vec3D direction = loc.sub(other.loc);
        direction.normalizeTo(1.0/distance);
        steer.addSelf(direction);
        count++;
      }
    }
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }


  void trail() {
    trailAgentList = new ArrayList();
    println(lastTimeCheck);
    if (millis() > lastTimeCheck + timeIntervalFlag) {
      for (int i = 0; i < MUagents2.size();i++) {
        Agent other = (Agent)MUagents2.get(i);
        lastTimeCheck = millis ();
        Agent myTrailAgent = new Agent(new Vec3D(other.loc.x, other.loc.y, 0), color(0, 255, 255), 0);
        trailAgentList.add(myTrailAgent);
        ellipse(other.loc.x, other.loc.y, 5, 5);
      }
    }
  }

  void friction(ArrayList type, float magnitude) {
    Vec3D steer = new Vec3D();
    Vec3D vector = new Vec3D(speed);
    for (int i =0; i < type.size(); i++) {
      Vec3D direction = vector.sub(loc); 
      steer.subSelf(speed);
      steer.normalizeTo(1.0);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void bounce() {
    if (loc.x >
      width) {
      speed.x = speed.x  * -10;
    }
    if (loc.x < 
      0) {
      speed.x  = speed.x  * -10;
    }
    if (loc.y >
      height) {
      speed.y = speed.y * -10;
    }
    if (loc.y < 
      0) {
      speed.y = speed.y * -10;
    }
  }


  void borders() {
    if (loc.x < 0) loc.x = width;
    if (loc.y < 0) loc.y = height;
    if (loc.x > width) loc.x = 0;
    if (loc.y > height) loc.y = 0;
  }

  void move() {
    speed.addSelf(acc);
    speed.limit(2);
    loc.addSelf(speed);
    acc.clear();
    //noLoop();
  }


  void perch(ArrayList type) {

    for (int i = 0; i < type.size();i++) {
      perchBool = false;
      Vec3D steer = new Vec3D();
      float perchspeed = sqrt( pow((speed.x), 2) + pow((speed.y), 2));
      if (perchspeed > 1.8) {
        perchBool=true;
        if (perchBool=true) {
          float timer = random(0, 200);
          while (timer > 0 ) {
            timer = timer-1;

            //     steer.x = -speed.x;
            //steer.y = -speed.y;
            speed.scaleSelf(0);
          }
        }
      }
    }
  }

  void display(float repeldist) {
    fill(colour);
    if (cha == "agent") {
      noStroke();
      
    //  ellipse(loc.x, loc.y, 1, 1);
      image(img,loc.x,loc.y);
    }
    else if (cha == "attractor") {
      noFill();
      stroke(255, 20);
      ellipse(loc.x, loc.y, 20, 20);
    }
    else if (cha == "agent2") {
      noStroke();
     // ellipse(loc.x, loc.y, 1, 1);
            image(img1,loc.x,loc.y);
    }
  }
}


