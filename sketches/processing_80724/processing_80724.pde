


//**************************
// INTRODUCTION
//
//************************** 

/*
BIEBER FEVER
created by Dan Hawkins, Oct 16th 2012, 
email: drhawkin@sfu.ca

Game Play:
You are trapped in a closet, with Justin Bieber and giant Tsunami waves. 
You have to use the Arrow Keys to move around the closet to collect Justin Biebers. 
If you are a fan of Justin Bieber this can be interpreted as a hug. If you do not like Justin Bieber
this can be interepted as a Punch. Either way, if you collect 40 Justin Biebers you win the game.
If you get wiped out by one of the giant Tsunami waves, you lose the game. 

Concept:
The original intent of this game was to use a live Twitter feed with the Twitter4j library. Everytime 
"Bieber" is tweeted an instance of Bieber appears on your screen. Likewise, everytime "Climate Change" is tweeted, 
an instance of a Tsunami appears on your screen. 
Thus, Bieber Fever demonstrates the popularity of less important things and questions societies "priorities". 
However, the concept is not lost without the Twitter feed. Here, you are collecting Biebers, but in fact this is just
a distraction until you get wiped out by a tsunam (which represents Climate Change). 
*/



//**************************
// Global Variables 
//
//************************** 
 
// game states
int INTRO = 0;  // introductory screen, ie main men
int RUN_GAME = 1; // running game state
int GAME_OVER = 2; // game over state
int EXIT_SCREEN = 3; // when player 1 exits the boundaries
int GAME_WIN = 4; // when player reaches 50 Biebers
int gameState = INTRO; // initialize first game state to INTRO

// game objects
Player player1;
gameObject window1;
gameObject [] bieberArmy = new gameObject [50]; // array for biebers, inherited from gameObject abstract class
gameObject [] waveArray = new gameObject [40];  // array for waveArray, inherited from gameObject abstract class


int points = 0; // game points or score. everytime player hits bieber,  score increases. Game is won when player reaches 40 points
int randomX, randomY, randomS, randomXw, randomXb, randomYw, randomYb;  //random values for bieberArmy and waveArray movement
int bieberSpeed, waveSpeed; //speed of bieber and wave

// images - game state images
PImage gameOver;      // Images for game over screen
PImage intro_screen;  // Image for  main menu screen
PImage loseScreen;    // Image for  when player 1 leaves the boundaries
PImage gameWin;
int randomXX = 10000;

//background colors
color wallcolor = color(60,160,208); // inner wall collor
color floorcolor = color(238, 203, 173); // floor color 255,190,11
color outwallcolor = color(35,93,121); //outter wall color

// import minim library for music 
import ddf.minim.* ;
Minim minim; // create a class of Minim = minim
AudioPlayer bieberMusic; // set AudioPlayer as bieberMusic (song name "BoyFriend", as a .wav file)

//**************************
//  VOID SETUP
//
//************************** 
void setup() {
  
  frameRate(20);

  size(1200, 800);// screen size
  rectMode(CENTER); // set position of rectangle to center of the rectangle
  gameOver =loadImage ("gameOver.jpg"); // game over screen image 
  intro_screen =loadImage ("intro_screen.jpg"); // main menu screen image
  loseScreen = loadImage ("loseScreen.jpg"); // exit screen image
  gameWin = loadImage ("gameWin.jpg"); // Game Win screen when player reaches Bieber Goal
 
  initialObject (); // call in all the initial position of game objects  
  
  minim = new Minim(this) ; // creat a new Minim, 
  bieberMusic = minim.loadFile("boyfriend.wav"); // Background Music, load wave file and set as bieberMusic
  

}// end setup

//**************************
//  VOID DRAW
//
//************************** 

void draw () 



{ 
  // draw different game states, as described in Global Variables Game States [game state methods are found below]
  if (gameState == INTRO) {
    intro (); } // method intro -- display intro screen
 
  else if (gameState == RUN_GAME)  { //if game state is RUN GAME, then use run game function
    run_game();  }
  
  else if (gameState == GAME_OVER) { // if game state is GAME OVER, then use game over function
    game_over(); }
  
  else if (gameState == EXIT_SCREEN) { // if game state is EXIT SCREEN, then use exit screen function
  exit_screen(); } 
    
  else if (gameState == GAME_WIN) { // if game state is GAME WIN, then use game win function
    game_win(); } 
  
} // end draw 

