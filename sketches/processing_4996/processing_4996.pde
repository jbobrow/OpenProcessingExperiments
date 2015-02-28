
//             1  l  0  0             //
//  kk         1  l  0  0             //
//  kk            l                   //
//  kk     hh     l                   //
//  kk            l                   //
//  kk            l                   //
//                l                   //
//                l                   //
//                l                kk //
//                l                kk //
//                l                kk //
//                l                kk //
//                l                kk // 
//                l                   //
//                                    //
// PONG CLONE By Colin Wren
//
// Feel Free to reuse this code however you see fit

// Variables for the game
//

// stop everything from moving at the start
boolean started =  false;
// This controls the background colour
int bgc = 0;
// This controls teh players paddle colour
int ppc = 255;
// Boolean to see if the background is black or not
boolean black_bg = true;
// set the x coords for the ball
int bally = 300;
// set the y coords for the ball
int ballx = 400;
// speed of the ball
int speed = 2;
// set the x direction of the ball
int dirx = speed;
// and the y
int diry = speed;
//set the score for computer
int score1 = 0;
// set the score for player 
int score2 = 0;
//set up the possible position of the ball
float possibleposition = 300;
// set the difficulty
float difficulty = 1.5;

// Set up the environment
//


void setup(){
  // size of the window
  size (800,600);
  // framerate of the game
  frameRate(60);
 // load the font we're going to use to display the score
 PFont font = loadFont("pong.vlw");
 // set how big it will be displayed
 textFont (font, 30);
 
 
 
}







// draw the frame (this is where all teh magic happens)
//

