
// THIS IS A BREAKOUT GAME
// BREAK THE BLOCKS TO COMPLETE THE GAME
// NO RESTRICTIONS ON THE AMOUNT OF BALLS

//  FUNCTIONS
        boolean paused = true; // function to pause game
        boolean done = false;  // function to determine if blocks are done
                               // and to reset blocks if mousepressed after game over

//  PVector CLASS
        PVector pos; // Class for position
        PVector vel; // Class for velocity

//  ARRAYS
        int[] []  stones; // array for bricks


//  SETUP
        void setup () {
        size ( 600, 600 );  // size of screen
        smooth ();
        frameRate (50); // framerate set at 50, not too fast
        pos = new PVector ( width/2, height/2 ); // position of ball
        vel = new PVector ( 10, -5 ); // velocity of ball
  
        stones = new int[13] [5]; // setting up first set of bricks 13 along
        for ( int x=0; x<13; x++ ) { //  x axis and 5 down y axis
        for ( int y=0; y<5; y++ ) {//
        stones[x] [y] = 1;    
        }
        }
    
        // font created for on screen display
        textFont( loadFont( "Krungthep-20.vlw") );  
        }


//  DRAW
       void draw () {
       background ( 0 ); // background and colour
       paused (); // pause function
       ball (); // ball function
       bat (); // bat function
       bricks (); // bricks or stones function
  
       // when paused text appears on screen
       if ( paused ) {
       textSize( 25 ); // text size
       fill( 255 );      // text colour
      // text displayed if game paused
      text( "PRESS MOUSE BUTTON TO CONTINUE", 75, 250 ); 
      }


 // when all bricks gone game over appears in text 
 //in random colours flashing
      if ( done ) {
      paused = true;  // function call game over
      fill(random ( 255), 0, 100 ); // text colour flashing
      textSize( 48 );         // text size
      // text displayed when game is over
      text( "GAME OVER !", 125, 300 ); 
      }
      }


//  CLASS BALL

      void ball () {
      fill ( 0, 255, 0 );    // ball colour
      ellipse ( pos.x, pos.y, 20, 20 ); // ball position and size
      }


//  UPDATE FUNCTION

      void update () {
      pos.add (vel); 
  
//  UPDATING CHANGING POSITIONS OF BALL
  
      if (pos.x + 10 > width || pos.x -10 < 0 ) {
      vel = new PVector ( -vel.x, vel.y );
      }
  
      if (pos.y - 10 < 0) {                    // Makes it visible to player ball has 
      vel = new PVector ( vel.x, -vel.y );   // dropped through bottom of screen
      }
  
      if ( pos.y + 10 > height) {
      vel = new PVector ( -vel.x, vel.y );
      pos = new PVector ( width/2, height/2 );
      paused = true;
      }
 }


//  CLASS BAT OR PADDLE 
      void bat () {
      fill ( 255 ); // colour of bat or paddle
      rect ( mouseX-35, 570, 70, 20 ); // bat, controlled with mouse alond x-axis
                                   // and size
  
  // check if bat or paddle was hit by ball
      if ( pos.x + 10 > width || pos.x -10 < 0 ) {
      vel = new PVector ( vel.x, -vel.y );
      }
  
      if ( pos.y + 10 > height || pos.y -10 <0 ) {
      vel = new PVector ( -vel.x, vel.y );
      }
  
  // this function maps the distance of the ball to
  // the mousepointer to the x coordinate of the speed
      if (pos.y >= 560 && pos.x >= mouseX - 35 && pos.x <= mouseX +35 ) {
      vel = new PVector (  map(pos.x - mouseX, -35, 35, -10, 10), -vel.y );
      }                                 // -35, 35 was used because paddle is 70
}                                      // the x-axis is ranged -10, 10



//  CLASS BRICKS
     void bricks () {
  // check if ball hits blocks
     for (int x = 0; x < 13; x++) {
     for (int y = 0; y < 5; y++) { //   CHECKS IF BALL HITS BRICKS
     if (stones [x] [y] > 0) {  //  =============================
     if (pos.x + 10 > 10 + x*45 && pos.x - 10 < 10 + x*45 + 45
     && pos.y + 10 + y*20 > 10 && pos.y - 10 < 10 + y*20 + 20) {
     stones [x] [y] = 0;
          
  // change velocity in y direction
  // if block is hit bottom or top
     if (pos.x > 10 + x*45 && pos.x < 10 + x*45 + 45) {
     vel = new PVector ( vel.x, -vel.y );
     }
          
  // change velocity on x-axis if block hit on side
     if (pos.y > 10 + y*20 && pos.y < 10 + y*20 + 20) {
     vel = new PVector ( vel.x, -vel.y );
     }
     }
     }
     }
 }

 // if all blocks are gone: game over  
    done = true;  
    for (int x = 0; x < 13; x++) {
    for ( int y = 0; y < 5; y++) {
    if (stones [x] [y] > 0) {
    done = false; // if there are blocks left game continues
    fill ( 0, 0, 210, 255 );
    rect ( 10 + x*45, 10 + y*20, 44, 20 );
    }
    }
    }
  
    if ( done ) {
    paused = true;  // to check to see if all blocks gone
    }
}


//  PAUSE FUNCTION CALL

    void paused () {
    if ( !paused ) { // IF Game NOT Paused
    update();
    }
  
 // to stop ball bouncing on the bottom 
 // and to return to the start position 
 // if it goes through the bottom
    if (pos.x + 10 > width || pos.x - 10 < 0 ) {
    vel = new PVector ( vel.x, -vel.y );
  
    }
    if ( pos.y + 10 > height || pos.y - 10 < 0) {
    vel = new PVector ( -vel.x, vel.y );
    }
}


//  MOUSE PRESSED FUNCTION
 
   void mousePressed() {
   paused = !paused;
  
 // if the game is over and mouse pressed then new load of bricks 
 // are loaded and game starts again
   
   if ( done ) {
   for( int x = 0; x < 13; x++ ) {
   for( int y = 0; y < 5; y++ ) {
   stones[x][y] = 1;
   }
   
   }
   pos = new PVector( width/2, height/2 ); // reset PVectors
   vel = new PVector( 10, -5 );            //==================
   done = false;
   }

}




