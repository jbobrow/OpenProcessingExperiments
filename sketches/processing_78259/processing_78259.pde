
boolean restart = false;
int GAMESTATE = 0;
//gif set up
import gifAnimation.*;
//Gif Marine;
//building setup
PImage building;
PImage shakurasBG;
//VV old code down there
//PImage Marine; //declare variable "a" of type PImage

//building array 
building[] buildings; 
player player1;

float speedRate = 8;

//Building Position variables Array---------------------
float xpos[]  = {    0, 1200, 2150, 3350, 4300 };
float ypos[]  = {  380,  300,  220,  460,  380 };
float xpos2[] = { 1000, 1950, 3150, 4100, 5000 };
float ypos2[] = {  720,  720,  720,  720,  720 }; 

float buildwidth[]  = { 1000, 750, 1000, 750, 700 };


//---------------------------------------------------SETUP
   
void setup(){
  size (1000,580); // size of the window---
  smooth();       // antialiasing---------
  
  //setup and load gif, loop gif
 // Gif Marine = new Gif(this, "Marine.gif");
	//Marine.loop();
  
  //initialise Marine
  /*Marine = loadImage ("Marine.gif"); //load Marine image into the program
  */
  //load images
  building = loadImage ("Building.png"); //load building image into the program
  shakurasBG = loadImage ("shakurasBG.jpg"); //load background
  
  //---------------------------------------------------------------
  player1 = new player();
  
  buildings = new building [5];             // allocate the array
  for (int i=0; i<buildings.length; i++){     // instantiate the buildings
    buildings[i]= new building(xpos[i],ypos[i],xpos2[i],ypos2[i]);
  }//end new building array call

}//End Setup 

//---------------------------------------------------MAIN DRAW

void draw(){
  background (shakurasBG);
  
  
  
    println(restart + " --- " + xpos[4]);
    
    if(mousePressed==true && GAMESTATE == 0){
       GAMESTATE =1; 
      }// end if
      
      else if (player1.posY > height){
       GAMESTATE = 2; 
      }
    
    else if(mousePressed==true && GAMESTATE == 2){    // mouse click changes the game state (game over)
       GAMESTATE = 0;                                 // game state is equal to 0 >> game over to title screen
      } // end if
     //-------------
      
     if  (GAMESTATE==0){
      intro(); 
     }
     else if (GAMESTATE==1){
      play(); 
     }
      else if (GAMESTATE==2){
      gameOver(); 
     }
  
}//end draw--------------------------------------------------


// note:
// the keyPressed() routine needs to be at the same level as the main setup()
// and draw() routines in order for processing to see and call it.  putting it
// within a class "hides" it, so it wasn't getting called at all when it was 
// inside class player.
//
// did the following:
//   pulled keyPressed() out so it would catch the key press
//   modified the player version to be jump() instead
//   added a routine in building to test whether player in the extents (in X)
//
void keyPressed() {
  if ( key == ' ' ) {      // if we get a ' ' key
    
    for (int i=0; i<buildings.length; i++) {                            // loop over the buildings
    
      if ( buildings[i].inExtentsX( player1.posX, player1.tposX ) ) {     // if player in extents
        player1.jump( i );                                                  // then player jumps
      }
    }
  }
}//end keypressed-----------------------------

void intro(){
  background(155);
  fill (255);
  PFont titleFont = createFont("arial", 48);
  textFont(titleFont);
  textAlign(CENTER);
  text("Kanabaulte", width/2, height/2);
  PFont explainFont = createFont("arial", 20);
  textFont(explainFont);
  text ("Press space to jump. Click to start", width/2, 400);
}//end intro


//---------------------------------------------------STATE PLAY (MAIN DRAW)
void play(){
  
  //score variables
  float score = millis()/100 * speedRate/100 ;
  PFont scoreFont = createFont("arial", 15);
  textFont(scoreFont);
  textAlign(LEFT);
  text(score, 20, 20);
  
  
    //----------------------------------------RESTART BUILDING
  
    if (buildings[4].xpos == 0){
       restart = true;
       }//move
       if (buildings[4].xpos != 0){
       restart = false;
       }//move
  
  player1.gravity();            // update player position first
                                  //   this is the "normal" case that happens
                                  //   most of the time, while collision is
                                  //   something of a special case that
                                  //   "preempts" the player's position, so
                                  //   collision needs to happen after
  
  
  //----------------------------------------------------------------RESTART
   /*
    if (restart == true) {             //if the end building's front x hits zero, load the first building
       buildings[0].xpos  = 0;
       buildings[0].ypos  = 380;
       buildings[0].xpos2 = 1000;
       buildings[0].ypos2 = 720;
       buildings[1].xpos  = 1100;
       buildings[1].ypos  = 300;
       buildings[1].xpos2 = 1850;
       buildings[1].ypos2 = 720;
       fill (255, 0, 0 ); ellipse (width/2, height/2, 30, 30); 
     } */
  //-----------------------------------------------------------------------

  
    for (int i=0; i<buildings.length; i++) {
      speedRate = speedRate + 0.0005;
      buildings[i].moveBuilding     ( speedRate );
      buildings[i].display          ( buildwidth[i] );
      
      if ( buildings[i].collision( player1.posX, player1.posY ) ) {  // changed to return boolean
                                                                     //   don't really need that
                                                                     //   extraneous "boo" collision
                                                                     //   variable, just need to 
                                                                     //   know if collision happened
                                                                     
        player1.contact( ypos[i] );                                    // if so, then override the
      }                                                                //   player's position
      
    }//end for--------------------------------------------------------------------
  
    player1.draw();                // now we're sure that the player's position 
                                   //   has been updated, so go ahead and draw 
    
  
   
   } //---------------------------------------------------END STATE PLAY (MAIN DRAW)
   
   void gameOver(){
      background(155);
      fill(255);
      PFont titleFont = createFont("arial", 48);
  textFont(titleFont);
  textAlign(CENTER);
  text("You lost because you can focus on that later.", width/2, height/2);
    }//end gameOver
   

 

