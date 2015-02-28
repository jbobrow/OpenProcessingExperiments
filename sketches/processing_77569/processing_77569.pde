
boolean restart = false;
int GAMESTATE = 0;
//building array 
building[] buildings; 
player player1;


//Building Position variables Array---------------------
float xpos[]  = {    0, 1100, 1950, 3150, 4000 };
float ypos[]  = {  380,  300,  220,  460,  380 };
float xpos2[] = { 1000, 1850, 2950, 3900, 5000 };
float ypos2[] = {  720,  720,  720,  720,  720 }; 


//---------------------------------------------------SETUP
   
void setup(){
  size (1000,580); // size of the window---
  smooth();       // antialiasing---------
  
  player1 = new player();
  
  buildings = new building [5];             // allocate the array
  for (int i=0; i<buildings.length; i++){     // instantiate the buildings
    buildings[i]= new building(xpos[i],ypos[i],xpos2[i],ypos2[i]);
  }//end new building array call

}//End Setup 

//---------------------------------------------------MAIN DRAW

void draw(){
  background (255);
  
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
      background (155);
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
  background(255, 0, 0);
}//end intro

//---------------------------------------------------STATE PLAY (MAIN DRAW)
void play(){
  player1.gravity();            // update player position first
                                  //   this is the "normal" case that happens
                                  //   most of the time, while collision is
                                  //   something of a special case that
                                  //   "preempts" the player's position, so
                                  //   collision needs to happen after
  
    if (restart == true) {
       xpos[0]  = 0;
       ypos [0] = 380;
       xpos2 [0] = 1000;
       ypos2 [0] = 720;
       fill (255, 0, 0 ); ellipse (width/2, height/2, 30, 30); 
     } 
      
  
    for (int i=0; i<buildings.length; i++) {
      buildings[i].moveBuilding     ( 5 );
      buildings[i].draw             (   );
      buildings[i].restart          ( xpos[4]  );
      
      if ( buildings[i].collision( player1.posX, player1.posY ) ) {  // changed to return boolean
                                                                     //   don't really need that
                                                                     //   extraneous "boo" collision
                                                                     //   variable, just need to 
                                                                     //   know if collision happened
                                                                     
        player1.contact( ypos[i] );                                    // if so, then override the
      }                                                                //   player's position
      
    }//end for
  
    player1.draw();                // now we're sure that the player's position 
                                   //   has been updated, so go ahead and draw 
    
  
   
   } //---------------------------------------------------END STATE PLAY (MAIN DRAW)
   
   void gameOver(){
      background(0, 0, 255);
    }//end gameOver
   

 

