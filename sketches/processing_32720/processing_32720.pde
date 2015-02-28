
/* AGENT CLASS
In this tab we are defining all of the properties and
functions (also called methods) of our Agent object.
To do this in processing you need to follow some quite
strict syntax, be sure to have watched the genware videos
and reffered to the processing reference - 
http://processing.org/learning/objects/ - and tutorial 
material before attempting to create this code. Try making 
modifications or adding additional functions to demonstrate 
an understanding of object oriented programming.*/

class Agent {
//Define a new class called Agent
  
  //--------------------------------------------CLASS PROPERTIES 

  //Create some variables that define what our agent is.
  PVector location;
  //Create a PVector object called location
  PVector velocity;
  //Create a PVector object called velocity
  float agentSize;
  //Create a float called agentSize
  int col;
  //Create an integer called col

  //--------------------------------------------CLASS CONSTRUCTOR
  Agent(PVector LOCATION,float AGENTSIZE,int AGENTCOLOUR, PVector VELOCITY){
    location = LOCATION;
    agentSize = AGENTSIZE;
    col = AGENTCOLOUR;
    velocity = VELOCITY;
    
  }
  //refer to the Class syntax, and define the Agent Constructor.
  //construct the class with parameters: 
  //a PVector called LOCATION, a float called AGENTSIZE, an int 
  //called AGENTCOLOUR and a PVector called VELOCITY.
  
  //then using these parameters, assign values to each of the properties
  //of our class. Make location equal to LOCATION, make agentSize equal to 
  //AGENTSIZE, make velocity equal to VELOCITY and make col equal to AGENTCOLOUR.

  //******NOTE - this may seem rediculous, but what we are doing here
  //is transferring information from one part of our sketch and
  //storing it in our agent class. This lets each agent be unique.
  
  
  //--------------------------------------------CLASS METHODS
  
  //Now we get to define the custom functions (or methods, or 
  //behaviours, however you wish to describe them) for our agent
  //object. Each instance of our Agent class has exactly the same
  //functions, but because each instance also has (possibly) unique
  //properties, these functions will return different and complex
  //results.
  void run(){
    
  //Create a new function called run. Dont give it any arguments.
  //for function reference, see here: http://processing.org/learning/basics/functions.html
  
    //we will use this function to run all our other functions.
    //COMPLETE THE FOLLOWING CODE AFTER YOU HAVE DESCRIBED WHAT
    //THESE FUNCTIONS ARE:
    render();
    updatePos();
    flock();
    
  }
    //run render
    //run updatePos
    //run flock

  //So, lets describe these three functions of our agent. Render
  //is the easiest one, lets do that first.
  void render(){  
  //create a function called render. Don't give it any arguments.
    fill(col,random(10,100));
    smooth();
    ellipse(location.x, location.y, agentSize, agentSize);
   

  }
    //set the fill to the agentColour and draw an ellipse
    //at the coordinates of our location Pvector, with width
    //and height equal to agentSize

  void updatePos(){
  //Create a function called updatePos. Dont give it any arguments
  //In this function we will move our agent, and perform a few checks
  //to keep the agent on the screen.

    location.add(velocity);
    //add our velocity vector to our location vector. (this moves
    //the agent)

    
    //Now lets do our checks. Hint - these are done with if statements
    //http://processing.org/learning/basics/conditionals1.html
    if (location.x < 0){
      location.x=width;
    }
    //check if the x coordinate of location is less than 0
    //(this means we are off the left hand side of the screen)
    //if it is, make the x coordinate of location equal to
    //the width of the screen.
    if (location.x > width){
      location.x=0;
    }
    if (location.y >height){
      location.y=0;
    }
    if (location.y <0){
      location.y=height;
    }
    //repeat this basic check structure to check if the
    //agent is off the right side of the screen, off the 
    //top of the screen, and off the bottom. Force the
    //respective coordinate of location to the opposite side
    //of the screen if any of these checks returns true.
  }

  //Now lets make our flock function. This is the most processor 
  //intensive because we have to check the position of all 
  //the other agent objects in agentPop.
  
