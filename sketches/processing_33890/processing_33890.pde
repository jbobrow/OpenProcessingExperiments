
ArrayList agentPop;  

   

//Create some global variables for our agents:  

//a float variable called align, make this equal to 20  

//a float variable called avoid, make this equal to 5  

//a float variable called falloff, make this equal to 1  

//an integer variable called numAgents, make this equal to 1000  

   

float align = 10;  

float avoid =15;  

float falloff = 0.03;  

int numAgents = 800;  

color col = color (130,0,150,100); 

float angle = 0;
float angleSpeed = 1.0;

float lineModuleSize = 0;

   

//--------------------------------------------SETUP  

   

void setup(){  

  size(800,600,P2D);  

//  background(255);

     

     

 agentPop = new ArrayList();//ACTIVATE THIS AGENTPOP ARRAYLIST//  

     

  //CREATE A LOOP to generate our POPULATION of agents.  

  //The start condition should be 0, the stopping condition  

  //out numAgents variable, and the stepping variable +1  

  for (int i = 0; i <numAgents; i++){    

     

  //within this loop define some variables for the  

  //properties of our current agent object.  

  //create a PVector object called loc this will define our agents FIRST POSITION in space.  

 //the PVector class with  x and y properties   

 //equal to a random number between 0 and the  

 //width and height of the screen respectively. Make the z  

 //property equal to 0.  

     PVector loc = new PVector(random(0, width), random (0, height),0);//THIS MEANS THE OBJECTS START AT RANDOM POSITION   

        

 //create another PVector object called vel. This will define  

 //our agents initial velocity. Construct a new instance of  

 //the PVector class with  x and y properties   

 //equal to a random number between -1 and 1. Make its z property 0.  

    PVector vel = new PVector (random (-3,3),random(-3,3),0); //THIS DETERMINE THE DIRECTION OF EACH OBJECT'S MOTION IS RANDOM//  

   

 //create a float variable called s for the agents Size.   

 //Assign s the value of 5.  

 //create an int variable called c for the agents greyscale colour.  

 //Assign c the value of 255.      

    float s = 10;  

    int c = 255;  

      

       

 //Construct a new instance of our Agent class. Call this   

 //new instance frank. Construct it using the variables   

 //we have just created within the loop.  

    Agent frank = new Agent(loc,s,c,vel );//REFER TO THE CONSTUCTORS OF AGENT  

   

    //add frank to the ArrayList agentPop.//FRANK AS ONE ELECTION OF THE AGENTPOP,  

    agentPop.add(frank);  

  }  

}  

//--------------------------------------------DRAW  

   

void draw(){  

  //Ive filled in this code for you. It draws a transparent  

  //rectangle over the screen to create the illusion of fading  

  //objects and depth.  

  fill(col,20);  

  rect(0,0,width,height);  

    

  /*Now we need to loop through our population of agents,  

    get them out of our ArrayList one at a time, and run their  

    functions that will update their position and velocity,  

    and render them as an ellipse on the screen.*/ 

     

  //Create a loop to pull agents out of our agentPop ArrayList  

  //one at a time. Make the start condition 0, the stopping condition  

  //the size of the agentPop ArrayList, and the stepping condition +1  

for (int j=0; j < agentPop.size(); j++){  

     

    //Create a new instance of our Agent class, call it 'a'   

    //(without quotes). Instead of using a constructor to create 'a',  

    //use the ArrayList.get() function to make 'a' equal to  

    //the current object in the agentPop list.  

    //HINT - when getting your own classes out of ArrayLists,   

    //you will need to remind processing of the type of object   

    //you put into the list originally.   

       

Agent a = (Agent) agentPop.get(j);  

       

       

    //Make 'a' run its run() function. This calls a number of  

    //other functions we have described in the Agent class.  

a.run();  

    //end the loop, your done!  

}  

}  

    //*******NOTE - how could you optimise this code to run faster?  

    //forcing every agent to loop through every other agent every  

    //frame is a slow operation, could you find away to only run this   

    //function every 5th (or 3rd etc) frame? 


