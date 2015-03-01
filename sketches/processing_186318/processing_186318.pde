
void keyPressed() {
  if (key=='e' || key== 'E') {
    saveFrame("/output/seq-####.jpg");
  }
  if (key == 'n') {
    for (int i =0; i<agents.size();i++) {
      Agent myAgent = (Agent) agents.get(i);
      myAgent.runToggle=!myAgent.runToggle;
    }
    runToggle=!runToggle;
  }
  if (key == 'p') {
    record=true;
  }
}
void createAgents(int type) {
  int AgentCount=0;

  if (pop>vertices.size()) {
    pop=vertices.size();
  }
  if (type==1) {
    int ID;
    for (int i = 0; i<pop; i++) {
      ID=i;
      Vert v = (Vert) vertices.get(ID);
      Vec3D vec = v.getLocation();
      if (vec.z<10) {
        Agent myAgent= new Agent(ID);//We create an instance of the class. We name it myAgent.
        agents.add(myAgent);//We add the created instance of the Agent class to the ArrayList.
        AgentCount++;
      }
    }
  }
  if (type==2) {
    for (int i = 0; i<pop; i++) {
      Agent myAgent= new Agent(int(random(vertices.size())));//We create an instance of the class. We name it myAgent.
      agents.add(myAgent);//We add the created instance of the Agent class to the ArrayList.
      AgentCount++;
    }
  }
  if (type==3) {
    for (int i = 0; i<vertices.size(); i++) {
      Agent myAgent= new Agent(i);//We create an instance of the class. We name it myAgent.
      agents.add(myAgent);//We add the created instance of the Agent class to the ArrayList.
      AgentCount++;
    }
  }
  
  println(AgentCount);
}
void runAgents() {
  for (int i= 0; i<agents.size();i++) {
    Agent a  = (Agent) agents.get(i);
    a.run();
  }
}

void exportText() {
  output = createWriter("output/agentPositions" + frameCount + ".txt"); 
  int count = 0 ;
  for (int i=0; i<agents.size(); i++) {
    Agent myAgent = (Agent) agents.get (i);

    //output.println("Agent");
    output.println(myAgent.loc.x + "," + myAgent.loc.y + "," + myAgent.loc.z);
    /*count++;
    for (int j=0; j<myAgent.trail.size();j++) {
      Vec3D trailPoints = myAgent.trail.get(j);
      output.println(trailPoints.x + "," + trailPoints.y + "," + trailPoints.z);
    }*/
  }
  output.flush();
  output.close();
}
class Agent {

  //GLOBAL VARIABLES
  int ID;
  Vec3D loc= new Vec3D(0, 0, 0);//loc.
  Vec3D vel= new Vec3D(.5*random (-2, 2), .5*random(-2, 2), 0);//velocity.
  Vec3D acc= new Vec3D();//acceleration.
  Vec3D start = new Vec3D();
  float maxvel=2;//A floating variable for the maximum speed.
  float maxForce =100;
  boolean runToggle=true;
  int fovScore=200;
  int fovCoh=50;

  int every=10;
  ArrayList <Vec3D> trail;
  //CONSTRUCTOR
  Agent(int _ID) {//class(parameters)
    ID=_ID;
    Vert v = (Vert) vertices.get(ID);
    loc = new Vec3D(v.x, v.y, v.z);  
    start = loc.copy();
    trail = new ArrayList<Vec3D>();
  }

  //FUNCTIONS
  // run() A function that encompasses all functions.
  //We use this function in order to group the other functions.
  void run() {
    if (runToggle==true) {
      update();
      flock();//flock contains three functions, separation, cohesion, and alignment.
      display();
      dropTrail(every, 100);
      attractFaces(.0015);
      moveOnSrf(.025);
      followTrails(.025);
    }
    drawTrail(50);
  }

  void flock() {
    separation(separation);//we are calling the global variable separation. The one we defined at the begining.
    // cohesion(cohesion);
    //  alignment(alignment);
  }

