
//----------------------------------------------------------GLOBAL VARIABLES

//Declare new arraylist call agentPop
ArrayList agentPop;

/*Declare and assign global variables for agents behaviour
 in terms of their alignment, avoidance, falloff value and
 the number of agents*/

float align = 20;
float avoid = 10;
int falloff = 1;
int numAgents = 500;
color col = color(181, 157, 0, 100);
float lineModuleSize = 0;
float angle = 0;
float angleSpeed = 1.0;

void setup() {

  /*basic setup with 800 by 600 px with P2D type graphic output,
   a black background and no stroke line*/
  size(800, 600, P2D);
  background(0);
 

  //assign agentPop as the new ArrayList
  agentPop = new ArrayList();

  /* begin a count of +1  from 0 up to the number of agents specified.
   For each count, a new agent named frank is created.
   Agent frank starts at specified location within the x and y coordinate,
   a random velocity in x and y direction with a magnitude from -1 to 1,
   size s and blue/green color;
   all the Agent frank are added to the agentPop ArrayList.
   */

  for (int i = 0; i < numAgents; i++) {

    PVector loc = new PVector(random(300, 500), random(200, 400), 0);
    PVector vel = new PVector(random(-5, 5), random(-5, 5), 0);
    float s = 5;
    color c = color(0, random(75, 150), random(30, 100));

    Agent frank = new Agent(loc, vel, s, c);
    agentPop.add(frank);
  }
}

void draw() {

  /*draw a transparent rectangle over the whole background with transparency
   to achieve the illusion of fading objects and depth*/
  fill(0, 10);
  rect(0, 0, width, height);

  /*a new instance of Agent is created from the flexible list of agentPop list size.
   the run command is used to execute all the behaviour code written*/
  for (int i=0; i < agentPop.size(); i++) {
    Agent a = (Agent) agentPop.get(i);
    a.run();
  }
}


