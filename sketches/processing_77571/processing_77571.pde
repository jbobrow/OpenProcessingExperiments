
//GLOBAL VARIABLES
int GAMESTATE = 0;                       // determines game state (title, play, end)
boolean hit = false;                     // determines of an ememy hits a player (end game)

int numEnemy= 3;                         // number of enemies
enemy[] enemys = new enemy[numEnemy];    // enemy array

player[] players = new player[1];        // player array

int numCoin= 5;                          // number of coins
//coin[] coins = new coin[numCoin];        // coin array

//---------------------------------------------------SETUP

void setup() {
  size( 512, 512 );                                            // window size
  smooth();                                                    // anti-ailiasing
 
    //Initiate Enemies
   for (int i=0; i < enemys.length; i++) {                     // for each enemy within the array
   enemys[i] = new enemy(random(0,512), random(0,512));        // enemies begin at random positions
    } // end for enemies
    
   //Initiate Player
   for (int i=0; i < players.length; i++) {                    // for each player within the array
   players[i] = new player( width/2, height/2 );               // player starts in the center
   } // end for player
   

  // coins[0] = new coin(random(0,512), random(0,512));         // coins appear at random positions
  
} // end setup

//---------------------------------------------------MAIN DRAW

void draw() {
background( 255 );   

  //Game State set-up
  if(mousePressed==true && GAMESTATE == 0){          // mouse click changes the game state (starting from 0)
   GAMESTATE = 1;                                    // game state is equal to 1 >> title screen to play game
  } // end if
  
   else if( hit == true ){                           // when an enemy hits the player the game ends
   GAMESTATE = 2;                                    // game state changes to 2 and displays the Game Over screen
  } // end if
  
   else if(mousePressed==true && GAMESTATE == 2){    // mouse click changes the game state (game over)
   hit = false;                                      // reset hit to false
   GAMESTATE = 0;                                    // game state is equal to 0 >> game over to title screen
  } // end if
  
  println(GAMESTATE + " --- " + hit + " --- " + mousePressed);

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
 
 } // end draw //-------------------------------------END MAIN DRAW

 

//---------------------------------------------------GAME STATES

void title_screen(){                  // TITLE SCREEN = GAMESTATE 0
  background(137, 167, 39);
  fill (255);
  PFont titleFont = createFont("arial", 48);
  textFont(titleFont);
  textAlign(CENTER);
  text("THE GAME", width/2, height/2);
  
  PFont subFont = createFont("arial", 15);
  textFont(subFont);
  textAlign(CENTER);
  text("Click anywhere to begin. Use the arrow keys to move.", width/2, height/1.5);
  textFont(subFont);
  textAlign(CENTER);
  text("Avoid the green circles!", width/2, height/1.4);
}//end intro

//---------------------------------------------------STATE PLAY (MAIN DRAW)
void play(){                          // STAR GAME = GAMESTATE 1
  
    //Draws enemies
     for (int i=0; i < enemys.length; i++) {
        enemys[i].draw();
        enemys[i].attack(players[0].localX, players[0].localY);
     }// end for
     
     //Draws player
        players[0].draw();
        players[0].move();

    //Draws coins
     /*  
       float pauseValue= 3000;
       float pause= time+pauseValue;
       time= millis();
 
    if(time/pauseValue >= counter){      
      coin.show= true;
        counter= counter+1;
    }

  else {coin.show=false;}

  coin.draw();
        */
}//end play
//---------------------------------------------------END STATE PLAY (MAIN DRAW)

void gameOver(){                      // GAME OVER = GAMESTATE 2
  background(255, 0, 0);
  fill (255);
  PFont titleFont = createFont("arial", 48);
  textFont(titleFont);
  textAlign(CENTER);
  text("YOU LOSE", width/2, height/2);
}//end gameOver