  void alignment(float magnitude) {//alignment means that the agent will "align" itself with all the other agents, meaning that it will move towards where all the others are moving. 
    //the magnitude parameter will be assigned once we call the function. In this case it will be the global variable for alignment.
    Vec3D steer= new Vec3D();//We are creating a new empty vector to be added to the agent's acceleration. 
    //This will be translated into a change in direction based on the calculations.
    int count=0;//we create a variable called count. It will tell us how many times we have run through the for loop.
    for (int i=0; i< agents.size(); i++) {// a for loop to access all the other agents.
      Agent otherAgent= (Agent) agents.get(i);//getting the other agents. We are creating an instance of the Agent class, and calling all the other agents into it.
      float distance= loc.distanceTo(otherAgent.loc);//we evaluate the distance between our own position, and the other agent. 
      //(remember this will be done for each of the other agents in the population.)
      if (distance>0 && distance<40) {//based on that distance, we will activate alignment anytime the agent goes close to any of the rest.
        steer.addSelf(otherAgent.vel);//the temporary vector created, is added to the other agents' velocity, basically copying its data.
        //the other agents' velocity tell us where it is going, since the velocity is added to the loc.
        count++;//we add 1 to the count.
      }
    }
    if (count>0) {//anytime the count is greater than zero...
      steer.scaleSelf(1.0/count);//scale the steering vector based on how many times we have added the steering vector.
    }
    steer.scaleSelf(magnitude);//We are now multiplying the steering vector times the global variable for alignment.
    acc.addSelf(steer);//Finally, we add the steering vector to the acceleration, effectinga change in direction based on all the other
    //agents' velocity. This operations will make all the agents start to move toward the same direction over time.
  }

  void cohesion(float magnitude) {//cohesion means that the agents will try to move close to each other.
    Vec3D sum= new Vec3D();//we create an empty vector. It is called sum because in the end it will contain the sum of all other agents' locs.
    int count=0;//a variable that tells us how many times we've ran through the for loop.
    //a for loop to acces the other agents
    for (int i=0; i< agents.size(); i++) {
      Agent otherAgent= (Agent) agents.get(i);//we get the other agents.
      float distance= loc.distanceTo(otherAgent.loc);//we evaluate the distance to the other agents.
      if (distance>0 && distance<fovCoh) {//based on that distance, we will activate cohesion anytime the agent goes close to any of the rest.
        sum.addSelf(otherAgent.loc);//we add the other agents' loc to the empty vector created.
        //this basically gives us an average of all the other agents' loc. We will then move the agent toward this point.
        count++;//update the count. Add 1.
      }
    }
    if (count>0) {
      sum.scaleSelf(1.0/count);//we scale the sum vector, so that the effect dissolves over time.
    }
    Vec3D steer= sum.sub(loc);//we create a steering vector. It is the subtraction of the sum vector from the current loc of the agent.
    //this basically makes a vector that points toward the sum point.  
    steer.scaleSelf(magnitude);//we scale it based on the global variable for cohesion.
    acc.addSelf(steer);//now we add the steering vector to the acceleration, resulting in a change of direction that brings the agents together.
  }

  void separation(float magnitude) {//separation is a function so that the agents do not crash into each other.
    Vec3D steer= new Vec3D();//again, an empty steering vector.
    int count=0;//again, a count variable to tell us how many times we've run through the cycle.
    //a for loop to access all the other agents in the ArrayList.
    for (int i=0; i< agents.size(); i++) {
      Agent otherAgent= (Agent) agents.get(i);//getting the agents. 
      float distance= loc.distanceTo(otherAgent.loc);//evaluating the distance to the other agents.
      if (distance>0 && distance<55) {//if we get too close...
        Vec3D diff= loc.sub(otherAgent.loc);//then create a difference vector. it is the current loc, minus the other agent's loc.
        //this gives us a vector that points away from the other agents.
        diff.normalizeTo(1.0/distance);//the vector will be normalized to one over the distance evaluated.
        //This helps to control the effect the difference vector will have on the steering by reducing its magnitude.
        steer.addSelf(diff);//we now add the difference vector to the empty steering vector.
        count++;//add one to the count.
      }
    }
    if (count>0) {
      steer.scaleSelf(1.0/count);//scale the steering vector based on the count.
    }
    steer.scaleSelf(magnitude);//scale the steering vector based on the global variable for separation.
    acc.addSelf(steer);//finally, add the steering vector to the acceleration.
  }

  // update() a function for updating the loc of the object.
  void update() {
    vel.addSelf(acc);//add the vector for velocity to the acceleration.
    vel.limit(maxvel);//limit the maximum speed. (remember we declared the variable maxvel before.
    loc.addSelf(vel);//add the velocity to the loc. The most basic definition of motion is a velocity vector added to a loc vector.
    acc.clear();//clear the vector for the acceleration.
  }
  //the display function will show an ellipse by accessing the loc vector's coordinates.
  void display() {
    stroke(0, 200, 0);//fill color, a dark green.
    strokeWeight(2);//no stroke for the shape.
    point(loc.x, loc.y, loc.z);//an ellipse with center in the loc vector's coordinates, and 4 units wide and 4 units tall.
  }

  void dropTrail(int every, int limit) {

    if (frameCount == 1 || frameCount % every == 0) {
      trail.add(loc.copy());
      //while (trail.size () >= limit+1)
      //trail.remove(0);
    }
  }