//**************************
//GAME STATE: INTRO 
//
//**************************

void intro () // intro game function, called in Void Draw
{
  image (intro_screen, 0, 0);  // display intro screen
  
if (keyPressed) 
  {
  if (key == ENTER) // if human presses enter on the keyboard then switch game state to RUN GAME
  {
   gameState = RUN_GAME;
  }
  } // end if key pressed
} // end intro

  
//**************************
// GAME STATE: RUN GAME 
//
//**************************  
  
 void run_game()  // run game function, called in Void Draw
 {  
  drawBackground ();    //display background
  scoreDisplay ();     // display score
  collisionDetect ();  // call in the collision detection functions

  for (int i = 0;  i<bieberArmy.length; i++) // assigning value i to each bieber in the array
  { 
    bieberArmy[i].run(); // bieber array 
  }

  for (int j = 0;  j<waveArray.length; j++)  // assigning value j to each wave in the array
  { 
    waveArray[j].run(); // wave array
  }

  player1.run(); // player 1 function
  window1.run(); // window object function (display window)
  
  if (key == TAB) // if player presses TAB on the keyboard, then pause the game and bring screen to INTRO
  {
    gameState = INTRO;
    
  }
  
} // end run game

//**************************
// GAME STATE: GAME OVER 
//
//**************************

void game_over ()  // game over function, called in Void Draw
{ 

  if (key == ENTER) // if human player presses ENTER, then restart game
  {
     points = 0; 
     initialObject ();
     gameState = INTRO;
    }
     
     else
           { 
             image (gameOver, 0, 0); // print GAME OVER screen
            }// end else 
    
    } // end game over  
    
//**************************
// GAME STATE: EXIT SCREEN
//**************************

void exit_screen ()  // exit screen function, called in Void Draw
{
  if (keyPressed) 
    {
    if (key == 'Y' || key == 'y') // if player presses Y, then switch game state to INTRO
    {
      points = 0; //set points back to 0
      initialObject (); // set up initial game objects
      gameState = INTRO; // switch game state to INTRO
     }
 else
    { 
  image (loseScreen, 0, 0); // when human player leaves the closet, pring loseScreen image 
    }
  } // end key pressed
} // end exit screen 

//**************************
//GAME STATE: GAME WIN
//
//**************************

void game_win() 
  
  { 
  if (key == ENTER) // if human player presses enter, then bring them back to beginning of game 
  {
     points = 0; //set points back to zero
     initialObject (); // re intialize all objects
     gameState = INTRO; // switch game state to INTRO
    } 
     else
           { 
             image (gameWin, 0, 0);  // if the player reaches Bieber Count Goal (ex 30 points), then display game WIN screen - ie player WINS!
          }// end else 
    
    } // end game over  
  

//**************************
//  Collision Detection 
//
//**************************


