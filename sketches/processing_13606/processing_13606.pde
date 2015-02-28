
/*
  Weird Boids by Tim Ganly 2010
  Based on work by Craig Reynolds.

  Click and hold the mouse to lure the boids.
*/

ArrayList<Agent> agents;
final int NUMBER_OF_AGENTS = 300;
final int CALC_FREQ = 1;
final color BG_COL = color(0,30,30);
float nincAmount = 0.01;

float ninc, nx, ny;

PVector arbitraryFollow = new PVector(0,0,0);

void setup() {
  size(700,400);
  smooth();
  background(BG_COL);
  agents = new ArrayList<Agent>(NUMBER_OF_AGENTS);
  for(int i=0; i<NUMBER_OF_AGENTS; i++) {
    agents.add(new Agent(random(40,width-40),random(40,height-40), 0, 0, i%CALC_FREQ));
  }
  frameRate(24);
  noiseDetail(2,0.5);
}

void draw() {
  background(BG_COL);
  if(!mousePressed) {
    ninc += nincAmount;
    nx = noise(ninc) ;
    ny = noise(ninc+100) ;
    arbitraryFollow = new PVector(nx * width, ny * height, 0);
  }
  Agent a;  
  for(int i=0; i<NUMBER_OF_AGENTS; i++) {
    a = agents.get(i); //no need to cast here because we use generics
    a.step();
    a.move();
    a.draw();
  }
}

class Agent {
  //'steer' refers is to 'steering vector': a vector indicating the direction in which the agent desires to move 
  PVector loc, vel, overAllSteer, mouseSteer, seperationSteer, alignmentSteer, followingSteer, cohesionSteer, accel, desiredVel;

  Agent followee;

  private boolean isFollowing = false;
  static final float maxAccel = 1.1;
  static final float maxSpeed = 7.0;
  static final float perceptionRange = 30.0;
  static final float mouseSteerWeight = 1; //tendency to follow mouse (or randomly moving position)
  static final float seperateSteerWeight = 1000;
  static final float alignmentSteerWeight = 0.5;
  static final float followingSteerWeight = 1; //tendency to follow flock mates
  static final float cohesionSteerWeight = 5;
  static final float avoidWallSteerWeight = 20; 
  static final float switchOnFollowingChance = 0.0004;
  static final float switchOffFollowingChance = 0.02;  
  static final boolean avoidWalls = true;
  final float mass = random(0.8,1.8);
  final color AGENT_COLOR = color(255,100,0);
  final color AGENT_COLOR2 = color(50,200,50);
  int calcFreq;
  ArrayList<Agent> nearByAgents = new ArrayList<Agent>();

  Agent(float x, float y, float vx, float vy, int calcFreq) {
    this.loc = new PVector(x,y);
    this.vel = new PVector(vx,vy);
    this.mouseSteer = new PVector(0,0,0);
    this.accel = new PVector(0,0,0);
    this.calcFreq = calcFreq;
  }

  void move() {
    loc.add(vel);

    //constrain to the screen    
    if(loc.x < 0) {
      loc.x = 0;
      if(vel.x < 0) {
        vel.x *= -1;
      }
    }
    if(loc.x > width) {
      loc.x = width;
      if(vel.x > 0) {
        vel.x *= -1;
      }
    }
    if(loc.y < 0) {
      loc.y = 0;
      if(vel.y < 0) {
        vel.y *= -1;
      }
    }
    if(loc.y > height) {
      loc.y = height;
      if(vel.y > 0) {
        vel.y *= -1;
      }
    }
  }

