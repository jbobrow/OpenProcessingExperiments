
//Gamestate Variables
int GAMESTATE = 0;                         // determines game state (title, play, end)
boolean restart= false;                    // resets the game
PImage backgroundTitle;
PImage backgroundSpace;
PImage backgroundOver;

//Enemy Variables
boolean hit = false;                       // determines of an ememy hits a player (end game)
int numEnemy= 3;                           // number of enemies
enemy[] enemys = new enemy[numEnemy];      // enemy array
PImage enemyShip;

//Player Variables
player[] players = new player[1];          // player array
float velX, velY;                          // player velocity for movement
int   playerSpeed = 450;                   // controls speed of player
int   last;
boolean movingX = false;                   // true when moving in x, false otherwise
boolean movingY = false;                   // true when moving in y, false otherwise
PImage playerShip;

//Coin Variables
int numCoin= 50;                           // number of coins
coin[] coins = new coin[numCoin];          // coin array
boolean show= false;                       // coins are hidden at the start
boolean coinHit= false;                    // detects if player collects coin
int counter = 0;                           // counts coins hit
int score;                                 // determines score (coins collected)
PImage coinHolder;

//--------------------------------------------------------------------------------------------------------------SETUP

void setup() {
  size( 512, 512 );                                            // window size
  smooth();                                                    // anti-ailiasing
  int last = millis();
  velX = 0;                                                    // player X movement is zero at start
  velY = 0;                                                    // player Y movement is zero at start
  
  // Images
  imageMode (CENTER);
  playerShip = loadImage("player.png");                        // player ship image
  enemyShip = loadImage("enemy.png");                          // enemy ship image
  coinHolder = loadImage("coin.png");                          // coin holder image
  backgroundTitle = loadImage("titlescreen.jpg");              // title screen background image
  backgroundSpace = loadImage("background.jpg");               // play screen background image
  backgroundOver = loadImage("overscreen.jpg");                  // game over background image

    //Initiate Enemies
//   for (int i=0; i < enemys.length; i++) {                     // for each enemy within the array
   enemys[0] = new enemy( 100,       100 );                      // 1st enemy position
   enemys[1] = new enemy( width-100, height-100 );               // 2nd enemy position
   enemys[2] = new enemy( width/2,   height-50  );               // 3rd enemy position
//    } // end for enemies
    
   //Initiate Player
   for (int i=0; i < players.length; i++) {                    // for each player within the array
   players[i] = new player( width/2, height/2 );               // player starts in the center
   } // end for player
   
    //Initiate Coins
    for (int i=0; i < coins.length; i++) {     
    coins[i] = new coin(random(20,512-20), random(20,512-20)); // coins appear at random positions
    } // end for coins 
 
} // end setup 

//-------------------------------------------------------------------------------------------------------------PLAYER MOVEMENT

void keyPressed() {
  if ( key == 'a' ) {                  // move left 
    velX =    -playerSpeed;            // moving speed
    movingX = true;
  } else if ( key == 'd' ) {           // move right
    velX =    playerSpeed;             // moving speed
    movingX = true;
  } else if ( key == 'w' ) {           // move up
    velY =    -playerSpeed;            // moving speed
    movingY = true;
  } else if ( key == 's' ) {           // move down
    velY =    playerSpeed;             // moving speed
    movingY = true;
  } // end else if
} // end keyPressed

void keyReleased() {
  if (( key == 'a' ) || ( key == 'd' )) {                // prevents impossible movement
    velX = 0;
  } else if (( key == 'w' ) || ( key == 's' )) {         // prevents impossible movement
    velY = 0;
  } 
} // end keyReleased
  

//-------------------------------------------------------------------------------------------------------------MAIN DRAW