void draw(){
  // if player hasn't clicked to start game do nothing
  if(started == false){
   // set the bachground to black
    background(0);
    // load the pong font
    PFont font = loadFont("pong.vlw");
    // make the text white
    fill(255,255,255);
    // make the font 100 pixels
    textFont (font, 100);
    // put the title up top
    text("Pong", 290, 100);
    // make the fnt white
    fill(255,255,255);
    // make the font 20 pixels
    textFont(font, 20);
    // put the authors name in hte right bottom corner
    text("2009 Colin Wren", 620, 580); 
    // fill the rectangle white
    fill(255,255,255);
    // create a rectangle in the middle near the top
    rect(300, 200, 200, 75);
    // fill the rectanlge white
    fill(255,255,255);
    // put another rectange under neath the other rectangel
    rect(300, 300, 200, 75);
    // fill the other rectangle white
    fill(255,255,255);
    // create another rectangle under the other 2
    rect(300, 400, 200, 75);
    // fill the font black
    fill(0,0,0);
    // make the font 50 pixels
    textFont(font, 50);
    // type easy ontop of the first rectanlge
    text("Easy", 345, 255);
    // fill it black
    fill(0,0,0);
    // type medium ontop of the second
    text("Medium", 320, 355);
    // fill it black
    fill(0,0,0);
    //type hard ontop of the bottom one
    text("Hard", 345, 455);
    // if the mouse is pressed within the confines of the first rectangle
    if(mousePressed && mouseY < 275 && mouseY > 200 && mouseX < 500 && mouseX > 300){
      //reset the scores 
      score1 = 0;
      score2 = 0;
      // change the enemies speed to 1.5
      difficulty = 1.5;
      // change the game speed to 2
      speed = 2;
      // start the game
      started = true;
    }
    // if its pressed within the second
    if(mousePressed && mouseY < 375 && mouseY > 300 && mouseX < 500 && mouseX > 300){
      //reset the scores 
      score1 = 0;
      score2 = 0;
      // change the enemies sped to 2
      difficulty = 2;
      // change the game speed to 3
      speed = 3;
      // start the game
      started = true;
    }
    
   // if its pressed within the third
    if(mousePressed && mouseY < 475 && mouseY > 400 && mouseX < 500 && mouseX > 300){
      //reset the scores 
      score1 = 0;
      score2 = 0;
      // change the enemies speed to 3
      difficulty = 3;
      // chang ethe games speed to 4
      speed = 4;
      // start the game
      started = true;
    }
  }else{
  
  // set the background colour using the bgc variable
  background(bgc,bgc,bgc);
  PFont font = loadFont("pong.vlw");
 // set how big it will be displayed
 textFont (font, 30);
 // display the scores either side of the divide
  text(score1, 320,30);
  text(score2, 420, 30);
  // if the background is black then increase bgc until it is white
  if(black_bg == true){
  bgc ++ ;
  }
  // if the background is white then decrease bgc unril its black
  else if(black_bg == false) {
    bgc -- ;
  }
  // if bgc is 0 (black), black_bg is true
  if(bgc == 0){
    black_bg = true;
  }
  // if bgc is 255 (white), black_bg is false
  if(bgc == 255) {
    black_bg = false;
  }
  
  

  
  
  
  // set the rectangle drawing mode to Center  
  rectMode(CENTER);
  // draw a 10 x 80 rectangle 10 pixels away from the right of the screen
  // that follows the mouse's Y position
  rect(790, mouseY, 10 , 80);
  // Fill it using the ppc value
  fill(ppc,ppc,ppc);
  // make sure theres no stroke
  noStroke();
  // if the backgrounds black make the paddle white 
  if(black_bg == true){
    ppc -- ;
  }
  // if the backgrounds white make the paddle black
  else if(black_bg == false){
    ppc ++;
  }
  
  
  // set up the enemy paddle
   rectMode(CENTER);
   // this paddle will try to guess the balls position and will aim towards it 
   rect(10, possibleposition, 10, 80);
   // no stroke for the ball
   noStroke();
   // make sure the fill is opposite to the background
   fill(ppc,ppc,ppc);
   // this is a simple script that makes the enemy paddle move towards where the ball is going it is dependant on the speed
   // defined under the difficulty
   if(possibleposition < bally){
     possibleposition = possibleposition + difficulty ;
   }
   if(possibleposition > bally){
     possibleposition = possibleposition - difficulty ;
   }
   
     
  
  // set up the ball 
  
  // make the ball move 
  bally = bally + diry;
  ballx = ballx + dirx;
  
  // create the ball
  rectMode(CENTER);
  rect(ballx, bally, 10,10);
  noStroke();
  fill(ppc,ppc,ppc);
  
  // make sure the ball bounces back
  
  // if the ball is where the player is on the x axis and is within the confines of the paddle
  if (ballx == 790 && bally <= mouseY+40 && bally >= mouseY-40) {
    // if its less than center make it go upwards
      if (bally < mouseY) { 
         dirx =  - speed;
         diry =  - speed;
      }
      // if its more than center make it go downwards
      if (bally > mouseY) { 
         dirx =  - speed;
         diry =  + speed;
      }
      // if its dead on make it shoot dead on
      if (bally == mouseY) {
         dirx =  - speed;
         diry = 0  ;
      }
   }
   // now do the same for the enemy paddle position
   if (ballx == 10 && bally <= possibleposition + 40 && bally >= possibleposition - 40){
     // if its less than center make it go upwaeds
    if (bally < possibleposition) { 
         dirx =  speed;
         diry =  - speed;
      }
      // if its more than center make it go downwards
      if (bally > possibleposition) { 
         dirx =  speed;
         diry =  + speed;
      }
      // if its center make it go dead on
      if (bally == possibleposition) {
         dirx =  speed;
         diry = 0  ;
      }
  
   } 
 
   
   // bounce off the top and bottom walls
   if ( bally == 600) {
      diry =  - speed;
   }
   if ( bally == 0) {
     diry =   speed;
   }
   
   if (ballx < 0){
     // if the enemy paddle doesn't hit the ball then add one to the players score
    score2 ++;
    delay(1000);
    ballx = 400;
    bally = 300;

   }
   if(ballx > 800){
     // if the player doesnt hit the ball then add one to the enemies score
     score1 ++;
    delay(1000);
    ballx = 400;
    bally = 300;

  
   }
   // if the players score equals ten then end the game  
   if(score2 == 10){
     background(0);
     textFont (font, 100);
     text("A winner is You!!!", 100,300);
     fill(255);
     
    
   }
   // if the enemies score equals ten then end the game
   if(score1 == 10){
     background(0);
     textFont (font, 100);
     text("You lost!!!", 250,300);
     fill(255);
     
   }
  } 
}




