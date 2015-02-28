
import ddf.minim.*;
Minim minim;
Actor[] actors;
Area[][] areas;
Control c;
SoundControl sc;
PImage b;
PImage victim;
PImage suspect;
PImage cameras;
PImage microphones;
PImage drawMap;
int turncounter;
int murdernum;
PFont font;
boolean simulationMode;
int rHN = 10000; //ReallyHighNumber - Just used where very many oportunities are needed.
Area murderArea;

boolean drawmapswitch = true;
static boolean debugMode = false; //Turn on and off debug mode to find errors in progra
static int startMoney = 1000; //Number of money in the Start of the game //NOT IMPLEMENTED
static int priceMic = 50; //Number of money spent each Microphone //NOT IMPLEMENTED
static int priceVid = 100; //Number of money spent each Video Camera //NOT IMPLEMENTED
static int memorynum = 24; //Number of turns being memory of objects
static int gsx = 16; // Gridsize vertically 
static int gsy = 16; //Gridsize horisontally
static int numSusp = 7; //Numbers of Suspects
static int numVict = 3; //Numbers of Victims

/* Initializes the process, creates the Control object, and creates the platform. */
void setup() {
  //Loads the pictures used in the game
 b = loadImage("NYC.jpg");
 victim = loadImage("victim.jpg");
 suspect= loadImage("suspect.jpg");
 cameras = loadImage("camera.jpg");
 microphones = loadImage("microphone.jpg");
 drawMap = loadImage("HandMapScaled.jpg");

 
 
 minim = new Minim(this); //Initialise sound class
 simulationMode = true;  //Starts in simulation mode
int turncounter = 0; //Reset the turn counter
 sc = new SoundControl(); 
 c = new Control();
 c.createAreas();
 c.createActors();
 size(gsx*50,gsy*50+150); //Draws up board plus controll panel
 background(200,200,200); //Sets the lovely gray coloured background
 String[] fontlist = PFont.list(); //This is rather silly, but finds a random generated font
 font = createFont(fontlist[int(random(5))], 15);
 c.runsimulation(); //Starts the fun. 
 

  
 
}

void draw(){
 background(200,200,200);
 //requestFocusInWindow();
  //Runs the next turn
  
  //places map in the background //changes according to which is toggled. Has to be changed later
  if(drawmapswitch){
    image(drawMap,0,0);
  } else {
  image(b, 0, 0);
  }
//  background(255,255,255); //Curently not fulfilling its purpose
  //Creates the gridsize according to global variables

  
    for(int i=0; i < gsx; i++){
    for(int j=0; j <gsy; j++){
      fill(100,100,100);
      stroke(255);
      line(i*50,j*50,50*i,50*gsy);//vertical line
      line(i*50,j*50,50*gsx,50*j);//horizontal line  
      
      
      if(debugMode){
      textFont(font); 
      fill(255,255,225);
      // text(String.valueOf(i)+"."+String.valueOf(j), i*50, j*50); //Fills in number of boxes
      }
      

      //Code under marks if microphones are in place
      Area a = areas[i][j];
      if(a.mic == true){
        image(microphones,i*50,j*50,50,50);
      }
      if(a.cam == true){
        image(cameras,i*50,j*50,50,50);
      }
      if(a.cam == true && a.mic == true){
         //This should return in getting back money from buying microphone
      }
     

     fill(0,0,0);
      }
     }
    
   

      
 
  
  //Draws the Suspects and Victims into the model according to their class and possition
 for(int i= 0 ; i < numSusp+numVict; i++) {
    if(actors[i] instanceof Suspect) {
    //fill(255, 50, 0);
    image(suspect,actors[i].whereAreYouX()*50,actors[i].whereAreYouY()*50,50,50);
    } else if(actors[i] instanceof Victim){
     // fill(50, 255, 0);
     image(victim,actors[i].whereAreYouX()*50,actors[i].whereAreYouY()*50,50,50);
    }
    
      if(debugMode){
      stroke(0);
      ellipse(actors[i].whereAreYouX()*50+25, actors[i].whereAreYouY()*50+25, 50, 50); 
      }
  }

  
  //DRAW THE TIME OF THE TURN VIEWED
  textFont(font); 
  fill(0,0,0);
  text(c.gettime(),15,gsy*50+15);
  
  
  
  
  //Delays the next turn to make its viewable  
  //delay(500);
  
  // DRAWS THE PANEL BUTTONS
   fill(255,255,255);
   stroke(255,255,255);
   rect(50,gsy*50+20,100,40);   
   rect(155,gsy*50+20,100,40);  
   rect(260,gsy*50+20,100,40);   
   rect(365,gsy*50+20,100,40);
   
   fill(0,0,0);
   
    text("Run round",52,gsy*50+45);
    text("Clear tools",157,gsy*50+45);
    text("Restart",262,gsy*50+45);
    text("Toggle Map",367,gsy*50+45);
    
    //DRAWS THE TEMPORAL BAR
    fill(255,255,255);
   rect(50,gsy*50+70,memorynum*15,40); 
   fill(23,206,25);
   rect(50,gsy*50+70,memorynum*15-(murdernum-turncounter)*15,40);
   
   //Draws the Areas which have object stored // DEBUG MODE
   if(debugMode){
     
    //Check guest-overflow in Area methods
    for(int i = 0; i< gsx; i++){
     for(int j = 0; j < gsy; j++){
      Area a = areas[i][j];
      if(a.al.size()>0){
       fill(255,0,0);
       rect(i*50,j*50,50,50);
      }
    }
    }
   }
 
  
 
    
} // END OF DRAW METHOD

