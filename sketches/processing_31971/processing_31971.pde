
/* AGENT CLASS
In this tab we are defining all of the properties and
functions (also called methods) of our Agent object.

Run order modified
1, calculate flocking 
2, update position
3, rendering
*/

//Define a new class called Agent
class Agent {
  //--------------------------------------------CLASS PROPERTIES
  int[] flags = new int[3];
  //Create some variables that define what our agent is.
  //Create a PVector object called location
  PVector location;
  //Create a PVector object called velocity
  PVector velocity;
  //Create a float called agentSize
  float agentSize;
  //Create an integer called col
  int col;

  //--------------------------------------------CLASS CONSTRUCTOR
  
  //refer to the Class syntax, and define the Agent Constructor.
  //construct the class with parameters: 
  //a PVector called LOCATION, a float called AGENTSIZE, an int 
  //called AGENTCOLOUR and a PVector called VELOCITY.
  Agent (PVector LOCATION, float AGENTSIZE, int AGENTCOLOUR, PVector VELOCITY){
  //then using these parameters, assign values to each of the properties
  //of our class. Make location equal to LOCATION, make agentSize equal to 
  //AGENTSIZE, make velocity equal to VELOCITY and make col equal to AGENTCOLOUR.
    location = LOCATION;
    agentSize = AGENTSIZE;
    velocity = VELOCITY;
    col = AGENTCOLOUR; 
  //******NOTE - this may seem rediculous, but what we are doing here
  //is transferring information from one part of our sketch and
  //storing it in our agent class. This lets each agent be unique.
  // reset the flags

  }
  
  //--------------------------------------------CLASS METHODS

  //Now we get to define the custom functions (or methods, or 
  //behaviours, however you wish to describe them) for our agent
  //object. Each instance of our Agent class has exactly the same
  //functions, but because each instance also has (possibly) unique
  //properties, these functions will return different and complex
  //results.
  
  //Create a new function called run. Dont give it any arguments.
  //for function reference, see here: http://processing.org/learning/basics/functions.html
  void run(){
      flags[0] = 0;
  flags[2] = 0;
  flags[1] = 0;
    //we will use this function to run all our other functions.
    //COMPLETE THE FOLLOWING CODE AFTER YOU HAVE DESCRIBED WHAT
    //THESE FUNCTIONS ARE:

    //run flock
    flock();
    //run render
    render();
    //run updatePos
    updatePos();
  }

  //So, lets describe these three functions of our agent. Render
  //is the easiest one, lets do that first.
  
  //create a function called render. Don't give it any arguments.
  void render(){
    //set the fill to the agentColour and draw an ellipse
    //at the coordinates of our location Pvector, with width
    //and height equal to agentSize
    fill(col);
    ellipse(location.x,location.y,agentSize,agentSize);
    //position update turns red
    fill(col,col-col*flags[0],col-col*flags[0]);
    ellipse(location.x,location.y,agentSize/4,agentSize/4);
    //fill(col-col*flags[1],col,col-col*flags[1]);//alignment update turns green
    //ellipse(location.x,location.y,agentSize/2,agentSize/2);
    //fill(col-col*flags[2], col-col*flags[2], col);//avoidance update turns blue
    //ellipse(location.x,location.y,agentSize/4,agentSize/4);
  }
  //Create a function called updatePos. Dont give it any arguments
  //In this function we will move our agent, and perform a few checks
  //to keep the agent on the screen.
  void updatePos(){
    //add our velocity vector to our location vector. (this moves
    //the agent)
    location.add(velocity);
    //Now lets do our checks. Hint - these are done with if statements
    //http://processing.org/learning/basics/conditionals1.html

    //check if the x coordinate of location is less than 0
    //(this means we are off the left hand side of the screen)
    //if it is, make the x coordinate of location equal to
    //the width of the screen.
    if (location.x < 0) {
      location.x = width;
      //set the flag
      flags[0] = 1;
    }
    //repeat this basic check structure to check if the
    //agent is off the right side of the screen...
    if (location.x > width) {
      location.x = 0;
      //set the flag
      flags[0] = 1;
    }
    //... off the top of the screen, 
    if (location.y < 0) {
      location.y = height;
      //set the flag
      flags[0] = 1;
    }
    //... off the bottom. Force the
    //respective coordinate of location to the opposite side
    //of the screen if any of these checks returns true.
    if (location.y > height) {
      location.y = 0;
      //set the flag
      flags[0] = 1;
    }
    fill(255,0,0);
    text("Position wrapped around", 20, 20);
//          stroke(255,0,0);
//      noFill();
//
//   ellipse(location.x,location.y,agentSize+30,agentSize+30);

  }
  //Now lets make our flock function. This is the most processor 
  //intensive because we have to check the position of all 
  //the other agent objects in agentPop.
  
