

//VARIABLES
  //Player object
  //Enemy class
  //Bullet class
  //int to keep track of the score
  //int to keep track of game stage
  //int to keep track of lives



//SETUP
  //window size
  //create objects: player, enemy, bullet
  //set game stage to inro
  //load up background


//DRAW
  //tell program which function to run depending on game stage


//MOUSEPRESSED
  //depending on game stage, will either fire the bullet or start a new game
  
  
//CLASSES

//bullet class
  //data
    // load the bullet image
    //x position 
    //y position
    // initialize speed variable
  //constructor
    // display bullet image
    // set the speed of the bullet
  //functions
    //display
      //draw the bullet image at x and y, move bullet
      
//player class
  //data
    //load image
    //create variables for x and y position
  //constructor
    //display player image
  //functions
    //move
      //set player position, with "drag" function
    //display
      //to show player on the field 
      
//enemy class
  //data
    //int x position
    //int y position
    //load zombie image
    //zombie speed
  //constructor
    //display zombie image
  //functions
    //display
      //draw zombie at x and y position
    //move
      //increase y position by speed variable
      
      
////FUNCTIONS

//boolean function to determine if the bullet has made contact with a zombie

//playGame:function to determine what happens in gameplay
  //initialize background, text size and position
  //show enemy on screen
  //move ozmbie towards player
  //if bullet hits zombie, add one to score
  //if zombie hits the wall, take away a life
  //show the player, move the player
  //if bullet makes contact with the zombie, disappear and reset bullet position on the player  

//intro: function that plays at the very start of the game
  // background black, text white, display title of game
  
//gameOver: function that plays when player reaches 0 lives
  // background red, text black, display game over title