/* MAKES THE PLAYER ABLE TO CONTROL EACH ITERATION */

//Checks if the LEFT or RIGHT button is being pressed and moves forward and backward in the history of the objects
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      c.rewindTurn();
      
    } else if (keyCode == RIGHT) {
      c.forwardTurn();
    } 
  } else {
    print("HERE SOMETHING SHOULD HAVE HAPPENED");
  }

}




//Checks the position of the mouse, and places microphone and camera according to LEFT or RIGHT pushed. 
void mousePressed() {
    if(mouseY < gsy*50){
  if (mouseButton == LEFT) {
 areas[mouseX/50][mouseY/50].mic = true;
} else if(mouseButton == RIGHT){
   areas[mouseX/50][mouseY/50].cam = true;
}
  } else {
    
    //HERE COULD SPECIAL COMMANDS AND BUTTONS BE PLACED. 
    if(mouseY>gsy*50+20 && mouseY<gsy*50+20+40){
        if(mouseX>50 && mouseX<465){
            if (mouseButton == LEFT) {
         int button = c.checkButton(mouseX,mouseY);
              if(button == 1){
               c.reRunSimulation();
              } else if (button == 2){
                 c.clearTools();  
              } else if (button == 3){
                c.restart();
              } else if (button == 4){
                c.toggleMap();
              }      
            }
        }
  }
  }
}





/* The class Area is each square, it knows it initial position, and have methods to report if anything happens (collition), should also know which Actors currently (and historically) located within */

class Area {
  int xpos;
  int ypos;
  boolean mic;
  boolean cam;
  ArrayList al;
  
  //Constructor: Informs the square about its position
 Area(int x, int y){
  this.xpos = x;
  this.ypos = y;
  mic = false;
  cam = false;
 al = new ArrayList();

 }
 
 //Returns true if something happens during the turn //now just reporting false due to lacking logic implemented
 boolean somethingHappened(){
   if(al.size() >= 2){
     return true;
  } else{
    return false;
  }
 }

 void signIn(Actor at){
   al.add(at);
   if(mic || cam){
    sc.playWalk(); 
     
   }
 }
 
 void signOut(Actor at){
   al.remove(at);
   
   
 }

}



//Superclass actor. Know direction and objective where it is going. 
class Actor { 
    int actNr;
    Control c;
    int xpos;
    int ypos;
    boolean dirlead; // Indicates which direction which is being followed: true = x, false = y
  boolean dirx; // Indicates the way the x-axis is moving; true = increasing, false = decreasing
  boolean diry; // Indicates the way the y-axis is moving; true = increasing, false = decreasing
  
  boolean greyknown; //To be used for the fog of war principle - Knows path. Not identity
  boolean colorknown; //To be used for the fog of war principle - Knows path and identity
  
  int changer; //A number between 0 and 5 which describes how many interferences Actor will accept before changing dirlead
  int changer_status; //The current number. 
  Area[] memory; //makes up the memory of the Actor
  