void collisionDetect () // method used for objects to detect/interact with each other when they collide
{

  //  go through each instance (i) of bieber array
  for (int i = 0; i < bieberArmy.length; i++)
  {
    
    // go through each instance (j) of wave array
    for (int j = 0; j < waveArray.length; j++)
    {

//**************************
//  WAVE DETECTION 
//**************************

      // if waveArray[j] runs out of the closet, then reassign it a new position (ie loop it back in)         
      if ( waveArray[j].xpos >= width-160) 
      {
        
        randomXw = int (random(-10000, -200)); 
        waveArray[j].xpos=  randomXw; // assign a new random x position for wave,  
       
      } 

      // if player1 hits waveArray[j], then switch game state into GAME OVER --- player loses 
      if (dist(player1.xpos, player1.ypos, waveArray[j].xpos, waveArray[j].ypos) <95) // if the center of the two objects positions are less than 95, then:
      { 
        gameState = GAME_OVER;
       
      } // end GAMEOVER if

      // if waveArray[j] runs into bieber, wipe out bieber
      if ( waveArray[j].alive == true) 
      { 
        if (dist(waveArray[j].xpos, waveArray[j].ypos, bieberArmy[i].xpos, bieberArmy[i].ypos) < 95)// if the center of the two objects positions are less than 95, then:
          bieberArmy[i].alive = false; // wipe out bieber
      } //end waveArray[j] bieber function      
   
    } // end waveArray[j]

//**************************
// BIEBER DETECTION 
//**************************
         
    // if bieber runs out of the screen/closet, then assign it a new random X and Y position
    if ( bieberArmy[i].xpos >= width-160 )
    {
      //assign Bieber a new random X position
        randomXb = int (random(-10000, -200)); 
        bieberArmy[i].xpos =  randomXb;
        
        //assign Bieber a new random Y position
        int [] yposBieber = {51, 150, 250, 350, 450, 550, 649 }; 
        int rBypos = int (random(5));
         int randomYb = (yposBieber[rBypos]);
         bieberArmy[i].ypos = randomYb; 
        
      
   
    } // end if bieber exists

    // if bieber is alive, and if player1 hits or hugs bieber, then delete bieber, and add a point
    if ( bieberArmy[i].alive == true) 
    {
      if (dist(player1.xpos, player1.ypos, bieberArmy[i].xpos, bieberArmy[i].ypos) <95) // if distance btwn player and bieber is less than 100, eber
      { 
        bieberArmy[i].alive = false;
        points++;                   // Add 1 point everytime Bieber is hit
        
        if (points == 40)          // IF the total points is equal to 40, then enter game state  WIN
        {
          gameState = GAME_WIN;
          
        }
        } // end, if player player1 hits bieber

    } // end if bieber alive
    
  } // end biebery army array
  
   
//**************************
// PLAYER 1 POSITION
//**************************      
      
      // if player1 leaves the closet, or hits the walls, then print JustinBieber Exit Screen 
      if  ( player1.xpos <= 50) 
      {
        gameState = EXIT_SCREEN;
      }
      
      //PREVENT player from passing through the closet walls
      
      // if player1 x position is greater than the right wall, then bring player back to position width - 170, 
      if ( player1.xpos >= width - 170) // position of the right wall
      {
        player1.xpos = width - 170;
      }  
       // if player1 y position is greater than lower wal position, then bring player back to position at height - 150
      if ( player1.ypos >= height - 150 ) // position of the lower wall
      {
        player1.ypos = height - 150;
      }
         // if player1 y position is less than wall, then bring him back to position 55
       if ( player1.ypos <= 55 ) // position of the higher wall
       {
        player1.ypos = 55;
       }
  
  
} // end collsionDetect function  

//**************************
//  Initial Object set up 
//  -- object initialization 
//**************************   

void initialObject() {

  // create bieber array 
  for (int i = 0; i < bieberArmy.length; i++)
      {
        // random starting X POSITION for bieber array
        randomXb = int (random(-10000, -200));    
      
        //Y starting POSITION:  different starting positions for gameObject, in an array, assign one of them randomly to Bieber Y starting position   
        int [] yposBieber = {51, 150, 250, 350, 450, 550, 649 }; 
        int rBypos = int (random(7));
        //println(yposBieber[rBypos]);
        int randomYb = (yposBieber[rBypos]);
          
        bieberSpeed = 18; // bieber speed
        bieberArmy[i] = new gameObject (randomXb, randomYb, 100, 100, bieberSpeed, 0, "image", "bieberImg.jpg"); //create a new object BieberArmy array
      } // end bieberArray


  // create waveArray  
  for ( int j = 0; j < waveArray.length; j++)
      {
        // random X starting POSITION for wave array
        randomXw = int (random(-10000, -200)); 
 
        // random Y starting POSITION: different starting positions for waves, in an array, assign one of them randomly to wave Y starting position  
        int [] yposWave = { 51, 150, 250, 350, 450, 550, 649 }; 
        int rWypos = int (random(7)); 
        //println(yposWave[rWypos]);
        int randomYw = yposWave[rWypos];
        
        waveSpeed = 18; // wave object speed
        waveArray[j] = new gameObject (randomXw, randomYw, 100, 100, waveSpeed, 0, "image", "climateChange.jpg"); //create a new object waveArray array
      } // end waveArray
      
 // create Player 1 object and initialize 
  player1 = new Player ( 1000, 300, 100, 100, 0, 0, "image", "player1.jpg"); 
  
  // create Window1 object and initialize 
  window1 = new gameObject (50, 780, 400, 40,0,0, "rectangle"); 
  // NOTE: Window was going to be used to display tweets as you are playing game. BUT, I realize that someone who is playing the game may not have 
  // the Twitter Library, so I removed it. The text of the tweets that would appear in the Window Object would be used to distract the player.
  // For example, if the player is reading tweets about Bieber, they could get side swiped by a tsunami - used to represent Climate Change. Thus,
  // the point is to show how we should focus on more important things... not on things like Bieber.

} // end initial set up call 
  