  void flock(){
        
  //Create a function called flock. Dont give it any arguments.
    float minDist = 1000000;
    
    //Create a float variable called minDist. Make it equal to
    //1000000 - this will store the minimum distance to another
    //agent. We will use this value later.
    for (int i=0;i<agentPop.size();i++){
    //Create a loop to loop through all the other agents
    //in agentPop. NOTE - these two lines of code are exactly the 
    //same as what you will need later in the Draw loop.
    
    //Create a loop to pull agents our of our agentPop ArrayList
    //one at a time. Make the start condition 0, the stopping condition
    //the size of the agentPop ArrayList, and the stepping condition +1
      Agent a = (Agent) agentPop.get(i);
    //Create a new instance of our Agent class, call it 'a' 
    //(without quotes). Instead of using a constructor to create 'a',
    //use the ArrayList.get() function to make 'a' equal to
    //the current object in the agentPop list.
      
    //*******HINT - when getting your own classes out of ArrayLists, 
    //you will need to remind processing of the type of object 
    //you put into the list originally. See here: http://processing.org/reference/ArrayList.html
      float agentDist = PVector.dist(location, a.location);
      //create a float to store the distance between this agent and the
      //one we are currently looping through. Call this variable agentDist
      //and make the value equal to the distance between this objects 
      //location vector and the location vector of 'a'
      if (agentDist >0){
      //Create a check to see if agentDist is larger than 0. We do
      //this because if agentDist is 0, we may be checking ourselves.
      //this is a bit of a hack, but its nice and simple. Place 
      //the following code within this check. 
          if(agentDist<minDist){
            minDist = agentDist;
          }  
          //create another check to see if agentDist is less than minDist.
          //if it is then make minDist equal to agentDist

          //Now we can check our global variables to see if
          //we should change the properties of our current agent.
          if(agentDist<align){      
          //Create a check to see if agentDist is smaller than align 
          //(make sure you have already created this variable in the
          //global variables section of your main tab)
                
              //if it is, we can change our velocity a little bit.
              PVector addVec = a.velocity;
              //Create a PVector called addVec.
              //Make addVec equal to our 'a' agents velocity.
              addVec.mult(falloff/agentDist);
              //multiply addVec by (falloff/agentDist). This makes
              //agents that are further away have a smaller effect.
              addVec.add(velocity);
              //add addVec to our velocity vector 
              velocity.normalize();
              //normalize our velocity vector. This keeps agents at a constant speed.
              agentSize-=0.1;
              //subtract 0.1 from agentSize
          }   
           //now you can end the test for whether agentDist is smaller than
           //the align global variable.
            
           //Lets create another check against our global variables
           if (agentDist < avoid){
           //Create a check to see if agentDist is smaller than avoid
           //(make sure you have already created this variable in the
           //global variables section of your main tab)
                
              //if it is, we can change our velocity a little bit.
              PVector addVec;
              addVec = a.location;
              //Create a PVector called addVec.
              //Make addVec equal to our 'a' agents location (NOT VELOCITY).
              addVec.sub(location);
              //subtact this agents location from addVec
              addVec.mult(falloff/agentDist);
              //multiply addVec by (falloff/agentDist). This makes
              //agents that are further away have a smaller effect.
              addVec.sub(velocity);
              //subtract addVec to our velocity vector 
              velocity.normalize();
              //normalize our velocity vector. This keeps agents at a constant speed.
              agentSize+=0.2;
              //
              //
           } 
           //now you can end the test for whether agentDist is smaller than
           //the avoid global variable.
      }
    //now you can end the check for whether we are checking ourself
    //agentSize+=0.2;
    //add 0.2 to agentSize
    
    } 
    if (agentSize < 5) {
          agentSize=5;
        }
 
        if (agentSize > 10) {
          agentSize= 10;
        }
    
    //You may want to add some more checks here that will limit
    //maximum and minimum size of your agents. Otherwise they may
    //get very small, or very large.
  }
//now you can end your loop through the agent population
}
//and your DONE!