  //Constructor: Informs on initial possition within the grid
 Actor(int x, int y, Control c, int actNr){
  this.xpos = x;
  this.ypos = y;
  this.c = c;
  this.greyknown = false;
  this.colorknown = false;
  this.actNr = actNr;
  this.memory = new Area[rHN];
  
    
    
      // place initial directions for movement
    if(int(random(2)) == 1){
      dirlead = false;
    } else {
      dirlead = true;
    }
  
    if(int(random(2)) == 1){
      dirx = false;
    } else {
       dirx = true;      
    }
    
    if(int(random(2)) == 1){
      diry = false;
    } else {
      diry = true;
    }
    
    changer = int(random(5));
    changer_status = 0;
    
    areas[xpos][ypos].signIn(this); //Signing object into place in Matrix
    println(actNr+" moved to square"+xpos+","+ypos);
    memory[turncounter] = areas[xpos][ypos];
    
    
    
 } // end of constructor 
  
  
  
  //returns X position
  int whereAreYouX(){
     return this.xpos;
  }
  
  // returns Y position
   int whereAreYouY(){
     return this.ypos;
  }
  
  
  //Move the Actor one step in direction, checks for borders before moving
   void move(){
     checkDirection();
 //   println(actNr+" moved from square"+xpos+","+ypos);
     areas[xpos][ypos].signOut(this);
     
     
     if(dirlead == true){
         checkBordersX();
         if(dirx == true){
          this.xpos++; 
         } else {
           this.xpos--;
         }   
     } else if(dirlead == false){
         checkBordersY();
         if(diry == true){
          this.ypos++; 
         } else {
           this.ypos--;
         }
         
     }
   //  println(actNr+" moved to square"+xpos+","+ypos);
     areas[xpos][ypos].signIn(this);
     memory[turncounter] = areas[xpos][ypos];
     
     
     
  } //EndOf move()
  
  void moveTo(Area a){
    this.xpos = a.xpos;
    this.ypos = a.ypos;
    
  }
  
  
  
  

//Check for X borders, changes variable direction if border is next step
void checkBordersX(){
   if(this.xpos >= gsx-1 || this.xpos == 0){
    // println("xpos something");
     if(this.xpos == gsx-1){
       this.dirx = false; 
       changer_status++;
      // println("xpos false something");
     } else if(this.xpos == 0){
       this.dirx = true;
       changer_status++;
      // println("xpos true something");
     } else {
      println("SystemERROR");
      }
   }
  } //endOf checkBordersX
  
//Check for Y borders, changes variable direction if border is next step  
  void checkBordersY(){
   if(this.ypos >= gsy-1 || this.ypos == 0){
       if(this.ypos == gsy-1){
           this.diry = false;
           changer_status++;
     } else if(this.ypos == 0){
          this.diry = true;
          changer_status++;
     } else {
      println("SystemERROR");
      }
    } 
  
  }//EndOf checkBordersY
  
  void checkDirection(){
    if(changer == changer_status){
      if(dirlead == true){
        dirlead = false; 
      } else if(dirlead == false){
       dirlead = true ;
      }
      changer_status = 0;
    }
  
  }
  
  
  void updatePosition(){
    areas[this.xpos][this.ypos].signOut(this);
    this.xpos = memory[turncounter].xpos;
    this.ypos = memory[turncounter].ypos;
    areas[this.xpos][this.ypos].signIn(this);
    
    
  }
  
  
 
    
    
}//EndOf class Actor







//Subclass Suspect. Sends variables to superclass, but helps identifying role, and can be implemented with role specific variables and methods
class Suspect extends Actor{
  Suspect(int x,int y, Control c, int actNr){
    super(x,y,c,actNr);  
  }
  
  
  
  
  
} //EndOf class Suspect



//Subclass Victim. Sends variables to superclass, but helps identifying role, and can be implemented with role specific variables and methods
class Victim extends Actor{
  Victim(int x, int y, Control c, int actNr){
    super(x,y,c, actNr);  
  }//EndOf Constructor Victim
  
  
  
  
  
} // EndOf class Victim






/* Control class, object is created in setup. Creates the objects, makes the world go round, and is very important for the whole execution. */

class Control{
//Creates the Areas in the grid
   void createAreas(){
      areas = new Area[gsx][gsy];
      for(int i=0; i < gsx;i++){
        for(int j=0; j <gsy; j++){
          areas[i][j] = new Area(i,j);
        }          
    }
print("Areas created");    
  }
  