//**************************
//  GAME BACKGROUND
//
//**************************   
  
 void drawBackground () 
{
   background (floorcolor);     // floor color of the closet   
  
 fill (wallcolor); // wall color
 // top wall dimensions and shape
  strokeWeight(2);
  stroke(0);
  beginShape();
  vertex(0, 0);
  vertex(width, 0);
  vertex(width - 50,50);
  vertex(0, 50);
  endShape(CLOSE);
  
  // right wall dimensions and shape
  beginShape();
  vertex(width, 0);
  vertex(width - 50, 50);
  vertex(width - 50, height -50);
  vertex(width,height- 50);
  endShape(CLOSE);
  
  //left wall dimensions and shape
  fill (outwallcolor);
  beginShape();
  vertex(width, height -50);
  vertex(width - 50, height);
  vertex(0, height);
  vertex(0,height- 50);
  endShape(CLOSE);
  
} 
  
//**************************
//  SCORE -- POINTS
//
//************************** 

//display the current score
void scoreDisplay() 
{
  
  PFont font=  loadFont("ACaslonPro-BoldItalic-48.vlw"); // initialize and declare new PFont variable as ACalslonPro
  textFont(font, 40);

// display the current score
  fill (166,35,0); // fill with red color
  text("Bieber Counter: ", 800, 35);    // text and position of Bieber Counter
  text (points, 1070, 35);   // current point value and position

 // display running title of the game : BEWARE THE BIEBER
  fill (166,35,0); // fill with red color
  text ( "Beware the Bieber", 150, 35); // text and position
}

//**************************
//  MUSIC
//
//**************************  

void mousePressed() // when the mouse is pressed, play the bieber music
{
  bieberMusic.play() ;

}

void stop() // function - stop the music when program closes
{
  minim.stop() ;
  super.stop() ;
}
// NOTE: I borrowed this code layout from a game on OpenProcessing : http://www.openprocessing.org/sketch/47667



//**************************
//  TWITTER
//
//**************************  


/*Created Twitter Query to search for Bieber in Twitter. The goal here is to create a new instance/object of Bieber everytime "Bieber" is used in a tweet.
The same method will be used to search for Climate Change. Everytime "Climate Change" is used in a tweet a new instance/object of the wave/tsunami is created 
and appears on your screen. 

The original intent of the game is to show how frequent Bieber is tweeted versus Climate Change, and demonstrate our societies 'backwards' priorities. 


ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey("EEPyqE4Ohr0y9McYqBLUw");
cb.setOAuthConsumerSecret("Ad3PKbTmEQPaYcLLNPWxxUt7K4q6CVsj3imsNgsC4");
cb.setOAuthAccessToken("879022921-NXCaiCe52XMY9AAJEZBFemiubRHC2PxR7dx5NTzI");
cb.setOAuthAccessTokenSecret("Onv0gGSDFKT3RvQaCQDI00t2hTAhxAwQH4Obbo");

Twitter twitter = new TwitterFactory(cb.build()).getInstance();
Query query = new Query("bieber");

  query.setRpp(100);
 
  //Try making the query request.
  try {
    QueryResult result = twitter.search(query);
    ArrayList tweets = (ArrayList) result.getTweets();
*/    
    
  
//**************************
//  GENERAL COMMENTS
//
//**************************  

/* 
For improvements:
- Use Twitter Search Query to create objects
- Use starting X position array to assign position of objects so they do not over lap
- Alernative Ways to Win: Use Time Function to also play the game. Example, if player lasts 1min without touching Bieber, then Player can also win
- Allow Human Player to choose game diffulty. Example, they can toggle with object speed, or number in the array
*/