  //Create a function called flock. Dont give it any arguments.
  void flock(){
    //Create a float variable called minDist. Make it equal to
    //1000000 - this will store the minimum distance to another
    //agent. We will use this value later.
    float minDist = 100000000;
    //Create a loop to loop through all the other agents
    //in agentPop. NOTE - these two lines of code are exactly the 
    //same as what you will need later in the Draw loop.
    for (int i = 0; i<agentPop.size(); i++){
     
    //Create a loop to pull agents our of our agentPop ArrayList
    //one at a time. Make the start condition 0, the stopping condition
    //the size of the agentPop ArrayList, and the stepping condition +1
      
    //Create a new instance of our Agent class, call it 'a' 
    //(without quotes). Instead of using a constructor to create 'a',
    //use the ArrayList.get() function to make 'a' equal to
    //the current object in the agentPop list.
        Agent a = (Agent) agentPop.get(i);

    //*******HINT - when getting your own classes out of ArrayLists, 
    //you will need to remind processing of the type of object 
    //you put into the list originally. See here: http://processing.org/reference/ArrayList.html

      //create a float to store the distance between this agent and the
      //one we are currently looping through. Call this variable agentDist
      //and make the value equal to the distance between this objects 
      //location vector and the location vector of 'a'
      float agentDist = PVector.dist(location,a.location);
      //Create a check to see if agentDist is larger than 0. We do
      //this because if agentDist is 0, we may be checking ourselves.
      if (agentDist != 0) {

      //this is a bit of a hack, but its nice and simple. Place 
      //the following code within this check. 
          
          //create another check to see if agentDist is less than minDist.
          //if it is then make minDist equal to agentDist
          if (minDist > agentDist) {
            minDist = agentDist;
          }
          //Now we can check our global variables to see if
          //we should change the properties of our current agent.
           
          //Create a check to see if agentDist is smaller than align 
          //(make sure you have already created this variable in the
          //global variables section of your main tab)
          if (agentDist < align) {
              //if it is, we can change our velocity a little bit.
              
              //Create a PVector called addVec.
              //Make addVec equal to our 'a' agents velocity.
              PVector addVec = a.velocity;
              //multiply addVec by (falloff/agentDist). This makes
              //agents that are further away have a smaller effect.
              //float normDist = falloff/agentDist;
              //addVec = new PVector(addVec.x*normDist, addVec.y*normDist);
              addVec.mult(falloff/agentDist);
              //add addVec to our velocity vector 
              velocity.add(addVec);
              //normalize our velocity vector. This keeps agents at a constant speed.
              velocity.normalize();
              //subtract 0.1 from agentSize
              agentSize = agentSize-0.1;
           //now you can end the test for whether agentDist is smaller than
           //the align global variable.
           //set the flag
           flags[1] = 1;
           fill(0,255,0);
    text("align operated", 20, 40);
          stroke(0,255,0,80);
          strokeWeight(1);
      noFill();

        ellipse(location.x,location.y,agentSize+align,agentSize+align);
        strokeWeight(0);
          }
           //Lets create another check against our global variables
           
           //Create a check to see if agentDist is smaller than avoid
           //(make sure you have already created this variable in the
           //global variables section of your main tab)
           if (agentDist < avoid) {
                
              //if it is, we can change our velocity a little bit.
              
              //Create a PVector called addVec.
              //Make addVec equal to our 'a' agents location (NOT VELOCITY).
              PVector addVec = a.location;
              //subtact this agents location from addVec
              addVec.sub(location);
              //multiply addVec by (falloff/agentDist). This makes
              //agents that are further away have a smaller effect.
              addVec.mult(falloff/agentDist);
              //subtract addVec to our velocity vector 
              velocity.sub(addVec);
              //normalize our velocity vector. This keeps agents at a constant speed.
              velocity.normalize();
           
           //now you can end the test for whether agentDist is smaller than
           //the avoid global variable.
           //set the flag
           flags[2] = 1;
          fill(0,0,255);     
          text("avoid operated", 20, 60);
          stroke(0,0,255);
          noFill();
          strokeWeight(3);
          ellipse(location.x,location.y,agentSize+60,agentSize+60);
          strokeWeight(0);
           }
      //now you can end the check for whether we are checking ourself
      }
          //add 0.2 to agentSize

    //now you can end your loop through the agent population
    }
    agentSize = agentSize + 0.2;
    //You may want to add some more checks here that will limit
    //maximum and minimum size of your agents. Otherwise they may
    //get very small, or very large.
    if (agentSize < minSize) { 
      agentSize = minSize;
    }
    if (agentSize > maxSize) {
      agentSize = maxSize;
    }
  }
  //and your DONE!
}