  //Creates the Actors, and places them at random location in the grid
  void createActors(){
    actors = new Actor[numSusp+numVict];
     for(int i = 0; i < numSusp; i++){
       actors[i] = new Suspect(int(random(gsx)),int(random(gsy)),this,i); 
     }
     for(int j =0+numSusp; j < numSusp+numVict; j++){
       actors[j] = new Victim(int(random(gsx)),int(random(gsy)),this,j); 
     } 
     print("Created actors");
  }



//iterates through the objects of Actors and calls the make turn object.
//More logic to be placed here for each iteration, can be divided into more methods. 

void makeTurn(){

    //Asks the actors to move
    if(simulationMode){
   for(int i=0; i<numSusp+numVict; i++){
    actors[i].move();
   } 
    }
   //Check in anthing has happened in the model
   for(int i=0; i < gsx;i++){
        for(int j=0; j <gsy; j++){
          if(areas[i][j].somethingHappened() == true){
            findCollision(areas[i][j]);
          }         
        }
   }
   
   //registers another turn
   if(simulationMode){
   turncounter++;
   }

  } //EndOf makeTurn()
  
  
  
 //Should find collusion, does this by checing if objects of both 
  // subclasses is within the area a. Not generic enough. Runs only during 
  //simulation and does not spot interchanging between spaces. 
  //THIS METHOD HAS TO BE CHANGED TO A BETTER ONE
  void findCollision(Area a){
   int vict = 0;
   int susp = 0;
   //Iterates through visitor database, and updates what class is within the Area
    for(int i = 0; i< a.al.size(); i++){
       if(a.al.get(i) instanceof Victim){ //Checks if class ID and updates counter
         vict++; //Updates the number of victims within field
       }else if(a.al.get(i) instanceof Suspect){
           susp++; //Updates the number of suspect within field
       } else {
        print("we should not get this message here"); //This should never happen
       }
       
       println("Victims: "+vict+" Suspect: "+susp+" in turn nr:"+turncounter+"in"+a.xpos+" . "+a.ypos);
     }
     //If more than one victim AND more than one suspect means kill
     //if in simulation mode, start the game. If not play murder sound. 
     //FUNCTION TWO DOES NOT WORK AS THE ACTOR CLASS DOES NOT CALL THIS METHOD AFTER SIMULATION RUN
     if(susp >= 1 && vict >= 1){
        if(turncounter>memorynum){
          if(simulationMode){
          println("Startgame");
          murderArea = a;
          sc.playMurder();
           startgame();
          } else {
             if(a.mic || a.cam){
           sc.playMurder();
       }
      }
    } 
      //check if more than one suspect is in the area
     } else if(susp >= 2){
       if(a.mic || a.cam){
       sc.playSuspect();
       }
       //check if more than one victim is in the area
     } else if (vict >= 2){
       if(a.mic || a.cam){
       sc.playVictim(); 
       }
     } else {
       println("System ERROR"); // Should never logically occur
     }
     
     
   
  
  }//EndOf function findCollition
    
    
    //Takes control and creates turns until murder which turns of simulationMode
   void runsimulation(){
     while(simulationMode){
     c.makeTurn();
     }     
   }
   