// new Bieber class inherited from gameObject
class Biebers extends gameObject  // class name Biebers
{
   //constructor with parameters 
   Biebers (int inputX, int inputY, int inputWidth, int inputHeight, int inputSpeedX, int inputSpeedY,String inputGameObjectType, String imageName) 
   { 
     super ( inputX, inputY, inputWidth, inputHeight, inputSpeedX, inputSpeedY, inputGameObjectType,imageName); // extend gameObject 
   }
   
   //methods
   void run()  // when the method run is called, use the function update and display
   {
     update();  // update position
     display(); // display object
   }
   
} // end class 





// create a new class of Players which inherit (extend) from abstract class gameObject
  
class Player extends gameObject 
{
   // constructor with data from gameObject
   Player (int inputX, int inputY, int inputWidth, int inputHeight, int inputSpeedX, int inputSpeedY,String inputGameObjectType, String imageName) 
   { 
     super ( inputX, inputY, inputWidth, inputHeight, inputSpeedX, inputSpeedY, inputGameObjectType,imageName); // extend gameObject
   }
   
   
//methods of Player 
  
   void run() // when run method is called, update and display functions are executed
   {
     update();
     display();
   }
   
   void update()
   {
      int s = 20; // splayer speed
     if( keyPressed )
     { 
          // move left when arrow key LEFT is pressed, by speed
          if ( keyCode == LEFT) 
          {
            xpos = xpos - s;
          }
          //  move right when arrow key RIGHT is pressed, by speed
          if ( keyCode == RIGHT) 
          {
            xpos = xpos + s;
          }
           // move up when arrow key UP is pressed, by speed
          if (keyCode == UP) 
          {
             ypos = ypos - s;
          }
          // move down when arrow key DOWN is pressed, by speed
          if ( keyCode == DOWN) 
          {
            ypos = ypos + s;
          }
  
     } // end keypressed 
      } // end update

 } //end class 

 
  
  

class gameObject {  //new Abstract class

// gameObject data 
  PImage gameObjectImage; // image used in gameObject
  int xpos, ypos, xdim, ydim, xspeed, yspeed; // 
  String gameObjectType;  // used to create other objects such as rectangles
  Boolean alive; // alive, used to display object if alive = true

  gameObject(int inputX, int inputY, int inputWidth, int inputHeight, int inputSpeedX, int inputSpeedY, String inputGameObjectType)
  {
    xpos = inputX; // objects x position
    ypos = inputY; // objects y position
    xdim = inputWidth; // objects width
    ydim = inputHeight; // objects height
    xspeed = inputSpeedX; // objects x speed
    yspeed = inputSpeedY; // objects y speed
    gameObjectType = inputGameObjectType; // game object shapes (ie rectangle)

    alive = true; // set an object as alive, when object is not alive, no longer display
  }     

 // overload gameObject type to create images and characters, other than just object shapes, using same variables
  gameObject (int inputX, int inputY, int inputWidth, int inputHeight, int inputSpeedX, int inputSpeedY, String inputGameObjectType, String imageName) {
    
    xpos = inputX;  // objects x position
    ypos = inputY; // objects y position
    xdim = inputWidth; // objects width
    ydim = inputHeight; // objects height
    xspeed = inputSpeedX; // objects x speed
    yspeed = inputSpeedY; // objects y speed
    gameObjectType = inputGameObjectType; // game object shapes (ie rectangle)
    gameObjectImage = loadImage (imageName); // game Object image - load in PImage from directory

    alive = true;
  }
  void run() // when run function is called, update and display object
  {
    update();
    display();
  }

  void update () {   // update objects new position, using speed x and y
    xpos = xpos + xspeed;  
    ypos = ypos + yspeed;
  }

  void display ()
  {
    if (alive)  // if object is alive, then display
    {
      if ( gameObjectType == "rectangle") // if the gameObject is a rectangle, draw an rectangle
      {
        rect(xpos, ypos, xdim, ydim);  // position and dimension
      } 
      else if (gameObjectType == "ellipse") // if the gameObject is an ellipse, draw an ellipse
      {
        ellipse(xpos, ypos, xdim, ydim);  // position and dimension 
      }
      else if ( gameObjectType == "image" )  // image used for object
      {
        image ( gameObjectImage, xpos, ypos); // image and position of object
      }
    }
  }
}// end class