  void step() {
    //the steering vector is the vector that joins the agent loc to the mouse.
    PVector followPoint = mousePressed ? new PVector(mouseX,mouseY) : arbitraryFollow;
    mouseSteer = getVectorToTarget(followPoint);
    mouseSteer.normalize();
    mouseSteer.mult(mousePressed ? mouseSteerWeight * 2 : mouseSteerWeight);

    //get nearby agents, but only on every CALC_FREQth frame.
    if(frameCount % CALC_FREQ == calcFreq) {
      nearByAgents = new ArrayList<Agent>();
      Iterator<Agent> itr = agents.iterator();
      Agent anAgent;
      float distTo;
      while(itr.hasNext()) {
        anAgent = itr.next();
        distTo = PVector.dist(loc,anAgent.loc);
        if(distTo <= perceptionRange && anAgent != this) {
          nearByAgents.add(anAgent);
        }
      }

      int s = nearByAgents.size(); 

      seperationSteer = s == 0 ? new PVector(0,0,0) : getSeperationVector(nearByAgents); 
      alignmentSteer = s == 0 || isFollowing  ? new PVector(0,0,0) : getAlignmentVector(nearByAgents);
      alignmentSteer.normalize();
      cohesionSteer = s == 0  || isFollowing  ? new PVector (0,0,0) : getCohesionVector(nearByAgents);
      cohesionSteer.normalize();

      followingSteer = s == 0 ? new PVector(0,0,0) : getFollowingVector(nearByAgents);

      PVector avoidWallSteer = new PVector(0,0,0);

      //avoid the walls?
      if(avoidWalls) {
        if(loc.y < 40) {
          avoidWallSteer.add(new PVector(0,1));
        }
        if(loc.y > height - 40) {
          avoidWallSteer.add(new PVector(0,-1));
        }
        if(loc.x < 40) {
          avoidWallSteer.add(new PVector(1,0));
        }
        if(loc.x > width - 40) {
          avoidWallSteer.add(new PVector(-1,0));
        }
      }

      //weight the vectors
      seperationSteer.mult(seperateSteerWeight);
      alignmentSteer.mult(alignmentSteerWeight);
      followingSteer.mult(followingSteerWeight);
      cohesionSteer.mult(cohesionSteerWeight);
      avoidWallSteer.mult(avoidWallSteerWeight);

      //overALlSteer is a representation of what vector the agent wants to be travelling in.
      //Let's assume they want to be travelling at maximum speed though. 
      overAllSteer = PVector.add(mouseSteer,seperationSteer);
      overAllSteer.add(alignmentSteer);
      overAllSteer.add(followingSteer);
      overAllSteer.add(cohesionSteer);
      overAllSteer.add(avoidWallSteer);

      //acceleration should be the difference between the current velocity and the overALlSteer vector
      //e.g. 'I want to accelerate to meet my desired velocity, and this is the acceleration vector I want!'
      desiredVel = PVector.sub(overAllSteer,vel);
      accel = desiredVel.get();
      accel.normalize();
      accel.mult(maxAccel);
    }
    
    //F = ma, a = F/m
    accel.div(mass);

    vel.add(accel);
    vel.limit(maxSpeed);
  }

  private PVector getFollowingVector(ArrayList<Agent> agents) {

    //decide to switch following or not.
    PVector result = new PVector(0,0,0);
    boolean switchedOn = false;

    //should I be following?
    if(random(0,1.0) < switchOnFollowingChance && isFollowing == false) {
      isFollowing = true;
      switchedOn = true;
    }

    if(!isFollowing) {
      return result;
    }
    else {
      //println(vel.mag());
      //we are following, but are we following the same as last time?
      if(switchedOn == false) {
        result = getVectorToTarget(followee.loc);
      }
      //should I turn off following?
      if(random(0,1.0) < switchOffFollowingChance) {
        isFollowing = false;
      }
    }

    //pick another agent to follow if neccessary
    if(switchedOn) {
      do {
        followee = agents.get((int)random(0,agents.size()));
      }
      while(followee == this);

      result = getVectorToTarget(followee.loc);
    }
    return result;//PVector.sub(result,vel);
  }

  private PVector getVectorToTarget(PVector target) {
    return PVector.sub(target,loc);
  }
  /*
  Loop through all the agents supplied in the agents argument.
   */
  private PVector getSeperationVector(ArrayList<Agent> agents) {
    PVector overAllRepulsion = new PVector(0,0,0);
    Iterator<Agent> itr = agents.iterator();
    Agent anAgent;
    PVector repulsion;
    float distTo;
    while(itr.hasNext()) {
      anAgent = itr.next();
      distTo = PVector.dist(loc,anAgent.loc);
      repulsion = PVector.sub(loc,anAgent.loc);
      repulsion.normalize();
      //weight by inverse square.
      if(distTo != 0) {
        repulsion.mult(1.0/sq(distTo));
      }   //todo what if the dist to is 0? Both agents occupy the same space...

      overAllRepulsion.add(repulsion);
    }
    return overAllRepulsion;
  }

  private PVector getCohesionVector(ArrayList<Agent> agents) {
    PVector avLoc = new PVector(0,0,0);
    Iterator<Agent> itr = agents.iterator();
    Agent anAgent;
    while(itr.hasNext()) {
      anAgent = itr.next();
      avLoc = PVector.add(avLoc,anAgent.loc);
    }
    avLoc.div(agents.size());
    return getVectorToTarget(avLoc);
  }

  private PVector getAlignmentVector(ArrayList<Agent> agents) {
    PVector overAllAlignment = new PVector(0,0,0);
    Iterator<Agent> itr = agents.iterator();
    while(itr.hasNext()) {
      overAllAlignment.add(itr.next().vel);
    }
    return overAllAlignment;
  }

  void draw() {
    PVector leng = vel.get();
    float speed =  vel.mag();
    leng.normalize();
    leng.mult(map(speed,0,maxSpeed,0,15));
    noStroke();
    float alph = map(speed,0,maxSpeed,10,220);
    color agentColor = isFollowing ? AGENT_COLOR : AGENT_COLOR2;
    fill(agentColor ,alph);
    stroke(agentColor, alph + 35);
    ellipse(loc.x, loc.y,7*mass/1.5,7*mass/1.5);
    stroke(agentColor,alph);
    beginShape(LINES);
    vertex(loc.x, loc.y);
    vertex(loc.x - leng.x*mass/1.1, loc.y - leng.y*mass/1.1);
    endShape();
  }
}


