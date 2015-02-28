
//CREATING YOUR OWN UNIQUE OBJECTS/classes.//
//by Kirilly Barnett 
//Psuedocode provided by Performative Architecture Studio (The University of Melbourne)
//Information gathered from Gennware Tutorials
//Corrective Coding from peers.

/* this sketch simulates basic flocking/swarming
 by looping through a population of objects with
 very simple rules and behaviours. It is important
 to attempt to create this script in the correct order
 to be able to efficiently debug your work. 
 
 
 1. Firstly, create our global variables. These will
 be needed by our Agent object.
 2. Then, work on completing the code within the Agent
 tab. This will define our Agent object.
 3. Then complete the code required within the setup.
 This creates our population of Agents.
 4. Finally, complete the code in the draw loop in order 
 to begin the sketch.*/


//--------------------------------------------GLOBALS
//create a new, empty instance of the Arraylist 
//object to store all of our agent objects. 
//Call this object agentPop.

//DECLARE
ArrayList agentPop;

//Create some global variables for our agents:
//a float variable called align, make this equal to 20
//a float variable called avoid, make this equal to 5
//a float variable called falloff, make this equal to 1
//an integer variable called numAgents, make this equal to 1000

// GLOBAL VAIRABLES

float align = 20;
float avoid = 5;
float falloff = 1;
int numAgents = 1000;

float  minSize = 5;
float maxSize = 12;



//--------------------------------------------SETUP

void setup() {
  //Ive filled in this simple code for you. It creates a 2D 
  //sketch, sets the background the black and prevents processing
  //from drawing lines.

  agentPop = new ArrayList();
  size(800, 600, P2D);
  background(0);
  noStroke();
  noSmooth();

  //Create a loop to generate our population of agents.
  //The start condition should be 0, the stopping condition
  //out numAgents variable, and the stepping variable +1
  for (int i = 0; i<numAgents; i++) {
    PVector loc  = new PVector (random (0, width), random (0, height), 0);
    PVector vel = new PVector( random (-1, 1), random (-1, 1), 0);
    float s = 5;
    int c = 255;


    //within this loop define some variables for the
    //properties of our current agent object.

    //create a PVector object called loc 0- this will define our
    //agents first position in space. Construct a new instance of
    //the PVector class with  x and y properties 
    //equal to a random number between 0 and the
    //width and height of the screen respectively. Make the z 
    //property equal to 0.
    //create another PVector object called vel. This will define
    //our agents initial velocity. Construct a new instance of
    //the PVector class with  x and y properties 
    //equal to a random number between -1 and 1. Make its z property 0.
    //create a float variable called s for the agents Size. 
    //Assign s the value of 5.
    //create an int variable called c for the agents greyscale colour.
    //Assign c the value of 255.

    Agent frank = new Agent (loc, s, c, vel); 
    agentPop.add(frank);

    //Construct a new instance of our Agent class. Call this 
    //new instance frank. Construct it using the variables 
    //we have just created within the loop.
    //add frank to the ArrayList agentPop.
    //thats it, end the loop
  }
}
//--------------------------------------------DRAW

void draw() {
  //Ive filled in this code for you. It draws a transparent
  //rectangle over the screen to create the illusion of fading
  //objects and depth.
  fill(0, 2);
  rect(0, 0, width, height);

  /*Now we need to loop through our population of agents,
   get them out of our ArrayList one at a time, and run their
   functions that will update their position and velocity,
   and render them as an ellipse on the screen.*/

  //Create a loop to pull agents our of our agentPop ArrayList
  //one at a time. Make the start condition 0, the stopping condition
  //the size of the agentPop ArrayList, and the stepping condition +1
  //Create a new instance of our Agent class, call it 'a' 
  //(without quotes). Instead of using a constructor to create 'a',
  //use the ArrayList.get() function to make 'a' equal to
  //the current object in the agentPop list.


  for ( int j = 0; j < agentPop.size(); j++) {
    Agent a = (Agent) agentPop.get(j);
    a.run();
  }


  //*******HINT - when getting your own classes out of ArrayLists, 
  //you will need to remind processing of the type of object 
  //you put into the list originally. See here: http://processing.org/reference/ArrayList.html

  //Make 'a' run its run() function. This calls a number of
  //other functions we have described in the Agent class.

  //end the loop, your done!

  //*******NOTE - how could you optimise this code to run faster?
  //forcing every agent to loop through every other agent every
  //frame is a slow operation, could you find a way to only run this 
  //function every 5th (or 3rd etc) frame?
}