  void drawTrail(float thresh) {
    if (trail.size() > 1) {
      for (int i = 1; i < trail.size(); i++) {
        Vec3D v1 = (Vec3D) trail.get(i);
        Vec3D v2 = (Vec3D) trail.get(i-1);

        float d = v1.distanceTo(v2);
        if (d < thresh) {
          stroke(30, 20*i);
          strokeWeight(1);
          line(v1.x, v1.y, v1.z, v2.x, v2.y, v2.z);
        }
      }
    }
  }


  /*
  void grav(float magnitude) {
   Vec3D grav = new Vec3D(0, 0, magnitude);
   acc.addSelf(grav);
   }
   
   void arrive(float level) {
   if (loc.z<level) {
   runToggle = false;
   }
   }*/


  void attractFaces(float magnitude) {

    /*
    for (int i=0; i< vertices.size(); i++) {
     Vert c = (Vert) vertices.get(i);
     Vec3D ctr = c.getLocation();
     float distance=loc.distanceTo(ctr);
     
     if (distance>0 && distance<100) {     
     Vec3D steeringVector = steer(ctr, false);
     steeringVector.normalizeTo(1/distance);
     steeringVector.scaleSelf(scores[i]);
     acc.addSelf(steeringVector);
     }
     }
     */


    Vec3D sum= new Vec3D();
    int count=0;
    for (int i=0; i< vertices.size(); i++) {
      Vert c = (Vert) vertices.get(i);
      Vec3D ctr = c.getLocation();
      float distance= loc.distanceTo(ctr);
      if (distance>0 && distance<50) {
        sum.addSelf(ctr);
        count++;
      }
    }
    if (count>0) {
      sum.scaleSelf(1.0/count);
    }
    Vec3D steer= sum.sub(loc); 
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void dettractFaces(float magnitude) {
    Vec3D steer= new Vec3D();
    int count=0;
    for (int i=0; i< vertices.size(); i++) {
      Vert c = (Vert) vertices.get(i);
      Vec3D ctr = c.getLocation();
      float distance= loc.distanceTo(ctr);
      if (distance>0 && distance<5) {
        Vec3D diff= loc.sub(ctr);
        diff.normalizeTo(1.0/distance);
        steer.addSelf(diff);
        count++;
      }
    }
    if (count>0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void moveOnSrf(float magnitude) {
    int highID=0;
    float thisScore = scores[ID];
    float localHighScore=0;

    for (int i=0; i< vertices.size(); i++) {
      Vert c = (Vert) vertices.get(i);
      Vec3D ctr = c.getLocation();
      float distance=loc.distanceTo(ctr);    
      if (distance>0 && distance<fovScore) {
        float otherScore = scores[i];
        if (otherScore > thisScore && otherScore != thisScore) {
          highID = i;
          thisScore=otherScore;
          localHighScore=scores[i];          
          Vert localMax = (Vert) vertices.get(highID);
          float dis= loc.distanceTo(localMax.getLocation());
          if (thisScore==localHighScore && dis<10) {
            runToggle=false;
          }
        }
      }
    }

    Vert v = (Vert) vertices.get(highID);
    Vec3D target = v.getLocation();
    Vec3D steeringVector = steer(target, false);
    steeringVector.scaleSelf(magnitude);
    acc.addSelf(steeringVector);
  }
  void followTrails(float magnitude) {
    int cloAID=0;
    int cloTID=0;
    float cloDist = 10000;
    Vec3D closestTrail=new Vec3D();
    Vec3D closestTrailFWD= new Vec3D();
    Vec3D steer=new Vec3D();
    for (int i=0; i<agents.size();i++) {
      Agent myAgent = (Agent) agents.get(i);
      if (myAgent!=this) {
        if (myAgent.trail.size()>3) {
          for (int j=0; j<myAgent.trail.size();j++) {
            Vec3D trail = (Vec3D) myAgent.trail.get(j);
            float distance= loc.distanceTo(trail);
            if (distance<cloDist) {
              cloAID=i;
              cloTID=j;
              cloDist=distance;
            }
          }
        }
      }
    }
    if (trail.size()>3) {
      Agent cloA = (Agent) agents.get(cloAID);
      Vec3D temp = (Vec3D) cloA.trail.get(cloTID);
      closestTrail=temp;

      if (cloTID<cloA.trail.size()-1) {
        Vec3D temp2 = (Vec3D) cloA.trail.get(cloTID+1); 
        closestTrailFWD=temp2;
      }
      else if (cloTID==cloA.trail.size()-1) {
        Vec3D temp3 = (Vec3D) cloA.trail.get(cloTID);
        closestTrailFWD=temp3;
      }

      //Vec3D mid =new Vec3D(((closestTrail.x+closestTrailFWD.x)/2), ((closestTrail.y+closestTrailFWD.y)/2), ((closestTrail.z+closestTrailFWD.z)/2));
      Vec3D mid= getNormalPoint(loc, closestTrail, closestTrailFWD);
      strokeWeight(1);
      stroke(0, 0, 255);
      // line(loc.x, loc.y, loc.z, mid.x, mid.y, mid.z);
      float distance=loc.distanceTo(mid);
      if (distance<50) {
        seek(mid, magnitude);
        Vec3D heading = new Vec3D(closestTrailFWD.x-closestTrail.x, closestTrailFWD.y-closestTrail.y, closestTrailFWD.z-closestTrail.z);
        steer.addSelf(heading);
        if (distance<.5) {
          runToggle=false;
        }
      }
      steer.scaleSelf(magnitude);
      acc.addSelf(steer);
    }
  }
  Vec3D getNormalPoint(Vec3D p, Vec3D a, Vec3D b) {
    Vec3D ap = p.sub(a);
    Vec3D ab = b.sub(a);
    ab.normalize();
    // Project vector "diff" onto line by using the dot product
    ab.scaleSelf(ap.dot(ab));
    Vec3D normalPoint = a.add(ab);
    return normalPoint;
  }
  void seek(Vec3D target, float factor) {
    Vec3D v = steer(target, false);
    v.scaleSelf(factor);
    acc.addSelf(v);
  }
  Vec3D steer(Vec3D target, boolean slowdown) {
    Vec3D steer; 
    Vec3D desired = target.sub(loc);  
    float d = desired.magnitude();  
    if (d > 0) {
      desired.normalize();
      if ((slowdown) && (d < 100.0f)) desired.scaleSelf(maxvel*(d/100.0f));
      else desired.scaleSelf(maxvel);
      steer = desired.sub(vel).limit(maxForce);
    } 
    else {
      steer = new Vec3D();
    }
    return steer;
  }
}

import processing.pdf.*;
import peasy.*;
import processing.opengl.*;
import toxi.geom.*;

PeasyCam cam;
PrintWriter output;
boolean record=false;

//Mesh variables
ArrayList vertices;
float[] scores;

//Agents variables
ArrayList agents;
int pop=1500;
boolean runToggle = true;
float alignment = .00025;
float cohesion = .0025;
float separation = .5;

void setup() {
  size(1000, 700, OPENGL);
  smooth();
  cam = new PeasyCam(this, 1000);
  cam.lookAt(500, 500, 0);
  cam.rotateX(-.25*PI);
  vertices = new ArrayList();
  agents = new ArrayList();
  getTXT(); 
  println(vertices.size());
  createAgents(2);//type 1 on z=0, type 2 random according to pop. type 3 all verts.
}

void draw() {
  if (record) {
    beginRaw(PDF, "output"+ frameCount+".pdf") ;
  }
  background(255);
  displayVerts();
  runAgents();
  stroke(0);
  strokeWeight(1);
  //rect(0,0,1000,1000);
  if (frameCount == 1 || (frameCount %20 ==0 && frameCount<1200)) {
    //exportText();
  }
  if (record) {
    endRaw();
    record = false;
  }
}

void getTXT() {
  String lines[] = loadStrings("data/WEICHENGZHANG_PROJECT1_A_2.txt");
  println("there are " + lines.length + " lines in the elevation point file...");
  scores = new float[lines.length];
  for (int i=0; i<lines.length;i++) {
    //println(lines[i]);
    String parts[] = split(lines[i], "}");
    parts[0]=parts[0].substring(1);  
    String coordinates[]=split(parts[0], ", ");
    //println("the X is: "+coordinates[0]+"the Y is: "+coordinates[1]+"the Z is: "+coordinates[2]+","+"the score is: "+parts[1]);
    Vert newVert = new Vert(float(coordinates[0]), float(coordinates[1]), float(coordinates[2]), i);
    vertices.add(newVert);
    scores[i]=float(parts[1]);
  }
}

void displayVerts() {
  for (int i=0; i<vertices.size(); i++) {
    Vert v = (Vert) vertices.get(i);
    v.display();
  }
}

class Vert {
  float x;
  float y;
  float z;
  int ID;


  Vec3D pos;

  Vert(float _x, float _y, float _z, int _ID) {
    x= _x;
    y=_y;
    z=_z;
    ID = _ID;
    pos = new Vec3D(x, y, z);
  }
  void display() {    
    stroke(185, 15, 145);
    strokeWeight(2);
    point(x, y, z);
  }
  Vec3D getLocation() {
    Vec3D a = new Vec3D(x, y, z);
    return a;
  }

  int getID() {
    return ID;
  }
}