void draw() {
background( backgroundSpace );   

   //Game State set-up
   if(mousePressed==false && GAMESTATE==0 && restart==true){    
    restart= false;
   }//end if
   
   else if(mousePressed==true && GAMESTATE==0 && restart==false){      // changes from start screen to game play
    score = 0;                                                         // score resets to 0
    GAMESTATE= 1;                                                      // gamestate now becomes 1 (play)
   }//end else if  
          
  if( hit == true ){                                 // when an enemy hits the player the game ends
   GAMESTATE = 2;                                    // game state changes to 2 and displays the Game Over screen
  } // end if
  
   else if(mousePressed==true && GAMESTATE == 2){    // mouse click changes the game state (game over)
   hit = false;                                      // reset hit to false
   GAMESTATE = 0;                                    // game state is equal to 0 >> game over to title screen
} // end if

 //DEFINE GAME STATES--------------------------
 if  (GAMESTATE==0){ 
  title_screen ();                    // if game state is 0, display the title screen
 } // end if
 else if (GAMESTATE==1){
  play();                             // if game state is 1, start the game
 } // end if
 else if (GAMESTATE==2){
  gameOver();                         // if game state is 2, the game is over (score screen)
 } // end if
 
 } // end draw //----------------------------------------------------------------------------------------------END MAIN DRAW

 

//-------------------------------------------------------------------------------------------------------------GAME STATES

void title_screen(){                  // TITLE SCREEN = GAMESTATE 0
  background( backgroundTitle );
}//end intro

//-------------------------------------------------------------------------------------------------------------STATE PLAY (MAIN DRAW)
void play(){                              // START GAME = GAMESTATE 1
  
   score = counter*10;                    // determines score (coins collected)
   
  
  fill (255, 150);
  PFont scoreFont = createFont("century gothic", 14);
  textFont(scoreFont);
  textAlign(LEFT);
  text("SCORE: "+ score, 230, height-10);
  
     //Draws enemies
     for (int i=0; i < enemys.length; i++) {
        enemys[i].draw();                                              // draw enemies
        enemys[i].attack(players[0].localX, players[0].localY);        // enemies move to player location (and hit)
     }// end for
     
     //Draws player
        players[0].move();                                             // make player movable
        players[0].draw();                                             // draw player

     //Draws coins
        for (int i=0; i < coins.length; i++) {
         coins[counter].show= true;                                       // show the first coin from game start
           if (coins[i].coinHit == true && coins[i].show == true) {       // if a coin is both hit and showing
             counter = constrain(counter, 0, numCoin);                    // limit counter to length of array
             counter++;                                                   // increase the counter (refer to next coin)
             coins[counter].show= true;                                   // the next coin is displayed
           } // end if
           else {show=false;} // end else                                 // otherwise all other coins do not show
         coins[i].collission( players[0].localX, players[0].localY );     // collission with player and coins
         coins[i].display();                                              // draw coins
     } // end for

}//end play
//-------------------------------------------------------------------------------------------------------------END STATE PLAY (MAIN DRAW)

void gameOver(){                      // GAME OVER = GAMESTATE 2
  background( backgroundOver );
  
  fill(255,150);
  PFont scoreFont = createFont("arial", 20);
  textFont(scoreFont);
  textAlign(CENTER);
  text(score, width/2, 470);
  
  if(mousePressed==true && GAMESTATE==2){
    println("restart commence");
   reset(); //reset everything in your play section so you dont die right away
    restart=true;
    GAMESTATE=0;
  }
  
}//end gameOver

//-------------------------------------------------------------------------------------------------------------RESET

// reset all variables so you wont immediately go to game over on restart
void reset(){
  
   hit= false;

   enemys[0].xpos= 100;
   enemys[0].ypos= 100;                      // 2nd enemy position
   
   
   enemys[1].xpos= width-100;
   enemys[1].ypos= height-100;              // 2nd enemy position
   
   enemys[2].xpos= width/2;
   enemys[2].ypos= height-50; 
   
   players[0].localX= width/2;
   players[0].localY= height/2;
   
   counter = 0;

   
} // end reset