   //Method restarts the game, by rerunning the simulation
   void restart(){
      murdernum = 0;
      turncounter = 0; //Reset the turn counter
      simulationMode = true;  //Starts in simulation mode
      createAreas();
      createActors();
      runsimulation();
      
     
   }//End of method restart()
  
  
    //Start game turns of simulation mode, and enters draw loop
    void startgame(){
     simulationMode = false;
     murdernum = turncounter; //Stores the turn when the murder found place
      
    }//End of method StartGame
    
    
    //Return a String with time since beginning of simulation
    String gettime(){
     String time;
     int days = 0 ;
     int hours = 0; 
     int calctime = turncounter;
     
     //Runs through calc time and divides into days first, then hours
     while(calctime > 0){
       if(calctime >= 24){
         days++;
         calctime = calctime - 24;
       }else if(calctime < 24){
        hours = calctime; 
        calctime = 0;
       } 
     }     
     //Concatinate String consisting of timestamp, and returns this.
     time = "Days: "+String.valueOf(days)+"  Time: "+String.valueOf(hours);
     return time;
    } //End of Method gettime
    
    
    
    
    //Changes the turn one backward, unless at end of memory
    boolean rewindTurn(){
      //println("Should rewind");
      //Changes the turn one backward, unless at end of memory
      if(turncounter>murdernum-memorynum){
      turncounter --;
         //Tells actors to update possition
       for(int i=0; i<numSusp+numVict; i++){
          actors[i].updatePosition();
       } return true;
      } else {
         println("I WILL NOT DO THAT. ONE DAY BACK SHOULD BE ENOUGH");
         return false;
      }      
    }//end of method rewindTurn()
    
 
    //Moves the state one turn forward unless at murder
    boolean forwardTurn(){
      //println("Should forward");
      //Changes turn one forward
      if(turncounter<murdernum){
        turncounter ++;
     
       for(int i=0; i<numSusp+numVict; i++){
          actors[i].updatePosition();
          c.makeTurn();
       } return true;
      } else {
       println("I WILL NOT DO THAT. BECAUSE OF ARRAYS OUT OF BOUNDS");
       return false;
       }
    }//end of method forwardTurn()
    
    
      //Method backToReRun sets the state of the game to number of turns minus memory
       void backToReRun(){
      turncounter = murdernum - memorynum;
      
    }//End of method backToReRun
    
    
    //Method reRunSimulation() runs through the events leading up to the murder
    void reRunSimulation(){
      backToReRun();
      while(forwardTurn()){
      };
      
    } //End of method reRunSimulation
    
    
    //Method used to clear tools from screen and from money //HAS TO BE BETTER DEVELOPED
    //Switches the Cameras and the Microphones to false, should do more: Communicate with economics, and have some consequences
    void clearTools(){
      
      for(int i=0;i<gsx;i++){
        for(int j=0;j<gsy;j++){
          areas[i][j].cam = false;
          areas[i][j].mic = false;
        }
      }

    }
    
    
    /* method checkButton()
    RETURNS ACTIONNUMBER ACCORDING TO MOUSE POSSITION
      0 = nothing should be done
      1 = Rund Round (First button)
      2 = Clear Tools (Second button)
      3 = Tell a joke (etc)
      4 = Fly away ()
     */
 
    int checkButton(int x, int y){
      //Clickable Area Y

        
        if(x>50 && x<150){
          return 1;
        } else if(x>155 && x<255){
          return 2;
        } else if(x>260 && x<360){
          return 3;
        } else if(x>365 && x<465){
          return 4;
        } else {
          return 0;
        }
        
      
      
    } //End of method checButton
    
    void toggleMap(){
      if(drawmapswitch){
        drawmapswitch = false;
      }else{
        drawmapswitch = true;
      }      
    }
    
    
     
}//End of class Control



/* Class Money is not yet implemented, but will keep track of players resources
*/


class Bank{
 int money; 
 
   Bank(){
     this.money = startMoney;
   }

  
  
}








//Controls the sounds throughout the game.
class SoundControl{
  AudioPlayer playerVic; 
  AudioPlayer playerSusp;
  AudioPlayer playerMurder;
  AudioPlayer playerWalk;

  //Creates the object and load soundsfiles
  SoundControl() {
    playerVic = minim.loadFile("hello.mp3",2048); //Load in voice of Victim
    playerSusp = minim.loadFile("bubup.mp3",2048); //Load in voice of Suspect
    playerMurder = minim.loadFile("murder.mp3",2048); //Load in voice of Murder
    playerWalk = minim.loadFile("walksound.mp3",2048); //Load in the Walksound
  } //End of constructor SoundControl
  
  
  
  //Play the Suspect sound
 void playSuspect(){
     playerSusp.play();
     playerSusp.rewind();
     delay(200);
   
   
 }
 
 
 //Play the Victim sound
 void playVictim(){
   playerVic.play();
    playerVic.rewind();
     delay(200);
   
 }  
 // Play the murder sound
 void playMurder(){
  playerMurder.play(); 
  playerMurder.rewind();
   delay(200);
 }
 
 void playWalk(){
   playerWalk.play(); 
  playerWalk.rewind();
   delay(200);
   
 }
 

   
   
 }
 
/*void stop(){
    playerVic.close();
    playerSusp.close();
    playerMurder.close();
    minim.stop();
    super.stop();


  
}
   */


